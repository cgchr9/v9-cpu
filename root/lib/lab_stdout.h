void cout(char c)
{
  out(1, c);
}

void printn(int n)
{
  if (n > 9) { printn(n / 10); n %= 10; }
  cout(n + '0');
}

void printx(uint n)
{
if (n > 15) { printx(n >> 4); n &= 15; }
cout(n + (n > 9 ? 'a' - 10 : '0'));
}

void printf(char *f, ...) // XXX simplify or chuck
{
  int n, e = splhi(); char *s; va_list v;
  va_start(v, f);
  while (*f) {
    if (*f != '%') { cout(*f++); continue; }
    switch (*++f) {
      case 'd': f++; if ((n = va_arg(v,int)) < 0) { cout('-'); printn(-n); } else printn(n); continue;
      case 'x': f++; printx(va_arg(v,int)); continue;
      case 's': f++; for (s = va_arg(v, char *); *s; s++) cout(*s); continue;
    }
    cout('%');
  }
  splx(e);
}