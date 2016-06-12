#include <u.h>
#include <libc.h>

int main(int argc, char *argv[]) {

  int i;
  printf("Hello world, this is a user program %d\n", getpid());

  fork();
  printf("Forking: my pid is %d\n", getpid());
  fork();
  printf("Forking: my pid is %d\n", getpid());
  fork();
  printf("Forking: my pid is %d\n", getpid());

  if (getpid() == 1)
    return 0;

  while(1) {
    printf("Msg from process %d\n", getpid());
    for (i = 0; i < 20000000; i++);
    yield();
  }
  return 0;
}