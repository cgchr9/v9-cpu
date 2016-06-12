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
  printf("%s", addr);
  return n;
}



void yield() {
  u->state = RUNNABLE;
  sched();
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


void kthread_example() {
  printf("Hello world from process %d\n", u->pid);
  while(1) {
    sched();
  }
}

fork_kthread(void *entry)
{
  char *mem;
  init = allocproc();
  init->pdir = memcpy(kalloc(), kpdir, PAGE);

  init->sz = PAGE;
  init->tf->sp = kalloc() + PAGE;
  init->tf->fc = 0;
  init->tf->pc = entry;
  safestrcpy(init->name, "kthread", sizeof(init->name));
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
void mappage(uint *pd, uint va, uint pa, int perm)
{
  uint *pde, *pte, *pt;
  if (*(pde = &pd[va >> 22]) & PTE_P)
    pt = P2V+(*pde & -PAGE);
  else
    *pde = (V2P+(uint)(pt = memset(kalloc(), 0, PAGE))) | PTE_P | PTE_W | PTE_U;
  pte = &pt[(va >> 12) & 0x3ff];
  if (*pte & PTE_P) {
    printf("*pte=0x%x pd=0x%x va=0x%x pa=0x%x perm=0x%x", *pte, pd, va, pa, perm);
    panic("remap");
  }
  *pte = pa | perm;
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
      printf("Haven't implemented syscall yet");
      return;

    case FMEM:          panic("FMEM from kernel");
    case FPRIV:         panic("FPRIV from kernel");
    case FINST:         panic("FINST from kernel");
    case FARITH:        panic("FARITH from kernel");
    case FIPAGE:        printf("FIPAGE from kernel [0x%x]", lvadr()); panic("!\n");
    case FWPAGE:
    case FRPAGE:        // XXX
      if ((va = lvadr()) >= u->sz) panic("Address out of bounds");
      pc--; // printf("fault"); // restart instruction
      mappage(u->pdir, va & -PAGE, V2P+(memset(kalloc(), 0, PAGE)), PTE_P | PTE_W | PTE_U);
      return;

    case FTIMER:
    case FTIMER + USER:
      ticks++;
      wakeup(&ticks);
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
  int i;
  kpdir[0] = 0;          // don't need low map anymore
  ivec(alltraps);        // trap vector
  stmr(128*1024);        // set timer
  for (i = 0; i < 10; i++) {
    fork_kthread(kthread_example);
  }
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
