#include <stdio.h>
#include <time.h>
#include "timer.h"

double timespec_diff(struct timespec *start, struct timespec *end) {
	struct timespec diff;
	diff.tv_nsec = end->tv_nsec - start->tv_nsec;
	diff.tv_sec = end->tv_sec - start->tv_sec;
	if (diff.tv_nsec < 0) {
		if (diff.tv_sec == 0) {
			return 0.0;
		}
		/* Move 1 second from seconds to nanoseconds */
		diff.tv_sec -= 1;
		diff.tv_nsec +=  1000000000L;
	}
	return (double)(diff.tv_sec + (double)diff.tv_nsec/1000000000.0);
}
