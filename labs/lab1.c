//
// Created by shengjia based on v9-CPU on 4/15/16.
//

#include <u.h>
#include <lab.h>
#include <lab_stdout.h>

uint ticks = 0;
char *mem_top;           // current top of unused memory
uint mem_sz;             // size of physical memory

void panic(char *s)
{
  asm(CLI);
  out(1,'p'); out(1,'a'); out(1,'n'); out(1,'i'); out(1,'c'); out(1,':'); out(1,' ');
  while (*s) out(1,*s++);
  out(1,'\n');
  asm(HALT);
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
      if (ticks >= 10000) {
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

void mainc()
{
  ivec(alltraps);        // trap vector
  splx(1);               // enable interrupt
  stmr(1024*128);        // set timer
  while(1);
}

void main()
{
  int *ksp;                 // temp kernel stack pointer
  static char kstack[256];  // temp kernel stack
  static int endbss;        // last variable in bss segment

  // initialize kernel stack pointer
  ksp = ((uint)kstack + sizeof(kstack) - 8) & -8;
  asm(LL, 4);
  asm(SSP);

  // This is some debugging code to print the value of SP
  // asm(LEA, 0);
  // asm(SL, 4);
  // printf("%x\n", val);

  // Important! this value must be reset because after SSP the stack has been moved
  // and all contents of the original stack are lost
  ksp = ((uint)kstack + sizeof(kstack) - 8) & -8;
  *ksp = (uint)mainc;
  asm(LEV);

  printf("Should never get here!\n");
  asm(HALT);
}
