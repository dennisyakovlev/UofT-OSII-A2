// -*- C++ -*-

#ifndef _MM_THREAD_H_
#define _MM_THREAD_H_

#define _GNU_SOURCE

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>

#include <pthread.h>
#include <sys/syscall.h>
#include <sys/sysinfo.h>
#include <stdio.h>
#include <unistd.h>
#include <sched.h>


/* Set thread attributes */
void initialize_pthread_attr(int detachstate, int schedpolicy, int priority,
				    int inheritsched, int scope, pthread_attr_t *attr);


int getNumProcessors (void);

void setCPU (int n);

#endif /* _MM_THREAD_H_ */
