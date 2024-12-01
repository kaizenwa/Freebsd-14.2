#!/bin/sh

# panic: Assertion (cnp->cn_flags & (LOCKPARENT | WANTPARENT)) == 0 failed at ../../../kern/vfs_cache.c:4790
# cpuid = 5
# time = 1634453452
# KDB: stack backtrace:
# db_trace_self_wrapper() at db_trace_self_wrapper+0x2b/frame 0xfffffe0146912830
# vpanic() at vpanic+0x187/frame 0xfffffe0146912890
# panic() at panic+0x43/frame 0xfffffe01469128f0
# cache_fplookup_emptypath() at cache_fplookup_emptypath+0x1b2/frame 0xfffffe0146912930
# cache_fplookup_noentry() at cache_fplookup_noentry+0xbc/frame 0xfffffe01469129a0
# cache_fplookup() at cache_fplookup+0x605/frame 0xfffffe0146912a90
# namei() at namei+0x203/frame 0xfffffe0146912b50
# vn_open_cred() at vn_open_cred+0x12c/frame 0xfffffe0146912cb0
# kern_openat() at kern_openat+0x285/frame 0xfffffe0146912e00
# amd64_syscall() at amd64_syscall+0x147/frame 0xfffffe0146912f30
# fast_syscall_common() at fast_syscall_common+0xf8/frame 0xfffffe0146912f30
# --- syscall (0, FreeBSD ELF64, nosys), rip = 0x8003aeafa, rsp = 0x7fffdfffdf28, rbp = 0x7fffdfffdf70 ---
# KDB: enter: panic
# [ thread pid 2864 tid 100315 ]
# Stopped at      kdb_enter+0x37: movq    $0,0x126f74e(%rip)
# db> x/s version
# version: FreeBSD 14.0-CURRENT #0 main-n250087-a7d137fcbcac: Sun Oct 17 08:46:08 CEST 2021
# pho@mercat1.netperf.freebsd.org:/usr/src/sys/amd64/compile/PHO\012
# db> 

# Fixed by 1045352f1503

[ `uname -p` != "amd64" ] && exit 0
[ `id -u ` -ne 0 ] && echo "Must be root!" && exit 1

. ../default.cfg
cat > /tmp/syzkaller45.c <<EOF
// https://syzkaller.appspot.com/bug?id=283995ae4346041c1757f62f3322a3545d0a62a4
// autogenerated by syzkaller (https://github.com/google/syzkaller)
// Reported-by: syzbot+bd48ee0843206a09e6b8@syzkaller.appspotmail.com

#define _GNU_SOURCE

#include <errno.h>
#include <pthread.h>
#include <pwd.h>
#include <setjmp.h>
#include <signal.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/endian.h>
#include <sys/syscall.h>
#include <time.h>
#include <unistd.h>

static __thread int skip_segv;
static __thread jmp_buf segv_env;

static void segv_handler(int sig, siginfo_t* info, void* ctx __unused)
{
  uintptr_t addr = (uintptr_t)info->si_addr;
  const uintptr_t prog_start = 1 << 20;
  const uintptr_t prog_end = 100 << 20;
  int skip = __atomic_load_n(&skip_segv, __ATOMIC_RELAXED) != 0;
  int valid = addr < prog_start || addr > prog_end;
  if (sig == SIGBUS)
    valid = 1;
  if (skip && valid) {
    _longjmp(segv_env, 1);
  }
  exit(sig);
}

static void install_segv_handler(void)
{
  struct sigaction sa;
  memset(&sa, 0, sizeof(sa));
  sa.sa_sigaction = segv_handler;
  sa.sa_flags = SA_NODEFER | SA_SIGINFO;
  sigaction(SIGSEGV, &sa, NULL);
  sigaction(SIGBUS, &sa, NULL);
}

#define NONFAILING(...)                                                        \
  ({                                                                           \
    int ok = 1;                                                                \
    __atomic_fetch_add(&skip_segv, 1, __ATOMIC_SEQ_CST);                       \
    if (_setjmp(segv_env) == 0) {                                              \
      __VA_ARGS__;                                                             \
    } else                                                                     \
      ok = 0;                                                                  \
    __atomic_fetch_sub(&skip_segv, 1, __ATOMIC_SEQ_CST);                       \
    ok;                                                                        \
  })

static void sleep_ms(uint64_t ms)
{
  usleep(ms * 1000);
}

static uint64_t current_time_ms(void)
{
  struct timespec ts;
  if (clock_gettime(CLOCK_MONOTONIC, &ts))
    exit(1);
  return (uint64_t)ts.tv_sec * 1000 + (uint64_t)ts.tv_nsec / 1000000;
}

static void thread_start(void* (*fn)(void*), void* arg)
{
  pthread_t th;
  pthread_attr_t attr;
  pthread_attr_init(&attr);
  pthread_attr_setstacksize(&attr, 128 << 10);
  int i = 0;
  for (; i < 100; i++) {
    if (pthread_create(&th, &attr, fn, arg) == 0) {
      pthread_attr_destroy(&attr);
      return;
    }
    if (errno == EAGAIN) {
      usleep(50);
      continue;
    }
    break;
  }
  exit(1);
}

typedef struct {
  pthread_mutex_t mu;
  pthread_cond_t cv;
  int state;
} event_t;

static void event_init(event_t* ev)
{
  if (pthread_mutex_init(&ev->mu, 0))
    exit(1);
  if (pthread_cond_init(&ev->cv, 0))
    exit(1);
  ev->state = 0;
}

static void event_reset(event_t* ev)
{
  ev->state = 0;
}

static void event_set(event_t* ev)
{
  pthread_mutex_lock(&ev->mu);
  if (ev->state)
    exit(1);
  ev->state = 1;
  pthread_mutex_unlock(&ev->mu);
  pthread_cond_broadcast(&ev->cv);
}

static void event_wait(event_t* ev)
{
  pthread_mutex_lock(&ev->mu);
  while (!ev->state)
    pthread_cond_wait(&ev->cv, &ev->mu);
  pthread_mutex_unlock(&ev->mu);
}

static int event_isset(event_t* ev)
{
  pthread_mutex_lock(&ev->mu);
  int res = ev->state;
  pthread_mutex_unlock(&ev->mu);
  return res;
}

static int event_timedwait(event_t* ev, uint64_t timeout)
{
  uint64_t start = current_time_ms();
  uint64_t now = start;
  pthread_mutex_lock(&ev->mu);
  for (;;) {
    if (ev->state)
      break;
    uint64_t remain = timeout - (now - start);
    struct timespec ts;
    ts.tv_sec = remain / 1000;
    ts.tv_nsec = (remain % 1000) * 1000 * 1000;
    pthread_cond_timedwait(&ev->cv, &ev->mu, &ts);
    now = current_time_ms();
    if (now - start > timeout)
      break;
  }
  int res = ev->state;
  pthread_mutex_unlock(&ev->mu);
  return res;
}

struct thread_t {
  int created, call;
  event_t ready, done;
};

static struct thread_t threads[16];
static void execute_call(int call);
static int running;

static void* thr(void* arg)
{
  struct thread_t* th = (struct thread_t*)arg;
  for (;;) {
    event_wait(&th->ready);
    event_reset(&th->ready);
    execute_call(th->call);
    __atomic_fetch_sub(&running, 1, __ATOMIC_RELAXED);
    event_set(&th->done);
  }
  return 0;
}

static void loop(void)
{
  int i, call, thread;
  int collide = 0;
again:
  for (call = 0; call < 3; call++) {
    for (thread = 0; thread < (int)(sizeof(threads) / sizeof(threads[0]));
         thread++) {
      struct thread_t* th = &threads[thread];
      if (!th->created) {
        th->created = 1;
        event_init(&th->ready);
        event_init(&th->done);
        event_set(&th->done);
        thread_start(thr, th);
      }
      if (!event_isset(&th->done))
        continue;
      event_reset(&th->done);
      th->call = call;
      __atomic_fetch_add(&running, 1, __ATOMIC_RELAXED);
      event_set(&th->ready);
      if (collide && (call % 2) == 0)
        break;
      event_timedwait(&th->done, 50);
      break;
    }
  }
  for (i = 0; i < 100 && __atomic_load_n(&running, __ATOMIC_RELAXED); i++)
    sleep_ms(1);
  if (!collide) {
    collide = 1;
    goto again;
  }
}

uint64_t r[1] = {0xffffffffffffffff};

void execute_call(int call)
{
  intptr_t res = 0;
  switch (call) {
  case 0:
    NONFAILING(memcpy((void*)0x20000480, "./file0\000", 8));
    res = syscall(SYS_open, 0x20000480ul, 0x80400000000206ul, 0ul);
    if (res != -1)
      r[0] = res;
    break;
  case 1:
    syscall(SYS_mmap, 0x20000000ul, 0x200000ul, 1ul, 0x12ul, r[0], 0ul);
    break;
  case 2:
    syscall(SYS_ftruncate, r[0], 5ul);
    break;
  }
}
int main(void)
{
  syscall(SYS_mmap, 0x20000000ul, 0x1000000ul, 7ul, 0x1012ul, -1, 0ul);
  install_segv_handler();
  loop();
  return 0;
}
EOF
mycc -o /tmp/syzkaller45 -Wall -Wextra -O0 /tmp/syzkaller45.c -lpthread || exit 1

(cd /tmp; ./syzkaller45)

rm -rf /tmp/syzkaller45 /tmp/syzkaller45.c /tmp/syzkaller.* /tmp/file0
exit 0
