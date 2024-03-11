#include "mm_thread.h"


/* Set thread attributes */

void initialize_pthread_attr(int detachstate, int schedpolicy, int priority,
				    int inheritsched, int scope, pthread_attr_t *attr)
{
	pthread_attr_init(attr);
	pthread_attr_setdetachstate(attr, detachstate);
	if (inheritsched == PTHREAD_EXPLICIT_SCHED) {
		pthread_attr_setschedpolicy(attr, schedpolicy);
		struct sched_param p;
		p.sched_priority = priority;
		pthread_attr_setschedparam(attr, &p);
	}
	pthread_attr_setscope(attr, scope);
}

/*
 * This function used to be more complicated, to try and avoid a call to the
 * C library malloc() routine embedded in the Linux sysconf() call.
 * However, for CSC469 assignment, we can allow a call to malloc() before the
 * main test starts. Also, there is now a 'get_nprocs()' function that does
 * exactly what we want, so this is just a wrapper.
 */
int getNumProcessors (void)
{
	static int np = 0;
	if (!np) {
		np = get_nprocs();
	}
	return np;
}

void setCPU (int n) {
	/* Set CPU affinity to CPU n only. */
	pid_t tid = gettid();
	cpu_set_t mask;
	CPU_ZERO(&mask);
	CPU_SET(n, &mask);
	if (sched_setaffinity(tid, sizeof(cpu_set_t), &mask) != 0) {
		perror("sched_setaffinity failed");
	} 
}

