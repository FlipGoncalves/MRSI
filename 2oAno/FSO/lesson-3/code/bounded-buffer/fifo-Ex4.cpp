#include <stdio.h>
#include <unistd.h>
#include <stdint.h>
#include <libgen.h>
#include <stdlib.h>
#include <pthread.h>
#include <string.h>

#include "fifo-Ex4.h"
#include "process.h"

#define ACCESS 0

void fifoInit(Fifo *f)
{
    /* init fifo */
    f->in = f->out = 0;

    /* init semaphores */
    f->sem = psemget(IPC_PRIVATE, 3, IPC_CREAT | 0600);
    psem_up(f->sem, ACCESS);
}

bool fifoIsFull(Fifo *f)
{
    return f->id != -1;
}

bool fifoIsEmpty(Fifo *f)
{
    return f->id == -1;
}

void fifoInsert(Fifo *f, int item)
{
    /* lock access to fifo */
    psem_down(f->sem, ACCESS);

    /* make insertion */
    f->in = f->in + 1;
    f->id = item;

    /* release access to fifo */
    psem_up(f->sem, ACCESS);
}

int fifoRetrieve(Fifo *f)
{
    /* lock access to fifo */
    psem_down(f->sem, ACCESS);

    /* update fifo */
    f->out = f->out + 1;
    int ret = f->id;

    /* release access to fifo */
    psem_up(f->sem, ACCESS);

    /* return item */
    return ret;
}

void fifoDestroy(Fifo *f)
{
    psemctl(f->sem, 0, IPC_RMID);
}
