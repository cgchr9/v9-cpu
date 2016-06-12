//
// Created by shengjia based on v9-CPU on 4/16/16.
//

void *memcpy(void *d, void *s, uint n) { asm(LL,8); asm(LBL, 16); asm(LCL,24); asm(MCPY); asm(LL,8); }
void *memset(void *d, uint c,  uint n) { asm(LL,8); asm(LBLB,16); asm(LCL,24); asm(MSET); asm(LL,8); }
void *memchr(void *s, uint c,  uint n) { asm(LL,8); asm(LBLB,16); asm(LCL,24); asm(MCHR); }
int   memcmp() { asm(LL,8); asm(LBL, 16); asm(LCL,24); asm(MCMP); } // XXX eliminate

int strlen(void *s) { return memchr(s, 0, -1) - s; }

xstrncpy(char *s, char *t, int n) // no return value unlike strncpy XXX remove me only called once
{
  while (n-- > 0 && (*s++ = *t++));
  while (n-- > 0) *s++ = 0;
}

safestrcpy(char *s, char *t, int n) // like strncpy but guaranteed to null-terminate.
{
  if (n <= 0) return;
  while (--n > 0 && (*s++ = *t++));
  *s = 0;
}