//
// Created by shengjia based on v9-CPU on 4/16/16.
//
#include <u.h>
#include <lab.h>
#include <lab_stdout.h>

char *mem_free;          // memory free list
char *mem_top;           // current top of unused memory
uint mem_sz;             // size of physical memory
uint kreserved;          // start of kernel reserved memory heap
uint *kpdir;             // kernel page directory
uint ticks;

void panic(char *s)
{
  asm(CLI);
  out(1,'p'); out(1,'a'); out(1,'n'); out(1,'i'); out(1,'c'); out(1,':'); out(1,' ');
  while (*s) out(1,*s++);
  out(1,'\n');
  asm(HALT);
}

// page allocator
char *kalloc()
{
  char *r; int e = splhi();
  if (r = mem_free)
    mem_free = *(char **)r;   // If there is an item in free page list, use it
  else if ((uint)(r = mem_top) < P2V+(mem_sz - FSSIZE))
    mem_top += PAGE;          // Otherwise increment mem_top to allocate a new page
  else panic("kalloc failure!");  //XXX need to sleep here!
  splx(e);
  return r;
}

// free a page
void kfree(char *v)
{
  int e = splhi();
  if ((uint)v % PAGE || v < (char *)(P2V+kreserved) || (uint)v >= P2V+(mem_sz - FSSIZE))
    panic("kfree");
  *(char **)v = mem_free;
  mem_free = v;
  splx(e);
}

// return the address of the PTE in page table pd that corresponds to virtual address va
uint *walkpdir(uint *pd, uint va) {
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



// set up kernel page table: allocate enough page tables for all mem_sz bytes of memory
// and build kernel virtual address to physical address translation
void setupkvm()
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

void trap(uint *sp, double g, double f, int c, int b, int a, int fc, uint *pc) {
  uint va;
  switch (fc) {
    case FSYS: panic("FSYS from kernel");
    case FSYS + USER:
      printf("Haven't implemented syscall yet");
      return;
    case FTIMER:
    case FTIMER + USER:
      ticks++;
      if (ticks % 1000 == 0)
        printf("Tick %d\n", ticks);
      if (ticks >= 5000) {
        printf("Exiting successfully");
        asm(HALT);
      }
      return;
    default:
      printf("Unknown interrupt");
      asm(HALT);
  }
}

void alltraps()
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

// These functions are used to test the correctness of kalloc and kfree
char *test_alloc() {
  char *mem_block = kalloc();
  printf("Allocate page at %x\n", (uint)mem_block);
  return mem_block;
}

void test_free(char *mem_block) {
  kfree(mem_block);
  printf("Free page at %x\n", (uint)mem_block);
}

void alloc_check() {
  char *mem1, *mem2, *mem3, *mem4;

  mem1 = test_alloc();
  mem2 = test_alloc();
  mem3 = test_alloc();
  test_free(mem1);
  test_free(mem2);
  mem1 = test_alloc();
  mem2 = test_alloc();
  mem4 = test_alloc();
  test_free(mem1);
  test_free(mem2);
  test_free(mem3);
  test_free(mem4);
}

void mainc()
{
  kpdir[0] = 0;          // don't need low map anymore
  alloc_check();         // Test kalloc and kfree
  ivec(alltraps);        // trap vector
  splx(1);
  stmr(128*1024);        // set timer
  while(1);
}


void main()
{
  int *ksp;                 // temp kernel stack pointer
  static char kstack[256];  // temp kernel stack
  static int endbss;        // last variable in bss segment

  // initialize memory allocation
  mem_top = kreserved = ((uint)&endbss + PAGE + 3) & -PAGE;
  mem_sz = msiz();
  printf("The system has %d MB of memory\n", mem_sz / 1024 / 1024);

  // initialize kernel page table
  setupkvm();
  kpdir[0] = kpdir[(uint)USERTOP >> 22]; // need a 1:1 map of low physical memory for awhile
  printf("set up kernel virtual address @0xc0000000\n");

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
  // Note that since all addressing in v9 is w.r.t. PC or SP,
  // moving PC and SP to high addresses automatically move all references to that address
  // therefore we do not need to explicitly relocate the code
}