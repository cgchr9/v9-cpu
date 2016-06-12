enum {
  PAGE    = 4096,       // page size
  NPROC   = 64,         // maximum number of processes
  NOFILE  = 16,         // open files per process
  NFILE   = 100,        // open files per system
  NBUF    = 10,         // size of disk block cache
  NINODE  = 50,         // maximum number of active i-nodes  XXX make this more dynamic ...
  NDEV    = 10,         // maximum major device number
  USERTOP = 0xc0000000, // end of user address space
  P2V     = +USERTOP,   // turn a physical address into a virtual address
  V2P     = -USERTOP,   // turn a virtual address into a physical address
  FSSIZE  = PAGE*1024,  // XXX
  MAXARG  = 256,        // max exec arguments
  STACKSZ = 0x800000,   // user stack size (8MB)
  NOSEMS  = 20,	
};

enum { // page table entry flags   XXX refactor vs. i386
  PTE_P = 0x001, // present
  PTE_W = 0x002, // writeable
  PTE_U = 0x004, // user
  PTE_A = 0x020, // accessed
  PTE_D = 0x040, // dirty
};

enum { // processor fault codes
  FMEM,   // bad physical address
  FTIMER, // timer interrupt
  FKEYBD, // keyboard interrupt
  FPRIV,  // privileged instruction
  FINST,  // illegal instruction
  FSYS,   // software trap
  FARITH, // arithmetic trap
  FIPAGE, // page fault on opcode fetch
  FWPAGE, // page fault on write
  FRPAGE, // page fault on read
  USER=16 // user mode exception
};

struct trapframe { // layout of the trap frame built on the stack by trap handler
  int sp, pad1;
  double g, f;
  int c,  pad2;
  int b,  pad3;
  int a,  pad4;
  int fc, pad5;
  int pc, pad6;
};

struct buf {
  int flags;
  uint sector;
  struct buf *prev;      // LRU cache list
  struct buf *next;
//  struct buf *qnext;     // disk queue XXX
  uchar *data;
};

enum { B_BUSY  = 1,      // buffer is locked by some process
  B_VALID = 2,      // buffer has been read from disk
  B_DIRTY = 4};     // buffer needs to be written to disk
enum { S_IFIFO = 0x1000, // fifo
  S_IFCHR = 0x2000, // character
  S_IFBLK = 0x3000, // block
  S_IFDIR = 0x4000, // directory
  S_IFREG = 0x8000, // regular
  S_IFMT  = 0xF000 }; // file type mask
enum { O_RDONLY, O_WRONLY, O_RDWR, O_CREAT = 0x100, O_TRUNC = 0x200 };
enum { SEEK_SET, SEEK_CUR, SEEK_END };

struct stat {
  ushort st_dev;         // device number
  ushort st_mode;        // type of file
  uint   st_ino;         // inode number on device
  uint   st_nlink;       // number of links to file
  uint   st_size;        // size of file in bytes
};

// disk file system format
enum {
  ROOTINO  = 16,         // root i-number
  NDIR     = 480,
  NIDIR    = 512,
  NIIDIR   = 8,
  NIIIDIR  = 4,
  DIRSIZ   = 252,
  PIPESIZE = 4000,       // XXX up to a page (since pipe is a page)
};

struct dinode { // on-disk inode structure
  ushort mode;           // file mode
  uint nlink;            // number of links to inode in file system
  uint size;             // size of file
  uint pad[17];
  uint dir[NDIR];        // data block addresses
  uint idir[NIDIR];
  uint iidir[NIIDIR];    // XXX not implemented
  uint iiidir[NIIIDIR];  // XXX not implemented
};

struct direct { // directory is a file containing a sequence of direct structures.
  uint d_ino;
  char d_name[DIRSIZ];
};

struct pipe {
  char data[PIPESIZE];
  uint nread;            // number of bytes read
  uint nwrite;           // number of bytes written
  int readopen;          // read fd is still open
  int writeopen;         // write fd is still open
};

struct inode { // in-memory copy of an inode
  uint inum;             // inode number
  int ref;               // reference count
  int flags;             // I_BUSY, I_VALID
  ushort mode;           // copy of disk inode
  uint nlink;
  uint size;
  uint dir[NDIR];
  uint idir[NIDIR];
};

enum { FD_NONE, FD_PIPE, FD_INODE, FD_SOCKET, FD_RFS };
struct file {
  int type;
  int ref;
  char readable;
  char writable;
  struct pipe *pipe;     // XXX make vnode
  struct inode *ip;
  uint off;
};

enum { I_BUSY = 1, I_VALID = 2 };
enum { UNUSED, EMBRYO, SLEEPING, RUNNABLE, RUNNING, ZOMBIE };

struct semaphore_t;
struct proc { // per-process state
  struct proc *next;
  struct proc *prev;
  uint sz;               // size of process memory (bytes)
  uint *pdir;            // page directory
  char *kstack;          // bottom of kernel stack for this process
  int state;             // process state
  int pid;               // process ID
  struct proc *parent;   // parent process
  struct trapframe *tf;  // trap frame for current syscall
  int context;           // swtch() here to run process
  void *chan;            // if non-zero, sleeping on chan
  int killed;            // if non-zero, have been killed
  struct file *ofile[NOFILE]; // open files
  struct inode *cwd;     // current directory
  char name[16];         // process name (debugging)
};

struct devsw { // device implementations XXX redesign
  int (*read)();
  int (*write)();
};

enum { CONSOLE = 1 }; // XXX ditch..

enum { INPUT_BUF = 128 };
struct input_s {
  char buf[INPUT_BUF];
  uint r;  // read index
  uint w;  // write index
};

enum { PF_INET = 2, AF_INET = 2, SOCK_STREAM = 1, INADDR_ANY = 0 }; // XXX keep or chuck these?



int in(port)    { asm(LL,8); asm(BIN); }
out(port, val)  { asm(LL,8); asm(LBL,16); asm(BOUT); }
ivec(void *isr) { asm(LL,8); asm(IVEC); }
lvadr()         { asm(LVAD); }
uint msiz()     { asm(MSIZ); }
stmr(val)       { asm(LL,8); asm(TIME); }
pdir(val)       { asm(LL,8); asm(PDIR); }
spage(val)      { asm(LL,8); asm(SPAG); }
splhi()         { asm(CLI); }
splx(int e)     { if (e) asm(STI); }

