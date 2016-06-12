#运行在v9-cpu的os.c拆分实验

v9-cpu是一个假想的32位RISC CPU，v9-cpu有一套自己定义的指令集，在完成os.c拆分实验之前，应当熟悉v9-cpu的：

- 寄存器
- 指令集
- 内存（分页机制等）
- I/O操作
- 中断/异常
- 应用程序二进制接口
- CPU执行过程

可以参考v9-cpu的doc文件来对这套cpu的指令集和运行过程有大致的了解，在阅读代码的过程中，建议将v9-cpu的doc文件在浏览器中打开，随时使用ctrl+f来查询指令集定义中从c代码，汇编代码，二进制代码的对应关系，了解每个labX.c中代码的意义。同时应该熟悉v9-cpu的/root/lib下的u.h, lab.h和lab_stdout.h，如页表项结构，栈帧结构，文件系统结构，进程控制块结构在这些文件中有详细的定义，在需要的时候查阅并使用。

下面针对拆分后的每一个lab，与ucore对照着概括出其要完成的基本要求和在该lab中新增函数的说明。
# lab1.c

##实验内容

- 初始化堆栈到临时存储区
- 初始化中断向量表
- 设置定时器并在时钟中断的时候打印定时器信息

##新增函数说明
```
void panic(char *s)  
// 用于封装的打印提示信息

void trap(uint *sp, double g, double f, int c, int b, int a, int fc, uint *pc)
//lab1 中陷入中断trap函数只处理了软件中断和时钟

void alltraps() 
//进行中断处理，内部封装了用汇编语言传递traps()参数的过程，最后一句asm(RTI)表示处理中断完成返回

void mainc() 
//初始化中断向量表，并设定计时器 

void main() 
//程序入口，初始化栈到临时存储区，并跳转到mainc
```

> 因为v9不支持类似x86的ebp指针，在函数调用的过程中，只有pc被入栈，所以函数在没有执行到上次以调用的返回点的时候并不知道上一次调用栈帧的位置

# lab2.c
##实验内容

- 采用类似于first-fit的方法，实现kalloc和kfree两个函数分配空闲页。


##新增函数说明
```
char *kalloc() 
//实现first-fit空闲页分配

void kfree(char *v) 
//实现kalloc对应的页释放

uint *walkpdir(uint *pd, uint va) 
//返回页表项对应的虚拟地址

void mappage(uint *pd, uint va, uint pa, int perm) 
//为页创建页表项,提供建立一个新映射的功能，如果对应的PT不存在，则创建之

void setupkvm()
//用于初始化内核kernel的页表page table，建立从0xc0000000之后mem_sz大小的虚拟空间到0x00000000之后mem_sz大小物理空间的对等映射

char *test_alloc() 
void test_free(char *mem_block)
void alloc_check() 
//用于检测kalloc和kfree函数的正确性
```


# lab3
##实验内容
- 处理虚拟内存的缺页异常
- 在缺页时检查访问的地址是否合法，如果合法，则分配新页

##新增函数说明
```c
void find_victim()
//用于返回与虚拟地址virtual address对应的页表项PTE

void trap(uint *sp, double g, double f, int c, int b, int a, int fc, uint *pc) 
//陷入中断函数中在原有的只处理软件中断和时钟中断的基础上，增加了下面4个CASE，用来处理缺页异常。
    case FWPAGE:
    case FWPAGE + USER:
    case FRPAGE:        // XXX
    case FRPAGE + USER: // XXX
      # if ((va = lvadr()) >= u->sz) exit(-1);
      pc--; // restart instruction
      mappage(kpdir, va & -PAGE, V2P+(memset(kalloc(), 0, PAGE)), PTE_P | PTE_W | PTE_U);
      return;
```

# lab4

##实验内容
- 内核线程的管理与调度
- 创建一个内核线程
* 增加```fork_kthread```函数用于创建一个内核线程

##新增函数说明
```c
int svalid(uint s) 
int mvalid(uint a, int n)
int write(int fd, char *addr, int n)
//增加系统调用相关的函数

void yield()
//生成一个可运行进程并调度

int ssleep(int n)
//进程休眠

sleep(void *chan)
//进程在channel通道上休眠

wakeup(void *chan)
//唤醒所有在通道上休眠的进程

struct proc *allocproc()
//定义结构：在进程表中查询是否有未使用的进程，如果有，则将其状态切换为初始化，否则返回0.

void kthread_example()
//测试进程

fork_kthread(void *entry)
//通过fork创建新的进程，并修改对应的进程块相应的信息

swtch(int *old, int new)
//切换堆栈

scheduler()
//调度器

sched()
//调度函数
```

# lab5
##实验内容
 - 创建用户进程并进行进程管理

>
* 为了在没有文件系统的情况下存储用户程序，定义了一个全局变量```user_program```，```os.c```编译后，user_program将成为elf文件data段的一部分．这时可以将其替换为制定的用户程序．

>
- ```add_program.cpp```实现了该功能．该程序的作用是，查找一个magic string，如果找到，就把magic string所在的存储区替换为用户程序．同时应当将```user_program```初始化为以magic string开头使得这段存储可以被找到．
为了避免错误，应当检查magic string出现的唯一性，并且检查存储区大小足够存放用户程序
* 修改```exec```使之从```user_program```中读取程序而不是文件系统
* 增加系统调用```yield```，进程可以通过该调用主动放弃CPU使用权
* 实现测试样例```lab5_user.c```，样例通过fork创建８个用户进程，并通过yield轮流执行，同时测试在进程程序结束时可以顺利终止

##新增函数说明
```c
int exec(char *program, char **argv) 
//从user_program中读取程序，而非文件系统

int kill(int pid)
//用以删除给定pid的进程，查看trap()函数的实现可指进程在返回其用户空间之前不会停止。

int wait()
//等待子进程退出并返还其pid，当进程不存在时返回-1

int sbrk(int n)
//以n字节为单位增加进程所占用的存储空间

int allocuvm(uint *pd, uint oldsz, uint newsz, int create)
//给占用空间增加的进程更多的页表和物理内存

int deallocuvm(uint *pd, uint oldsz, uint newsz)
//给占用空间减少的进程回收页表和物理内存。

freevm(uint *pd)
//清空页表盒所有用户态的物理内存页。

uint *copyuvm(uint *pd, uint sz)
／/为子进程拷贝父进程的页表
```

# lab6
##实验内容
- 在lab5的基础上采用Round-Robin的方法调度进程

##新增函数说明
```c
void trap(uint *sp, double g, double f, int c, int b, int a, int fc, uint *pc)
//在中断处理函数的case FITMER + USER中增加以下内容
    // force process to give up CPU on clock tick
    if (u->state != RUNNING) { printf("pid=%d state=%d\n", u->pid, u->state); panic("!\n"); }        
    u->state = RUNNABLE;
    sched();
    
//只需要在进程对应时间片运行完之后强制其放弃CPU即可实现RR算法。
```


# lab7
##实验内容
-  **新增**实现了用户信号量以及对应的系统调用．

>
>  调用```seminit```在内核存储区创建一个信号量，
*  ```semup```释放一个信号量或唤醒一个等待进程，
*  ```semdown```获取一个信号量或者进入等待
* 在```lab7_user.c```中实现了一个简单的测试．如果去掉```semup```和```semdown```的保护，输出会变得混乱没有规律

##新增函数说明
```c
struct semaphore_t
//信号量结构定义

struct semaphore_t *sem_init(int value)
//信号量结构存储空间初始化函数

int sem_del(struct semaphore_t *sem)
//删除信号量

void sem_up(struct semaphore_t *sem)
//释放操作，信号量的值加1

void sem_down(struct semaphore_t *sem)
//占用操作，信号量的值减1

exit(int rc)
//退出进程的函数中增加了删除信号量的内容
```

# lab8
##实验内容
- 添加对文件系统的实现


##新增函数说明
```c
ideinit()
//初始化IDE

iderw(struct buf *b)
//读写IED

binit()
//缓冲区初始化

struct buf *bget(uint sector)
struct buf *bread(uint sector)
//寻找读取factor

bwrite(struct buf *b)
//将缓冲区写在硬盘上

brelse(struct buf *b)
//释放缓冲区

bzero(uint b)
//将buffer区置0

uint balloc()
//分配一个磁盘块


bfree(uint b)
//释放一个磁盘快




```