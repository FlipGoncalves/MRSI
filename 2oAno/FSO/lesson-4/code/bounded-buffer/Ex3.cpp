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

struct Num
{
    int val;
    pthread_mutex_t access;
    pthread_cond_t notdone, done;
};

static Num *theFifo = NULL; // being static, this pointer is accessible by all threads

void *childThread(void *arg)
{
    while (theFifo->val > 1)
    {
        mutex_lock(&theFifo->access);

        theFifo->val--;
        printf("Child: Number %u\n", theFifo->val);

        mutex_unlock(&theFifo->access);
    }

    thread_exit(NULL);
    return NULL;
}

int main(int argc, char *argv[])
{
    /* create the shared memory and init it as a fifo */
    theFifo = (Num *)mem_alloc(sizeof(Num));

    /* init fifo */
    theFifo->val = 20;
    cond_init(&theFifo->notdone, NULL);

    /* init access mutex */
    mutex_init(&theFifo->access, NULL);
    
    int n_threads = 2;
    pthread_t pthr[n_threads];
    for (int i = 0; i < n_threads; i++)
    {
        thread_create(&pthr[i], NULL, childThread, NULL);
    }

    /* wait for producers to finish */
    for (int i = 0; i < n_threads; i++)
    {
        thread_join(pthr[i], NULL);
    }

    return 0;
}