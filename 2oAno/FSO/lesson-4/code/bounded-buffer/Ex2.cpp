/*
 * An implementation of the bounded-buffer problem
 *
 * NC producers and NC consumers communicate through a fifo.
 * The fifo has a fixed capacity.
 * NI items will be produced by the producers and consume by the consumers.
 * An item is composed of 2 equal integers, ranging from 1 to NI.
 */

#include <stdio.h>
#include <unistd.h>
#include <stdint.h>
#include <math.h>
#include <libgen.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>

#include "utils.h"
#include "thread.h"
#include "fifo.h"

#define ACCESS 0

struct Num {
    int val;
    pthread_mutex_t access;
    pthread_cond_t notdone, done;
};

static Num *theFifo = NULL; // being static, this pointer is accessible by all threads
static int n = 10;

void *childThread(void *arg)
{
    mutex_lock(&theFifo->access);
    while (theFifo->val < n)
    {
        theFifo->val++;
        printf("Child: Number %u\n", theFifo->val);
    }
 
    cond_broadcast(&theFifo->done);
    mutex_unlock(&theFifo->access);

    thread_exit(NULL);
    return NULL;
}

int main(int argc, char *argv[])
{
    /* create the shared memory and init it as a fifo */
    theFifo = (Num *)mem_alloc(sizeof(Num));

    /* init fifo */
    theFifo->val = 0;
    cond_init(&theFifo->notdone, NULL);

    /* init access mutex */
    mutex_init(&theFifo->access, NULL);
    pthread_t pthr[1];
    thread_create(&pthr[0], NULL, childThread, NULL);

    mutex_lock(&theFifo->access);
    while (theFifo->val != n)
    {
        cond_wait(&theFifo->done, &theFifo->access);
    }
    mutex_unlock(&theFifo->access);

    while (theFifo->val > 1)
    {
        theFifo->val--;
        printf("Parent: Number %u\n", theFifo->val);
    }
    cond_broadcast(&theFifo->notdone);

    // thread_join(pthr[0], NULL);

    return 0;
}