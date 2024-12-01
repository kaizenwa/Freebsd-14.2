#!/bin/sh

# panic: mtx_lock() of spin mutex (null) @ ../../../netinet/tcp_output.c:350
# cpuid = 1
# time = 1587276361
# KDB: stack backtrace:
# db_trace_self_wrapper() at db_trace_self_wrapper+0x2b/frame 0xfffffe01388956f0
# vpanic() at vpanic+0x182/frame 0xfffffe0138895740
# panic() at panic+0x43/frame 0xfffffe01388957a0
# __mtx_lock_flags() at __mtx_lock_flags+0x13c/frame 0xfffffe01388957f0
# tcp_output() at tcp_output+0x34e/frame 0xfffffe0138895980
# tcp_usr_connect() at tcp_usr_connect+0x123/frame 0xfffffe01388959e0
# soconnectat() at soconnectat+0xd0/frame 0xfffffe0138895a30
# kern_connectat() at kern_connectat+0xe2/frame 0xfffffe0138895a90
# sys_connect() at sys_connect+0x75/frame 0xfffffe0138895ad0
# amd64_syscall() at amd64_syscall+0x159/frame 0xfffffe0138895bf0
# fast_syscall_common() at fast_syscall_common+0x101/frame 0xfffffe0138895bf0

# Reproduced on r358885

[ `uname -p` = "i386" ] && exit 0

. ../default.cfg
cat > /tmp/syzkaller11.c <<EOF
// https://syzkaller.appspot.com/bug?id=f81a41d30e772445b13de6dcf07fc1afaf122a61
// autogenerated by syzkaller (https://github.com/google/syzkaller)

#define _GNU_SOURCE

#include <sys/types.h>

#include <errno.h>
#include <pthread.h>
#include <pwd.h>
#include <signal.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/endian.h>
#include <sys/syscall.h>
#include <sys/wait.h>
#include <time.h>
#include <unistd.h>

static void kill_and_wait(int pid, int* status)
{
  kill(pid, SIGKILL);
  while (waitpid(-1, status, 0) != pid) {
  }
}

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
  int i;
  for (i = 0; i < 100; i++) {
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

static void execute_one(void)
{
  int i, call, thread;
  int collide = 0;
again:
  for (call = 0; call < 4; call++) {
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
      event_timedwait(&th->done, 45);
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

static void execute_one(void);

#define WAIT_FLAGS 0

static void loop(void)
{
  int iter __unused;
  for (iter = 0;; iter++) {
    int pid = fork();
    if (pid < 0)
      exit(1);
    if (pid == 0) {
      execute_one();
      exit(0);
    }
    int status = 0;
    uint64_t start = current_time_ms();
    for (;;) {
      if (waitpid(-1, &status, WNOHANG | WAIT_FLAGS) == pid)
        break;
      sleep_ms(1);
      if (current_time_ms() - start < 5 * 1000)
        continue;
      kill_and_wait(pid, &status);
      break;
    }
  }
}

uint64_t r[1] = {0xffffffffffffffff};

void execute_call(int call)
{
  intptr_t res;
  switch (call) {
  case 0:
    res = syscall(SYS_socket, 2ul, 1ul, 0);
    if (res != -1)
      r[0] = res;
    break;
  case 1:
    memcpy((void*)0x20000040,
           "bbr\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
           "\000\000\000\000\000\000\000\000\000\000\000\000\000",
           32);
    *(uint32_t*)0x20000060 = 0;
    syscall(SYS_setsockopt, r[0], 6, 0x2000, 0x20000040ul, 0x24ul);
    break;
  case 2:
    *(uint8_t*)0x20000180 = 0x10;
    *(uint8_t*)0x20000181 = 2;
    *(uint16_t*)0x20000182 = htobe16(0x4e22);
    *(uint32_t*)0x20000184 = htobe32(0xfff);
    *(uint8_t*)0x20000188 = 0;
    *(uint8_t*)0x20000189 = 0;
    *(uint8_t*)0x2000018a = 0;
    *(uint8_t*)0x2000018b = 0;
    *(uint8_t*)0x2000018c = 0;
    *(uint8_t*)0x2000018d = 0;
    *(uint8_t*)0x2000018e = 0;
    *(uint8_t*)0x2000018f = 0;
    syscall(SYS_connect, r[0], 0x20000180ul, 0x10ul);
    break;
  case 3:
    syscall(SYS_listen, r[0], 0);
    break;
  }
}
int main(void)
{
  syscall(SYS_mmap, 0x20000000ul, 0x1000000ul, 7ul, 0x1012ul, -1, 0ul);
  loop();
  return 0;
}
EOF
mycc -o /tmp/syzkaller11 -Wall -Wextra -O2 /tmp/syzkaller11.c -lpthread ||
    exit 1

(cd /tmp; ./syzkaller11) &
sleep 60
pkill -9 syzkaller11
wait

rm -f /tmp/syzkaller11 /tmp/syzkaller11.c /tmp/syzkaller11.core
exit 0
