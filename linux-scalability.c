/*
 *  malloc-test
 *  cel - Thu Jan  7 15:49:16 EST 1999
 *
 *  Benchmark libc's malloc, and check how well it
 *  can handle malloc requests from multiple threads.
 *
 *  Syntax:
 *  malloc-test [ size [ iterations [ thread count ]]]
 *
 */

/*
 * June 9, 2013: Modified by Emery Berger to use barriers so all
 * threads start at the same time; added statistics gathering.
 */


/* October 2018: Modified by Angela Demke Brown for use in CSC469 A2 */

#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <unistd.h>
#include <math.h>
#include <pthread.h>
#include <stdint.h>

#include "mm_thread.h"
#include "timer.h"
#include "alloc.h"
#include "memlib.h"

#define NSECSPERSEC 1000000000L
#define pthread_attr_default NULL
#define MAX_THREADS 50

double * executionTimes;
void * run_test (void *);

static unsigned long size = 512;
static uint64_t iteration_count = 1000000;
static unsigned int thread_count = 1;
static int numCPU = 0;

#include "ptbarrier.h"

pthread_barrier_t barrier;

int
main (int argc, char *argv[])
{
    unsigned int i;
    pthread_t thread[MAX_THREADS];
    int *result;

    /*           Parse our arguments          */
    switch (argc)
    {
        case 4:		/* thread_count, size, and iteration count were specified */
            iteration_count = atoll (argv[3]);
        case 3:		/* thread_count and size were specified; others default */
            size = atoi (argv[2]);
        case 2:		/* size was specified; others default */
            thread_count = atoi (argv[1]);
            if (thread_count > MAX_THREADS)
                thread_count = MAX_THREADS;
        case 1:			/* use default values */
            break;
        default:
            printf ("Unrecognized arguments.\n");
            exit (1);
    }

    printf ("Object size: %ld, Iterations: %lu, Threads: %d\n",
            size, iteration_count, thread_count);

    numCPU = getNumProcessors();
    printf("Running on system with %d processors.\n",numCPU);

    /* Call allocator-specific initialization function */
    mm_init();

    executionTimes = (double *) mm_malloc (sizeof(double) * thread_count);
    if (executionTimes == NULL) {
        printf("Failed to allocate %ld bytes for executionTimes. Exiting.\n",
               sizeof(double)*thread_count);
        exit(1);
    }

    pthread_barrier_init (&barrier, NULL, thread_count);

    /*          * Invoke the tests          */

    pthread_attr_t attr;
    initialize_pthread_attr(PTHREAD_CREATE_JOINABLE, SCHED_RR, -10,
                            PTHREAD_EXPLICIT_SCHED, PTHREAD_SCOPE_SYSTEM, &attr);

    printf ("Starting test...\n");

    for (i = 0; i < thread_count; i++) {
        int * tid = (int *) mm_malloc(sizeof(int));
        if (tid == NULL) {
            printf("Failed to allocate %ld bytes for tid. Exiting.\n",
                   sizeof(int));
        }

        *tid = i;
        if (pthread_create (&(thread[i]), &attr, &run_test, tid))
            printf ("failed.\n");
    }

    /*          * Wait for tests to finish          */

    for (i = 0; i < thread_count; i++) {
        pthread_join (thread[i], (void **)&result);
        if (result != NULL) {
            printf("Thread %d exited with error. Exiting.\n",i);
            exit(1);
        }
    }

    /* EDB: moved to outer loop. */
    /* Statistics gathering and reporting. */
    double sum = 0.0;
    double stddev = 0.0;
    double average;
    for (i = 0; i < thread_count; i++) {
        sum += executionTimes[i];
    }
    average = sum / thread_count;
    for (i = 0; i < thread_count; i++) {
        double diff = executionTimes[i] - average;
        stddev += diff * diff;
    }
    stddev = sqrt (stddev / (thread_count - 1));
    if (thread_count > 1) {
        printf ("Average execution time = %f seconds, standard deviation = %f.\n", average, stddev);
    } else {
        printf ("Average execution time = %f seconds.\n", average);
    }

    printf ("Memory used = %ld bytes\n",mem_usage());
    mm_free(executionTimes);

    exit (0);
}

void *
run_test (void * arg) {
    register unsigned int i;
    register unsigned long request_size = size;
    register uint64_t total_iterations = iteration_count;
    int tid = *((int *) arg);
    struct timespec start, end;

    setCPU((tid+1)%numCPU);

    pthread_barrier_wait (&barrier);

    /* Get the starting time */
    clock_gettime(CLOCK_MONOTONIC_RAW, &start);

    {
        void ** buf = (void **) mm_malloc(sizeof(void *) * total_iterations);
        if (buf == NULL) {
            printf("Failed to allocate %ld bytes for buf in thread %d. Exiting\n",
                   sizeof(void *)*total_iterations, tid);
            return (void *)0xdeadbeef;
        }

        for (i = 0; i < total_iterations; i++)
        {
            buf[i] = mm_malloc (request_size);
            if (buf[i] == NULL) {
                printf("Failed to allocate %ld bytes for buf[%d] in thread %d. Exiting.\n",
                       request_size, i, tid);
                return (void *)0xdeadbeef;
            }
        }

        for (i = 0; i < total_iterations; i++)
        {
            mm_free (buf[i]);
        }
        mm_free(buf);
    }

    /* Get the ending time */
    clock_gettime(CLOCK_MONOTONIC_RAW, &end);

    pthread_barrier_wait (&barrier);
    unsigned int pt = tid;
    executionTimes[pt % thread_count] = timespec_diff(&start, &end);

    return NULL;
}

