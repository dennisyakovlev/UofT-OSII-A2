#ifndef __MEMLIB_H_
#define __MEMLIB_H_

/* $Id$ */

/*
 *  CSC 469 - Assignment 2
 *
 */

#include <unistd.h>
#include <stddef.h>


#define DSEG_MAX 256*1024*1024  /* 256 Mb */

int mem_init (void);
void *mem_sbrk (ptrdiff_t increment);
int mem_pagesize (void);
ptrdiff_t mem_usage (void);

#endif /* __MEMLIB_H_ */

