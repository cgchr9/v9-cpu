// os.c - based on xv6 with heavy modifications
#include <u.h>
#include <lab.h>
#include <lab_utils.h>
#include <lab_stdout.h>
// *** Globals ***

struct proc proc[NPROC];
struct proc *u;          // current process
struct proc *init;
char *mem_free;          // memory free list
char *mem_top;           // current top of unused memory
uint mem_sz;             // size of physical memory
uint kreserved;          // start of kernel reserved memory heap
struct devsw devsw[NDEV];
uint *kpdir;             // kernel page directory
uint ticks;
int nextpid;

// Allocate a user program area that begins with a magic string
char user_program[8192] = {'u', 's', 'e', 'r', 'p', 'r', 'o', 'g', 'r', 'a', 'm',
                           0x92, 0x23, 0x46, 0x88, 0xA6, 0xE5, 0x77, 0x02};

// *** Code ***


// page allocator
char *kalloc()
{
  char *r; int e = splhi();
  if (r = mem_free) mem_free = *(char **)r;
  else if ((uint)(r = mem_top) < P2V+(mem_sz - FSSIZE)) mem_top += PAGE; //XXX uint issue is going to be a problem with other pointer compares!
  else panic("kalloc failure!");  //XXX need to sleep here!
  splx(e);
  return r;
}

kfree(char *v)
{
  int e = splhi();
  if ((uint)v % PAGE || v < (char *)(P2V+kreserved) || (uint)v >= P2V+(mem_sz - FSSIZE)) panic("kfree");
  *(char **)v = mem_free;
  mem_free = v;
  splx(e);
}


panic(char *s)
{
  asm(CLI);
  out(1,'p'); out(1,'a'); out(1,'n'); out(1,'i'); out(1,'c'); out(1,':'); out(1,' '); 
  while (*s) out(1,*s++);
  out(1,'\n');
  asm(HALT);
}

// *** syscalls ***
int svalid(uint s) { return (s < u->sz) && memchr(s, 0, u->sz - s); }
int mvalid(uint a, int n) { return a <= u->sz && a+n <= u->sz; }

int write(int fd, char *addr, int n)
{
  int r, h[2]; struct file *f;
  printf("%s", addr);
  return n;
}

uint *walkpdir(uint *pd, uint va);


int exec(char *program, char **argv)
{
  char *s, *last;
  uint argc, sz, sp, *stack, *pd, *oldpd, *pte;
  struct { uint magic, bss, entry, flags; } *hdr;
  char cpath[16];  // XXX length, safety!
  int i, n, c;
  int cur_page, program_page = 2;
  char *newpd;

  program = user_program;
  for (argc = 0; ; argc++) {
    if (argc >= MAXARG || !mvalid(argv + argc, 4)) return -1;
    if (!argv[argc]) break;
    if (!svalid(argv[argc])) return -1;
  }

  // Check header
  hdr = program;
  if (hdr->magic != 0xC0DEF00D) {
    printf("HDR magic %x incorrect\n", hdr->magic);
    goto bad;
  }
  pd = memcpy(kalloc(), kpdir, PAGE);

  // load text and data segment   XXX map the whole file copy on write
  for (cur_page = 0; cur_page < program_page; cur_page++) {
    newpd = kalloc();
    memcpy(newpd, program + PAGE * cur_page, PAGE);
    mappage(pd, PAGE * cur_page, V2P + newpd, PTE_P | PTE_W | PTE_U);
  }
  // allocate bss and stack segment
  if (!(sz = allocuvm(pd, PAGE * program_page, PAGE * program_page + hdr->bss + STACKSZ, 0))) goto bad;

  // initialize the top page of the stack
  sz &= -PAGE;
  mappage(pd, sz, V2P+(sp = memset(kalloc(), 0, PAGE)), PTE_P | PTE_W | PTE_U);

  // prepare stack arguments
  stack = sp += PAGE - (argc+1)*4;
  for (i=0; i<argc; i++) {
    s = i > 1 ? *argv++ : "user_program";
    n = strlen(s) + 1;
    if ((sp & (PAGE - 1)) < n) goto bad;
    sp -= n;
    memcpy(sp, s, n);
    stack[i] = sz + (sp & (PAGE - 1));
  }
  stack[argc] = 0;
  if ((sp & (PAGE - 1)) < 40) { // XXX 40? stick into above loop?
    bad:
    if (pd) freevm(pd);
    return -1;
  }
  stack = sp = (sp - 28) & -8;
  stack[0] = sz + ((sp + 24) & (PAGE - 1)); // return address
  stack[2] = argc;
  stack[4] = sz + PAGE - (argc+1)*4; // argv
  stack[6] = TRAP | (S_exit<<8); // call exit if main returns

  // save program name for debugging XXX
  safestrcpy(u->name, "user_program", sizeof(u->name));

  // commit to the user image
  oldpd = u->pdir;
  u->pdir = pd;
  u->sz = sz + PAGE;
  u->tf->fc = USER;
  u->tf->pc = hdr->entry + sizeof(*hdr);
  printf("%d\n", u->tf->pc);
  u->tf->sp = sz + (sp & (PAGE - 1));
  pdir(V2P+(uint)(u->pdir));
  freevm(oldpd);
  return 0;
}

struct proc *allocproc();
uint *copyuvm(uint *pd, uint sz);

int fork()
{
  int i, pid;
  struct proc *np;

  if (!(np = allocproc())) return -1;
  np->pdir = copyuvm(u->pdir, u->sz); // copy process state
  np->sz = u->sz;
  np->parent = u;
  memcpy(np->tf, u->tf, sizeof(struct trapframe));
  np->tf->a = 0; // child returns 0
  pid = np->pid;
  safestrcpy(np->name, u->name, sizeof(u->name));
  np->state = RUNNABLE;
  return pid;
}

// Exit the current process.  Does not return.  An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.  Special treatment for process 0 and 1.
exit(int rc)
{
  struct proc *p; int fd;

//  printf("exit(%d)\n",rc); // XXX do something with return code
  if (u->pid == 0) { for (;;) asm(IDLE); } // spin in the arms of the kernel (cant be paged out)
  // else if (u->pid == 1) panic("exit() init exiting"); // XXX reboot after all processes go away?
  asm(CLI);

  // parent might be sleeping in wait()
  wakeup(u->parent);

  // pass abandoned children to init
  for (p = proc; p < &proc[NPROC]; p++) {
    if (p->parent == u) {
      p->parent = init;
      if (p->state == ZOMBIE) wakeup(init);
    }
  }

  // jump into the scheduler, never to return
  u->state = ZOMBIE;
  sched();
  panic("zombie exit");
}

// Kill the process with the given pid.  Process won't exit until it returns to user space (see trap()).
int kill(int pid)
{
  struct proc *p; int e = splhi();

  for (p = proc; p < &proc[NPROC]; p++) {
    if (p->pid == pid) {
      p->killed = 1;
      // wake process from sleep if necessary
      if (p->state == SLEEPING) p->state = RUNNABLE;
      splx(e);
      return 0;
    }
  }
  splx(e);
  return -1;
}

// Wait for a child process to exit and return its pid.  Return -1 if this process has no children.
int wait()
{
  struct proc *p;
  int havekids, pid, e = splhi();

  for (;;) { // scan through table looking for zombie children
    havekids = 0;
    for (p = proc; p < &proc[NPROC]; p++) {
      if (p->parent != u) continue;
      havekids = 1;
      if (p->state == ZOMBIE) {
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
        freevm(p->pdir);
        p->state = UNUSED;
        p->pid = 0;
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        splx(e);
        return pid;
      }
    }

    // no point waiting if we don't have any children
    if (!havekids || u->killed) {
      splx(e);
      return -1;
    }

    // wait for children to exit.  (See wakeup call in exit.)
    sleep(u);  // XXX DOC: wait-sleep
  }
}

// grow process by n bytes             XXX need to verify that u->sz is always at a 4 byte alignment  !!!!!
int sbrk(int n)
{
  uint osz, sz;
  if (!n) return u->sz;
  osz = sz = u->sz;
  if (n > 0) {
//    printf("growproc(%d)\n",n);
    if (!(sz = allocuvm(u->pdir, sz, sz + n, 0))) {
      printf("bad growproc!!\n"); //XXX
      return -1;
    }
  } else {
//    printf("shrinkproc(%d)\n",n);
//    if (sz + n < KRESERVED)
    if ((uint)(-n) > sz) { //XXX
      printf("bad shrinkproc!!\n"); //XXX
      return -1;
    }
    if (!(sz = deallocuvm(u->pdir, sz, sz + n))) return -1;
    pdir(V2P+(uint)(u->pdir));
  }
  u->sz = sz;
//  pdir(V2P+(u->pdir));
  return osz;
}

int ssleep(int n)
{
  uint ticks0; int e = splhi();

  ticks0 = ticks;
  while (ticks - ticks0 < n) {
    if (u->killed) {
      splx(e);
      return -1;
    }
    sleep(&ticks);
  }
  splx(e);
  return 0;
}

// sleep on channel
sleep(void *chan)
{
  u->chan = chan;
  u->state = SLEEPING;
  sched();
  // tidy up
  u->chan = 0;
}

// wake up all processes sleeping on chan
wakeup(void *chan)
{
  struct proc *p;
  for (p = proc; p < &proc[NPROC]; p++)
    if (p->state == SLEEPING && p->chan == chan) p->state = RUNNABLE;
}

// a forked child's very first scheduling will swtch here
forkret()
{
  asm(POPA); asm(SUSP);
  asm(POPG);
  asm(POPF);
  asm(POPC);
  asm(POPB);
  asm(POPA);
  asm(RTI);
}

// Look in the process table for an UNUSED proc.  If found, change state to EMBRYO and initialize
// state required to run in the kernel.  Otherwise return 0.
struct proc *allocproc()
{
  struct proc *p; char *sp; int e = splhi();

  for (p = proc; p < &proc[NPROC]; p++)
    if (p->state == UNUSED) goto found;
  splx(e);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
  splx(e);

  // allocate kernel stack leaving room for trap frame
  sp = (p->kstack = kalloc()) + PAGE - sizeof(struct trapframe);
  p->tf = (struct trapframe *)sp;
  
  // set up new context to start executing at forkret
  sp -= 8;
  *(uint *)sp = (uint)forkret;

  p->context = sp;
  return p;
}

// hand-craft the first process
init_start()
{
  char cmd[10], *argv[2];

  // no data/bss segment
  cmd[0] = '/'; cmd[1] = 'e'; cmd[2] = 't'; cmd[3] = 'c'; cmd[4] = '/';
  cmd[5] = 'i'; cmd[6] = 'n'; cmd[7] = 'i'; cmd[8] = 't'; cmd[9] = 0;

  argv[0] = cmd;
  argv[1] = 0;

  if (!init_fork()) init_exec(cmd, argv);
  init_exit(0); // become the idle task
}
init_fork() { asm(TRAP,S_fork); }
init_exec() { asm(LL,8); asm(LBL,16); asm(TRAP,S_exec); }
init_exit() { asm(LL,8); asm(TRAP,S_exit); }

userinit()
{
  char *mem;
  init = allocproc();
  init->pdir = memcpy(kalloc(), kpdir, PAGE);
  mem = memcpy(memset(kalloc(), 0, PAGE), (char *)init_start, (uint)userinit - (uint)init_start);
  mappage(init->pdir, 0, V2P+mem, PTE_P | PTE_W | PTE_U);

  init->sz = PAGE;
  init->tf->sp = PAGE;
  init->tf->fc = USER;
  init->tf->pc = 0;
  safestrcpy(init->name, "initcode", sizeof(init->name));
  //init->cwd = namei("/");
  init->state = RUNNABLE;
}

// set up kernel page table
setupkvm()
{
  uint i, *pde, *pt;

  kpdir = memset(kalloc(), 0, PAGE); // kalloc returns physical addresses here (kfree wont work until later on)

  for (i=0; i<mem_sz; i += PAGE) {
    pde = &kpdir[(P2V+i) >> 22];
    if (*pde & PTE_P)
      pt = *pde & -PAGE;
    else
      *pde = (uint)(pt = memset(kalloc(), 0, PAGE)) | PTE_P | PTE_W;
    pt[((P2V+i) >> 12) & 0x3ff] = i | PTE_P | PTE_W;
  }
}

// return the address of the PTE in page table pd that corresponds to virtual address va
uint *walkpdir(uint *pd, uint va)
{
  uint *pde = &pd[va >> 22], *pt;

  if (!(*pde & PTE_P)) return 0;
  pt = P2V+(*pde & -PAGE);
  return &pt[(va >> 12) & 0x3ff];
}

// create PTE for a page
mappage(uint *pd, uint va, uint pa, int perm)
{
  uint *pde, *pte, *pt;

  if (*(pde = &pd[va >> 22]) & PTE_P)
    pt = P2V+(*pde & -PAGE);
  else
    *pde = (V2P+(uint)(pt = memset(kalloc(), 0, PAGE))) | PTE_P | PTE_W | PTE_U;
  pte = &pt[(va >> 12) & 0x3ff];
  if (*pte & PTE_P) { printf("*pte=0x%x pd=0x%x va=0x%x pa=0x%x perm=0x%x", *pte, pd, va, pa, perm); panic("remap"); }
  *pte = pa | perm;
}

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int allocuvm(uint *pd, uint oldsz, uint newsz, int create) // XXX rename grow() ?
{
  uint va;
  if (newsz > USERTOP) return 0; // XXX make sure this never happens...
  if (newsz <= oldsz) panic("allocuvm: newsz <= oldsz"); // XXX do pre-checking in caller, no more post-checking needed
  
  va = (oldsz + PAGE-1) & -PAGE;
  while (va < newsz) {
    if (create)
      mappage(pd, va, V2P+(memset(kalloc(), 0, PAGE)), PTE_P | PTE_W | PTE_U);
    else
      mappage(pd, va, 0, PTE_W | PTE_U);
    va += PAGE;
  }  
  return newsz; // XXX not needed if never fails
}

// deallocate user pages to bring the process size from oldsz to newsz.
// oldsz and newsz need not be page-aligned, nor does newsz need to be less than oldsz.   XXXX wha why?
// oldsz can be larger than the actual process size.  Returns the new process size.
int deallocuvm(uint *pd, uint oldsz, uint newsz) // XXX rename shrink() ?? //XXX memset 0 top of partial page if present !!!
{
  uint va, *pde, *pte, *pt;

  if (newsz >= oldsz) return oldsz; // XXX maybe make sure this never happens

  va = newsz;
  if (va & (PAGE-1)) {
    memset(va, 0, PAGE - (va & (PAGE-1)));
    va = (va + PAGE-1) & -PAGE;
  }

  while(va < oldsz) {
    pde = &pd[(va >> 22) & 0x3ff]; //&pd[PDX(va)];
    if (*pde & PTE_P) { // XXX this may no longer be true if we are paging out pde/pte's?
      pt = P2V+(*pde & -PAGE);
      pte = &pt[(va >> 12) & 0x3ff]; // &pt[PTX(va)];

      if (*pte & PTE_P) {
        kfree(P2V+(*pte & -PAGE));
        *pte = 0;      
      }
      va += PAGE;
    }
    else
      va = (va + PAGE * 1024) & -(PAGE * 1024);
  }
  return newsz; // XXX not needed if never fails
}

// free a page table and all the physical memory pages in the user part
freevm(uint *pd)
{
  uint i;

  if (!pd) panic("freevm: no pd");
  deallocuvm(pd, USERTOP, 0);  // deallocate all user memory XXX do this more simply
  for (i = 0; i < ((USERTOP >> 22) & 0x3ff); i++) { // for (i = 0; i < PDX(USERTOP); i++)
    if (pd[i] & PTE_P) kfree(P2V+(pd[i] & -PAGE)); // deallocate all page table entries
  }
  kfree(pd); // deallocate page directory
}

// copy parent process page table for a child
uint *copyuvm(uint *pd, uint sz)
{
  uint va, *d, *pte;

  d = memcpy(kalloc(), kpdir, PAGE);
  for (va = 0; va < sz; va += PAGE) {
    if (!(pte = walkpdir(pd, va))) panic("copyuvm: pte should exist");

    if (*pte & PTE_P)
      mappage(d, va, V2P+(memcpy(kalloc(), P2V+(*pte & -PAGE), PAGE)), PTE_P | PTE_W | PTE_U); // XXX implement copy on write
    else
      mappage(d, va, 0, PTE_W | PTE_U);
  }
  return d;
}

swtch(int *old, int new) // switch stacks
{
  asm(LEA,0); // a = sp
  asm(LBL,8); // b = old
  asm(SX,0);  // *b = a
  asm(LL,16); // a = new
  asm(SSP);   // sp = a
}

scheduler()
{
  int n;

  for (n = 0; n < NPROC; n++) {  // XXX do me differently
    proc[n].next = &proc[(n+1)&(NPROC-1)];
    proc[n].prev = &proc[(n-1)&(NPROC-1)];
  }

  u = &proc[0];
  pdir(V2P+(uint)(u->pdir));
  u->state = RUNNING;
  swtch(&n, u->context);
  panic("scheduler returned!\n");
}

sched() // XXX redesign this better
{
  int n;
  struct proc *p;
  p = u;
  for (n = 0; n < NPROC; n++) {
    u = u->next;
    if (u == &proc[0]) continue;
    if (u->state == RUNNABLE) goto found;
  }
  u = &proc[0];

found:
  u->state = RUNNING;
  if (p != u) {
    pdir(V2P + (uint) (u->pdir));
    swtch(&p->context, u->context);
  }
}

void trap(uint *sp, double g, double f, int c, int b, int a, int fc, uint *pc)
{
  uint va;
  switch (fc) {
  case FSYS: panic("FSYS from kernel");
  case FSYS + USER:
    if (u->killed) exit(-1);
    u->tf = &sp;
    switch (pc[-1] >> 8) {
    case S_fork:    a = fork(); break;
    case S_exit:    if (a < -99) printf("exit(%d)\n",a); exit(a); // XXX debug feature
    case S_wait:    a = wait(); break; // XXX args?
    case S_write:   a = write(a, b, c); break;
    case S_kill:    a = kill(a); break;
    case S_exec:    a = exec(a, b); break;
    case S_getpid:  a = u->pid; break;
    case S_sbrk:    a = sbrk(a); break;
    case S_sleep:   a = ssleep(a); break;
    default: printf("pid:%d name:%s unknown syscall %d\n", u->pid, u->name, a); a = -1; break;
    }
    if (u->killed) exit(-1);
    return;
    
  case FMEM:          panic("FMEM from kernel");
  case FMEM   + USER: printf("FMEM + USER\n"); exit(-1);  // XXX psignal(SIGBUS)
  case FPRIV:         panic("FPRIV from kernel");
  case FPRIV  + USER: printf("FPRIV + USER\n"); exit(-1); // XXX psignal(SIGINS)
  case FINST:         panic("FINST from kernel");
  case FINST  + USER: printf("FINST + USER\n"); exit(-1); // psignal(SIGINS)
  case FARITH:        panic("FARITH from kernel");
  case FARITH + USER: printf("FARITH + USER\n"); exit(-1); // XXX psignal(SIGFPT)
  case FIPAGE:        printf("FIPAGE from kernel [0x%x]", lvadr()); panic("!\n");
  case FIPAGE + USER: printf("FIPAGE + USER [0x%x]", lvadr()); exit(-1); // XXX psignal(SIGSEG) or page in
  case FWPAGE:
  case FWPAGE + USER:
  case FRPAGE:        // XXX
  case FRPAGE + USER: // XXX
    if ((va = lvadr()) >= u->sz) exit(-1);
    pc--; // printf("fault"); // restart instruction
    mappage(u->pdir, va & -PAGE, V2P+(memset(kalloc(), 0, PAGE)), PTE_P | PTE_W | PTE_U);
    return;

  case FTIMER: 
  case FTIMER + USER: 
    ticks++;
    wakeup(&ticks);

    // force process exit if it has been killed and is in user space
    if (u->killed && (fc & USER)) exit(-1);
 
    // force process to give up CPU on clock tick
    if (u->state != RUNNING) { printf("pid=%d state=%d\n", u->pid, u->state); panic("!\n"); }        
    u->state = RUNNABLE;
    sched();

    if (u->killed && (fc & USER)) exit(-1);
    return;
  }
}

alltraps()
{
  asm(PSHA);
  asm(PSHB);
  asm(PSHC);
  asm(PSHF);
  asm(PSHG);
  asm(LUSP); asm(PSHA);
  trap();                // registers passed back out by magic reference :^O
  asm(POPA); asm(SUSP);
  asm(POPG);
  asm(POPF);
  asm(POPC);
  asm(POPB);
  asm(POPA);
  asm(RTI);
}

mainc()
{
  kpdir[0] = 0;          // don't need low map anymore
  ivec(alltraps);        // trap vector
  stmr(128*1024);        // set timer
  userinit();            // first user process
  printf("Welcome!\n");
  scheduler();           // start running processes
}

main()
{
  int *ksp;              // temp kernel stack pointer
  static char kstack[256]; // temp kernel stack
  static int endbss;     // last variable in bss segment
    
  // initialize memory allocation
  mem_top = kreserved = ((uint)&endbss + PAGE + 3) & -PAGE; 
  mem_sz = msiz();
  
  // initialize kernel page table
  setupkvm();
  kpdir[0] = kpdir[(uint)USERTOP >> 22]; // need a 1:1 map of low physical memory for awhile

  // initialize kernel stack pointer
  ksp = ((uint)kstack + sizeof(kstack) - 8) & -8;
  asm(LL, 4);
  asm(SSP);

  // turn on paging
  pdir(kpdir);
  spage(1);
  kpdir = P2V+(uint)kpdir;
  mem_top = P2V+mem_top;

  // jump (via return) to high memory
  ksp = P2V+(((uint)kstack + sizeof(kstack) - 8) & -8);
  *ksp = P2V+(uint)mainc;
  asm(LL, 4);
  asm(SSP);
  asm(LEV);
}
