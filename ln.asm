
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	83 ec 10             	sub    $0x10,%esp
   a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(argc != 3){
   d:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
  11:	74 19                	je     2c <main+0x2c>
    printf(2, "Usage: ln old new\n");
  13:	c7 44 24 04 66 07 00 	movl   $0x766,0x4(%esp)
  1a:	00 
  1b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  22:	e8 d9 03 00 00       	call   400 <printf>
    exit();
  27:	e8 66 02 00 00       	call   292 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2c:	8b 43 08             	mov    0x8(%ebx),%eax
  2f:	89 44 24 04          	mov    %eax,0x4(%esp)
  33:	8b 43 04             	mov    0x4(%ebx),%eax
  36:	89 04 24             	mov    %eax,(%esp)
  39:	e8 b4 02 00 00       	call   2f2 <link>
  3e:	85 c0                	test   %eax,%eax
  40:	78 05                	js     47 <main+0x47>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  42:	e8 4b 02 00 00       	call   292 <exit>
  if(argc != 3){
    printf(2, "Usage: ln old new\n");
    exit();
  }
  if(link(argv[1], argv[2]) < 0)
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  47:	8b 43 08             	mov    0x8(%ebx),%eax
  4a:	89 44 24 0c          	mov    %eax,0xc(%esp)
  4e:	8b 43 04             	mov    0x4(%ebx),%eax
  51:	c7 44 24 04 79 07 00 	movl   $0x779,0x4(%esp)
  58:	00 
  59:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  60:	89 44 24 08          	mov    %eax,0x8(%esp)
  64:	e8 97 03 00 00       	call   400 <printf>
  69:	eb d7                	jmp    42 <main+0x42>
  6b:	66 90                	xchg   %ax,%ax
  6d:	66 90                	xchg   %ax,%ax
  6f:	90                   	nop

00000070 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  70:	55                   	push   %ebp
  71:	89 e5                	mov    %esp,%ebp
  73:	8b 45 08             	mov    0x8(%ebp),%eax
  76:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  79:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  7a:	89 c2                	mov    %eax,%edx
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  80:	83 c1 01             	add    $0x1,%ecx
  83:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  87:	83 c2 01             	add    $0x1,%edx
  8a:	84 db                	test   %bl,%bl
  8c:	88 5a ff             	mov    %bl,-0x1(%edx)
  8f:	75 ef                	jne    80 <strcpy+0x10>
    ;
  return os;
}
  91:	5b                   	pop    %ebx
  92:	5d                   	pop    %ebp
  93:	c3                   	ret    
  94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	8b 55 08             	mov    0x8(%ebp),%edx
  a6:	53                   	push   %ebx
  a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  aa:	0f b6 02             	movzbl (%edx),%eax
  ad:	84 c0                	test   %al,%al
  af:	74 2d                	je     de <strcmp+0x3e>
  b1:	0f b6 19             	movzbl (%ecx),%ebx
  b4:	38 d8                	cmp    %bl,%al
  b6:	74 0e                	je     c6 <strcmp+0x26>
  b8:	eb 2b                	jmp    e5 <strcmp+0x45>
  ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  c0:	38 c8                	cmp    %cl,%al
  c2:	75 15                	jne    d9 <strcmp+0x39>
    p++, q++;
  c4:	89 d9                	mov    %ebx,%ecx
  c6:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  c9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  cc:	8d 59 01             	lea    0x1(%ecx),%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  cf:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
  d3:	84 c0                	test   %al,%al
  d5:	75 e9                	jne    c0 <strcmp+0x20>
  d7:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
  d9:	29 c8                	sub    %ecx,%eax
}
  db:	5b                   	pop    %ebx
  dc:	5d                   	pop    %ebp
  dd:	c3                   	ret    
  de:	0f b6 09             	movzbl (%ecx),%ecx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  e1:	31 c0                	xor    %eax,%eax
  e3:	eb f4                	jmp    d9 <strcmp+0x39>
  e5:	0f b6 cb             	movzbl %bl,%ecx
  e8:	eb ef                	jmp    d9 <strcmp+0x39>
  ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000000f0 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  f6:	80 39 00             	cmpb   $0x0,(%ecx)
  f9:	74 12                	je     10d <strlen+0x1d>
  fb:	31 d2                	xor    %edx,%edx
  fd:	8d 76 00             	lea    0x0(%esi),%esi
 100:	83 c2 01             	add    $0x1,%edx
 103:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 107:	89 d0                	mov    %edx,%eax
 109:	75 f5                	jne    100 <strlen+0x10>
    ;
  return n;
}
 10b:	5d                   	pop    %ebp
 10c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 10d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 10f:	5d                   	pop    %ebp
 110:	c3                   	ret    
 111:	eb 0d                	jmp    120 <memset>
 113:	90                   	nop
 114:	90                   	nop
 115:	90                   	nop
 116:	90                   	nop
 117:	90                   	nop
 118:	90                   	nop
 119:	90                   	nop
 11a:	90                   	nop
 11b:	90                   	nop
 11c:	90                   	nop
 11d:	90                   	nop
 11e:	90                   	nop
 11f:	90                   	nop

00000120 <memset>:

void*
memset(void *dst, int c, uint n)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	8b 55 08             	mov    0x8(%ebp),%edx
 126:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 127:	8b 4d 10             	mov    0x10(%ebp),%ecx
 12a:	8b 45 0c             	mov    0xc(%ebp),%eax
 12d:	89 d7                	mov    %edx,%edi
 12f:	fc                   	cld    
 130:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 132:	89 d0                	mov    %edx,%eax
 134:	5f                   	pop    %edi
 135:	5d                   	pop    %ebp
 136:	c3                   	ret    
 137:	89 f6                	mov    %esi,%esi
 139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 45 08             	mov    0x8(%ebp),%eax
 146:	53                   	push   %ebx
 147:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 14a:	0f b6 18             	movzbl (%eax),%ebx
 14d:	84 db                	test   %bl,%bl
 14f:	74 1d                	je     16e <strchr+0x2e>
    if(*s == c)
 151:	38 d3                	cmp    %dl,%bl
 153:	89 d1                	mov    %edx,%ecx
 155:	75 0d                	jne    164 <strchr+0x24>
 157:	eb 17                	jmp    170 <strchr+0x30>
 159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 160:	38 ca                	cmp    %cl,%dl
 162:	74 0c                	je     170 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 164:	83 c0 01             	add    $0x1,%eax
 167:	0f b6 10             	movzbl (%eax),%edx
 16a:	84 d2                	test   %dl,%dl
 16c:	75 f2                	jne    160 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 16e:	31 c0                	xor    %eax,%eax
}
 170:	5b                   	pop    %ebx
 171:	5d                   	pop    %ebp
 172:	c3                   	ret    
 173:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000180 <gets>:

char*
gets(char *buf, int max)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 185:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
 187:	53                   	push   %ebx
 188:	83 ec 2c             	sub    $0x2c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 18b:	8d 7d e7             	lea    -0x19(%ebp),%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 18e:	eb 31                	jmp    1c1 <gets+0x41>
    cc = read(0, &c, 1);
 190:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 197:	00 
 198:	89 7c 24 04          	mov    %edi,0x4(%esp)
 19c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1a3:	e8 02 01 00 00       	call   2aa <read>
    if(cc < 1)
 1a8:	85 c0                	test   %eax,%eax
 1aa:	7e 1d                	jle    1c9 <gets+0x49>
      break;
    buf[i++] = c;
 1ac:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1b0:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1b2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 1b5:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1b7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1bb:	74 0c                	je     1c9 <gets+0x49>
 1bd:	3c 0a                	cmp    $0xa,%al
 1bf:	74 08                	je     1c9 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c1:	8d 5e 01             	lea    0x1(%esi),%ebx
 1c4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1c7:	7c c7                	jl     190 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1c9:	8b 45 08             	mov    0x8(%ebp),%eax
 1cc:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1d0:	83 c4 2c             	add    $0x2c,%esp
 1d3:	5b                   	pop    %ebx
 1d4:	5e                   	pop    %esi
 1d5:	5f                   	pop    %edi
 1d6:	5d                   	pop    %ebp
 1d7:	c3                   	ret    
 1d8:	90                   	nop
 1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001e0 <stat>:

int
stat(char *n, struct stat *st)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	56                   	push   %esi
 1e4:	53                   	push   %ebx
 1e5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e8:	8b 45 08             	mov    0x8(%ebp),%eax
 1eb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1f2:	00 
 1f3:	89 04 24             	mov    %eax,(%esp)
 1f6:	e8 d7 00 00 00       	call   2d2 <open>
  if(fd < 0)
 1fb:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1fd:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 1ff:	78 27                	js     228 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 201:	8b 45 0c             	mov    0xc(%ebp),%eax
 204:	89 1c 24             	mov    %ebx,(%esp)
 207:	89 44 24 04          	mov    %eax,0x4(%esp)
 20b:	e8 da 00 00 00       	call   2ea <fstat>
  close(fd);
 210:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 213:	89 c6                	mov    %eax,%esi
  close(fd);
 215:	e8 a0 00 00 00       	call   2ba <close>
  return r;
 21a:	89 f0                	mov    %esi,%eax
}
 21c:	83 c4 10             	add    $0x10,%esp
 21f:	5b                   	pop    %ebx
 220:	5e                   	pop    %esi
 221:	5d                   	pop    %ebp
 222:	c3                   	ret    
 223:	90                   	nop
 224:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 228:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 22d:	eb ed                	jmp    21c <stat+0x3c>
 22f:	90                   	nop

00000230 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	8b 4d 08             	mov    0x8(%ebp),%ecx
 236:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 237:	0f be 11             	movsbl (%ecx),%edx
 23a:	8d 42 d0             	lea    -0x30(%edx),%eax
 23d:	3c 09                	cmp    $0x9,%al
int
atoi(const char *s)
{
  int n;

  n = 0;
 23f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 244:	77 17                	ja     25d <atoi+0x2d>
 246:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 248:	83 c1 01             	add    $0x1,%ecx
 24b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 24e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 252:	0f be 11             	movsbl (%ecx),%edx
 255:	8d 5a d0             	lea    -0x30(%edx),%ebx
 258:	80 fb 09             	cmp    $0x9,%bl
 25b:	76 eb                	jbe    248 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 25d:	5b                   	pop    %ebx
 25e:	5d                   	pop    %ebp
 25f:	c3                   	ret    

00000260 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 260:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 261:	31 d2                	xor    %edx,%edx
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 263:	89 e5                	mov    %esp,%ebp
 265:	56                   	push   %esi
 266:	8b 45 08             	mov    0x8(%ebp),%eax
 269:	53                   	push   %ebx
 26a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 26d:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 270:	85 db                	test   %ebx,%ebx
 272:	7e 12                	jle    286 <memmove+0x26>
 274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 278:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 27c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 27f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 282:	39 da                	cmp    %ebx,%edx
 284:	75 f2                	jne    278 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 286:	5b                   	pop    %ebx
 287:	5e                   	pop    %esi
 288:	5d                   	pop    %ebp
 289:	c3                   	ret    

0000028a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 28a:	b8 01 00 00 00       	mov    $0x1,%eax
 28f:	cd 40                	int    $0x40
 291:	c3                   	ret    

00000292 <exit>:
SYSCALL(exit)
 292:	b8 02 00 00 00       	mov    $0x2,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret    

0000029a <wait>:
SYSCALL(wait)
 29a:	b8 03 00 00 00       	mov    $0x3,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <pipe>:
SYSCALL(pipe)
 2a2:	b8 04 00 00 00       	mov    $0x4,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <read>:
SYSCALL(read)
 2aa:	b8 05 00 00 00       	mov    $0x5,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <write>:
SYSCALL(write)
 2b2:	b8 10 00 00 00       	mov    $0x10,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <close>:
SYSCALL(close)
 2ba:	b8 15 00 00 00       	mov    $0x15,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <kill>:
SYSCALL(kill)
 2c2:	b8 06 00 00 00       	mov    $0x6,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <exec>:
SYSCALL(exec)
 2ca:	b8 07 00 00 00       	mov    $0x7,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <open>:
SYSCALL(open)
 2d2:	b8 0f 00 00 00       	mov    $0xf,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <mknod>:
SYSCALL(mknod)
 2da:	b8 11 00 00 00       	mov    $0x11,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <unlink>:
SYSCALL(unlink)
 2e2:	b8 12 00 00 00       	mov    $0x12,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <fstat>:
SYSCALL(fstat)
 2ea:	b8 08 00 00 00       	mov    $0x8,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <link>:
SYSCALL(link)
 2f2:	b8 13 00 00 00       	mov    $0x13,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <mkdir>:
SYSCALL(mkdir)
 2fa:	b8 14 00 00 00       	mov    $0x14,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <chdir>:
SYSCALL(chdir)
 302:	b8 09 00 00 00       	mov    $0x9,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <dup>:
SYSCALL(dup)
 30a:	b8 0a 00 00 00       	mov    $0xa,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <getpid>:
SYSCALL(getpid)
 312:	b8 0b 00 00 00       	mov    $0xb,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <sbrk>:
SYSCALL(sbrk)
 31a:	b8 0c 00 00 00       	mov    $0xc,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <sleep>:
SYSCALL(sleep)
 322:	b8 0d 00 00 00       	mov    $0xd,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <uptime>:
SYSCALL(uptime)
 32a:	b8 0e 00 00 00       	mov    $0xe,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <hello>:
SYSCALL(hello)//BR
 332:	b8 16 00 00 00       	mov    $0x16,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <countp>:
SYSCALL(countp)//BR
 33a:	b8 17 00 00 00       	mov    $0x17,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <setlottery>:
SYSCALL(setlottery)//BR
 342:	b8 18 00 00 00       	mov    $0x18,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <info>:
SYSCALL(info)//BR
 34a:	b8 19 00 00 00       	mov    $0x19,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    
 352:	66 90                	xchg   %ax,%ax
 354:	66 90                	xchg   %ax,%ax
 356:	66 90                	xchg   %ax,%ax
 358:	66 90                	xchg   %ax,%ax
 35a:	66 90                	xchg   %ax,%ax
 35c:	66 90                	xchg   %ax,%ax
 35e:	66 90                	xchg   %ax,%ax

00000360 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	56                   	push   %esi
 365:	89 c6                	mov    %eax,%esi
 367:	53                   	push   %ebx
 368:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 36b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 36e:	85 db                	test   %ebx,%ebx
 370:	74 09                	je     37b <printint+0x1b>
 372:	89 d0                	mov    %edx,%eax
 374:	c1 e8 1f             	shr    $0x1f,%eax
 377:	84 c0                	test   %al,%al
 379:	75 75                	jne    3f0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 37b:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 37d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 384:	89 75 c0             	mov    %esi,-0x40(%ebp)
    x = -xx;
  } else {
    x = xx;
  }

  i = 0;
 387:	31 ff                	xor    %edi,%edi
 389:	89 ce                	mov    %ecx,%esi
 38b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 38e:	eb 02                	jmp    392 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 390:	89 cf                	mov    %ecx,%edi
 392:	31 d2                	xor    %edx,%edx
 394:	f7 f6                	div    %esi
 396:	8d 4f 01             	lea    0x1(%edi),%ecx
 399:	0f b6 92 94 07 00 00 	movzbl 0x794(%edx),%edx
  }while((x /= base) != 0);
 3a0:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 3a2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 3a5:	75 e9                	jne    390 <printint+0x30>
  if(neg)
 3a7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 3aa:	89 c8                	mov    %ecx,%eax
 3ac:	8b 75 c0             	mov    -0x40(%ebp),%esi
  }while((x /= base) != 0);
  if(neg)
 3af:	85 d2                	test   %edx,%edx
 3b1:	74 08                	je     3bb <printint+0x5b>
    buf[i++] = '-';
 3b3:	8d 4f 02             	lea    0x2(%edi),%ecx
 3b6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 3bb:	8d 79 ff             	lea    -0x1(%ecx),%edi
 3be:	66 90                	xchg   %ax,%ax
 3c0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 3c5:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 3c8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3cf:	00 
 3d0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 3d4:	89 34 24             	mov    %esi,(%esp)
 3d7:	88 45 d7             	mov    %al,-0x29(%ebp)
 3da:	e8 d3 fe ff ff       	call   2b2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 3df:	83 ff ff             	cmp    $0xffffffff,%edi
 3e2:	75 dc                	jne    3c0 <printint+0x60>
    putc(fd, buf[i]);
}
 3e4:	83 c4 4c             	add    $0x4c,%esp
 3e7:	5b                   	pop    %ebx
 3e8:	5e                   	pop    %esi
 3e9:	5f                   	pop    %edi
 3ea:	5d                   	pop    %ebp
 3eb:	c3                   	ret    
 3ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 3f0:	89 d0                	mov    %edx,%eax
 3f2:	f7 d8                	neg    %eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 3f4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 3fb:	eb 87                	jmp    384 <printint+0x24>
 3fd:	8d 76 00             	lea    0x0(%esi),%esi

00000400 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 404:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 406:	56                   	push   %esi
 407:	53                   	push   %ebx
 408:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 40b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 40e:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 411:	8b 75 08             	mov    0x8(%ebp),%esi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 414:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 417:	0f b6 13             	movzbl (%ebx),%edx
 41a:	83 c3 01             	add    $0x1,%ebx
 41d:	84 d2                	test   %dl,%dl
 41f:	75 39                	jne    45a <printf+0x5a>
 421:	e9 c2 00 00 00       	jmp    4e8 <printf+0xe8>
 426:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 428:	83 fa 25             	cmp    $0x25,%edx
 42b:	0f 84 bf 00 00 00    	je     4f0 <printf+0xf0>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 431:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 434:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 43b:	00 
 43c:	89 44 24 04          	mov    %eax,0x4(%esp)
 440:	89 34 24             	mov    %esi,(%esp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 443:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 446:	e8 67 fe ff ff       	call   2b2 <write>
 44b:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 44e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 452:	84 d2                	test   %dl,%dl
 454:	0f 84 8e 00 00 00    	je     4e8 <printf+0xe8>
    c = fmt[i] & 0xff;
    if(state == 0){
 45a:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 45c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 45f:	74 c7                	je     428 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 461:	83 ff 25             	cmp    $0x25,%edi
 464:	75 e5                	jne    44b <printf+0x4b>
      if(c == 'd'){
 466:	83 fa 64             	cmp    $0x64,%edx
 469:	0f 84 31 01 00 00    	je     5a0 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 46f:	25 f7 00 00 00       	and    $0xf7,%eax
 474:	83 f8 70             	cmp    $0x70,%eax
 477:	0f 84 83 00 00 00    	je     500 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 47d:	83 fa 73             	cmp    $0x73,%edx
 480:	0f 84 a2 00 00 00    	je     528 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 486:	83 fa 63             	cmp    $0x63,%edx
 489:	0f 84 35 01 00 00    	je     5c4 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 48f:	83 fa 25             	cmp    $0x25,%edx
 492:	0f 84 e0 00 00 00    	je     578 <printf+0x178>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 498:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 49b:	83 c3 01             	add    $0x1,%ebx
 49e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4a5:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4a6:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4a8:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ac:	89 34 24             	mov    %esi,(%esp)
 4af:	89 55 d0             	mov    %edx,-0x30(%ebp)
 4b2:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 4b6:	e8 f7 fd ff ff       	call   2b2 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 4bb:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4be:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4c1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4c8:	00 
 4c9:	89 44 24 04          	mov    %eax,0x4(%esp)
 4cd:	89 34 24             	mov    %esi,(%esp)
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 4d0:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4d3:	e8 da fd ff ff       	call   2b2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4d8:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 4dc:	84 d2                	test   %dl,%dl
 4de:	0f 85 76 ff ff ff    	jne    45a <printf+0x5a>
 4e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 4e8:	83 c4 3c             	add    $0x3c,%esp
 4eb:	5b                   	pop    %ebx
 4ec:	5e                   	pop    %esi
 4ed:	5f                   	pop    %edi
 4ee:	5d                   	pop    %ebp
 4ef:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 4f0:	bf 25 00 00 00       	mov    $0x25,%edi
 4f5:	e9 51 ff ff ff       	jmp    44b <printf+0x4b>
 4fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 500:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 503:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 508:	31 ff                	xor    %edi,%edi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 50a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 511:	8b 10                	mov    (%eax),%edx
 513:	89 f0                	mov    %esi,%eax
 515:	e8 46 fe ff ff       	call   360 <printint>
        ap++;
 51a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 51e:	e9 28 ff ff ff       	jmp    44b <printf+0x4b>
 523:	90                   	nop
 524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 528:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 52b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 52f:	8b 38                	mov    (%eax),%edi
        ap++;
        if(s == 0)
          s = "(null)";
 531:	b8 8d 07 00 00       	mov    $0x78d,%eax
 536:	85 ff                	test   %edi,%edi
 538:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 53b:	0f b6 07             	movzbl (%edi),%eax
 53e:	84 c0                	test   %al,%al
 540:	74 2a                	je     56c <printf+0x16c>
 542:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 548:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 54b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 54e:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 551:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 558:	00 
 559:	89 44 24 04          	mov    %eax,0x4(%esp)
 55d:	89 34 24             	mov    %esi,(%esp)
 560:	e8 4d fd ff ff       	call   2b2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 565:	0f b6 07             	movzbl (%edi),%eax
 568:	84 c0                	test   %al,%al
 56a:	75 dc                	jne    548 <printf+0x148>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 56c:	31 ff                	xor    %edi,%edi
 56e:	e9 d8 fe ff ff       	jmp    44b <printf+0x4b>
 573:	90                   	nop
 574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 578:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 57b:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 57d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 584:	00 
 585:	89 44 24 04          	mov    %eax,0x4(%esp)
 589:	89 34 24             	mov    %esi,(%esp)
 58c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 590:	e8 1d fd ff ff       	call   2b2 <write>
 595:	e9 b1 fe ff ff       	jmp    44b <printf+0x4b>
 59a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 5a0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5a3:	b9 0a 00 00 00       	mov    $0xa,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5a8:	66 31 ff             	xor    %di,%di
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 5ab:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 5b2:	8b 10                	mov    (%eax),%edx
 5b4:	89 f0                	mov    %esi,%eax
 5b6:	e8 a5 fd ff ff       	call   360 <printint>
        ap++;
 5bb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5bf:	e9 87 fe ff ff       	jmp    44b <printf+0x4b>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 5c4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5c7:	31 ff                	xor    %edi,%edi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 5c9:	8b 00                	mov    (%eax),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5cb:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5d2:	00 
 5d3:	89 34 24             	mov    %esi,(%esp)
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 5d6:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5d9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 5dc:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e0:	e8 cd fc ff ff       	call   2b2 <write>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
 5e5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5e9:	e9 5d fe ff ff       	jmp    44b <printf+0x4b>
 5ee:	66 90                	xchg   %ax,%ax

000005f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5f1:	a1 0c 0a 00 00       	mov    0xa0c,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 5f6:	89 e5                	mov    %esp,%ebp
 5f8:	57                   	push   %edi
 5f9:	56                   	push   %esi
 5fa:	53                   	push   %ebx
 5fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5fe:	8b 08                	mov    (%eax),%ecx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 600:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 603:	39 d0                	cmp    %edx,%eax
 605:	72 11                	jb     618 <free+0x28>
 607:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 608:	39 c8                	cmp    %ecx,%eax
 60a:	72 04                	jb     610 <free+0x20>
 60c:	39 ca                	cmp    %ecx,%edx
 60e:	72 10                	jb     620 <free+0x30>
 610:	89 c8                	mov    %ecx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 612:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 614:	8b 08                	mov    (%eax),%ecx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 616:	73 f0                	jae    608 <free+0x18>
 618:	39 ca                	cmp    %ecx,%edx
 61a:	72 04                	jb     620 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 61c:	39 c8                	cmp    %ecx,%eax
 61e:	72 f0                	jb     610 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 620:	8b 73 fc             	mov    -0x4(%ebx),%esi
 623:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 626:	39 cf                	cmp    %ecx,%edi
 628:	74 1e                	je     648 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 62a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 62d:	8b 48 04             	mov    0x4(%eax),%ecx
 630:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 633:	39 f2                	cmp    %esi,%edx
 635:	74 28                	je     65f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 637:	89 10                	mov    %edx,(%eax)
  freep = p;
 639:	a3 0c 0a 00 00       	mov    %eax,0xa0c
}
 63e:	5b                   	pop    %ebx
 63f:	5e                   	pop    %esi
 640:	5f                   	pop    %edi
 641:	5d                   	pop    %ebp
 642:	c3                   	ret    
 643:	90                   	nop
 644:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 648:	03 71 04             	add    0x4(%ecx),%esi
 64b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 64e:	8b 08                	mov    (%eax),%ecx
 650:	8b 09                	mov    (%ecx),%ecx
 652:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 655:	8b 48 04             	mov    0x4(%eax),%ecx
 658:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 65b:	39 f2                	cmp    %esi,%edx
 65d:	75 d8                	jne    637 <free+0x47>
    p->s.size += bp->s.size;
 65f:	03 4b fc             	add    -0x4(%ebx),%ecx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 662:	a3 0c 0a 00 00       	mov    %eax,0xa0c
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 667:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 66a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 66d:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 66f:	5b                   	pop    %ebx
 670:	5e                   	pop    %esi
 671:	5f                   	pop    %edi
 672:	5d                   	pop    %ebp
 673:	c3                   	ret    
 674:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 67a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000680 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	57                   	push   %edi
 684:	56                   	push   %esi
 685:	53                   	push   %ebx
 686:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 689:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 68c:	8b 1d 0c 0a 00 00    	mov    0xa0c,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 692:	8d 48 07             	lea    0x7(%eax),%ecx
 695:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 698:	85 db                	test   %ebx,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 69a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 69d:	0f 84 9b 00 00 00    	je     73e <malloc+0xbe>
 6a3:	8b 13                	mov    (%ebx),%edx
 6a5:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 6a8:	39 fe                	cmp    %edi,%esi
 6aa:	76 64                	jbe    710 <malloc+0x90>
 6ac:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 6b3:	bb 00 80 00 00       	mov    $0x8000,%ebx
 6b8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 6bb:	eb 0e                	jmp    6cb <malloc+0x4b>
 6bd:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6c0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6c2:	8b 78 04             	mov    0x4(%eax),%edi
 6c5:	39 fe                	cmp    %edi,%esi
 6c7:	76 4f                	jbe    718 <malloc+0x98>
 6c9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6cb:	3b 15 0c 0a 00 00    	cmp    0xa0c,%edx
 6d1:	75 ed                	jne    6c0 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 6d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6d6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 6dc:	bf 00 10 00 00       	mov    $0x1000,%edi
 6e1:	0f 43 fe             	cmovae %esi,%edi
 6e4:	0f 42 c3             	cmovb  %ebx,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 6e7:	89 04 24             	mov    %eax,(%esp)
 6ea:	e8 2b fc ff ff       	call   31a <sbrk>
  if(p == (char*)-1)
 6ef:	83 f8 ff             	cmp    $0xffffffff,%eax
 6f2:	74 18                	je     70c <malloc+0x8c>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6f4:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 6f7:	83 c0 08             	add    $0x8,%eax
 6fa:	89 04 24             	mov    %eax,(%esp)
 6fd:	e8 ee fe ff ff       	call   5f0 <free>
  return freep;
 702:	8b 15 0c 0a 00 00    	mov    0xa0c,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 708:	85 d2                	test   %edx,%edx
 70a:	75 b4                	jne    6c0 <malloc+0x40>
        return 0;
 70c:	31 c0                	xor    %eax,%eax
 70e:	eb 20                	jmp    730 <malloc+0xb0>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 710:	89 d0                	mov    %edx,%eax
 712:	89 da                	mov    %ebx,%edx
 714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 718:	39 fe                	cmp    %edi,%esi
 71a:	74 1c                	je     738 <malloc+0xb8>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 71c:	29 f7                	sub    %esi,%edi
 71e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 721:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 724:	89 70 04             	mov    %esi,0x4(%eax)
      }
      freep = prevp;
 727:	89 15 0c 0a 00 00    	mov    %edx,0xa0c
      return (void*)(p + 1);
 72d:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 730:	83 c4 1c             	add    $0x1c,%esp
 733:	5b                   	pop    %ebx
 734:	5e                   	pop    %esi
 735:	5f                   	pop    %edi
 736:	5d                   	pop    %ebp
 737:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 738:	8b 08                	mov    (%eax),%ecx
 73a:	89 0a                	mov    %ecx,(%edx)
 73c:	eb e9                	jmp    727 <malloc+0xa7>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 73e:	c7 05 0c 0a 00 00 10 	movl   $0xa10,0xa0c
 745:	0a 00 00 
    base.s.size = 0;
 748:	ba 10 0a 00 00       	mov    $0xa10,%edx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 74d:	c7 05 10 0a 00 00 10 	movl   $0xa10,0xa10
 754:	0a 00 00 
    base.s.size = 0;
 757:	c7 05 14 0a 00 00 00 	movl   $0x0,0xa14
 75e:	00 00 00 
 761:	e9 46 ff ff ff       	jmp    6ac <malloc+0x2c>
