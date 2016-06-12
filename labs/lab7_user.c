#include <u.h>
#include <libc.h>

int main(int argc, char *argv[]) {

  int i, j;
  void *sem = seminit(1);
  
  for (i = 0; i < 3; i++) {
    if (semdel(sem) == 0) {
      printf("Sem delete successful\n");
    } else {
      printf("Sem delete failed\n");
    }
  }
  sem = seminit(1);


  printf("Hello world, this is a user program %d\n", getpid());

  fork();
  printf("Forking: my pid is %d\n", getpid());
  fork();
  printf("Forking: my pid is %d\n", getpid());
  fork();
  printf("Forking: my pid is %d\n", getpid());

  if (getpid() == 1)
    return 0;

  
  for (j = 0; j < 10; j++) {
    semdown(sem);
    printf("Msg from process %d", getpid());
    for (i = 0; i < 200000 + 100000 * getpid(); i++);
    printf(" continued...\n");
    semup(sem);
    for (i = 0; i < 200000 + 100000 * getpid(); i++);
  }
  return 0;
}
