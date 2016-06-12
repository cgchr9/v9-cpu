#Lab7修改与信号量实现说明
计23班 杨煜 2011010312

##147-216行 信号量的定义与创建
```c
/**************** Semaphore ********************/

struct semaphore_t {
  int value;
  struct proc *(p[20]);
  int wait_proc;
  struct semaphore_t *next;         //首先把semophore组织成一个链表
  struct proc *references[NOSEMS];  //加了一个每个信号量的，指向它的进程列表。
};
struct semaphore_t *sem_root = 0;

struct semaphore_t *sem_init(int value) {
  struct semaphore_t *sem = kalloc();   
  memset(sem, 0, sizeof(struct semaphore_t));
  //printf("Initializing semaphore @ %x to %d\n", (uint)sem, value);
  sem->value = value;
  sem->next = sem_root; 
  sem_root = sem;         //在初始化的时候多了一个把这个信号量插入到一个链表里面 //将当前进程设置成指向该信号量
  sem->references[0] = u;	// Set the current process as the only parent process of this semaphore
  return sem;	// We are returning a kernel address, but this should be fine, as the user cannot access this address
                         //保留这个指针的原因是到时候在进程销毁的同时可以找到该信号量，在需要时候销毁这个信号量。 （其他指针也会指向这个信号量）
}

int sem_del(struct semaphore_t *sem) {
  struct semaphore_t *cur_sem = sem_root;
  struct semaphore_t **cur_sem_ptr = &sem_root;
  while (cur_sem != 0) {     //在链表中找这个信号量
    if (cur_sem == sem) {
      *cur_sem_ptr = cur_sem->next;
  	  kfree(sem);             //找到则释放内存并返回0
      return 0;
    }
    cur_sem_ptr = &(cur_sem->next);
    cur_sem = cur_sem->next;
  }
  return -1;                  //没找到时候返回-1
}

void sem_up(struct semaphore_t *sem) {   //修正了安全漏洞，以前这段内核中执行的代码这里可以传进来任何指针。
  int e = splhi(), i;
  //printf("Up sem @ %d\n", (uint)sem);

  struct semaphore_t *cur_sem = sem_root;
  while (cur_sem != 0) {
    if (cur_sem == sem) {
      break;
    }
    cur_sem = cur_sem->next;          //现在必须要求该指针所指向的信号量是链表中的一部分。
  }
  if (cur_sem == 0) {
    printf("Semaphore not found");
    exit(-1);
  }
                                      //操作
  if (sem->wait_proc == 0)
    sem->value++;
  else {
    for (i = 0; i < 20; i++) {
      if (sem->p[i] != 0) {
        sem->p[i]->state = RUNNABLE;
        sem->p[i] = 0;
        sem->wait_proc--;
        splx(e);
        return;
      }
    }
    panic("Semaphore: cannot find waiting process");
  }
  splx(e);
}
```

##274-288 fork函数操作
```
cur_sem = sem_root;                         //fork操作复制进程，
  while (cur_sem != 0) {
    for (i = 0; i < NOSEMS; i++) {
      if (cur_sem->references[i] == u) {       //遍历所有的信号量，找到原先进程所指向的信号量
        for (j = 0; j < NOSEMS; j++) {
          if (cur_sem->references[j] == 0) {
            cur_sem->references[j] = np;       //让新进程也指向该信号量
            break;
          }
        }
        break;
      }
    }
    cur_sem = cur_sem->next;
  }
```

##317-335 exit时候的删除操作
```
  // Remove semaphore references 
  cur_sem = sem_root;
  while (cur_sem != 0) {
    for (i = 0; i < NOSEMS; i++) {                   //进程退出时，把当前信号量指向的指针，删除
      if (cur_sem->references[i] == u) {
        cur_sem->references[i] = 0;
        for (j = 0; j < NOSEMS; j++) {
          if (cur_sem->references[j] != 0) {
            break;
          }
        }
        if (j == NOSEMS) {
          sem_del(cur_sem);      //统计该信号量还有多少进程指向它，若没有则删除该信号量。
    	  printf("Kernel: deleted semaphore @ %x because no process references it\n", cur_sem);
        }
        break;
      }
    }
    cur_sem = cur_sem->next;
```

##/root/lib/libc.h 49行
增加了一个系统调用
```c
semdel() { asm(LL,8); asm(TRAP, S_semdel); }   //加了一个信号量的系统调用
```

##测试结果
尝试先删除信号量，第一次成功，之后就不能再继续删除了。
![](1.png)
结束时发现已经没有进程再指向这个信号量了，所以删除该信号量
![](2.png)