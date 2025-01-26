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
#include "process.h"

#define ACCESS 0

struct Num {
    int val;
    int sem;
};

void childProcess(uint32_t id, Num *nummem)
{
    while (nummem->val > 2)
    {
        psem_down(nummem->sem, ACCESS);
        nummem->val--;
        printf("Child %u: Number %u\n", id, nummem->val);
        psem_up(nummem->sem, ACCESS);
    }   
}

int main(int argc, char *argv[])
{
    int N = 10;

    /* create the shared memory and init it as a fifo  */
    int shmid = pshmget(IPC_PRIVATE, sizeof(Num), IPC_CREAT | 0600);
    Num *nummem = (Num *)pshmat(shmid, NULL, 0);
    nummem->sem = psemget(IPC_PRIVATE, 3, IPC_CREAT | 0600);
    psem_up(nummem->sem, ACCESS);
    nummem->val = N;

    uint32_t nc = 2;
    pid_t childs[nc];
    for (uint32_t i = 0; i < nc; i++)
    {
        if ((childs[i] = pfork()) == 0)
        {
            childProcess(i+1, nummem);
            exit(EXIT_SUCCESS);
        }
    }

    for (uint32_t i = 0; i < nc; i++)
    {
        pwaitpid(childs[i], NULL, 0);
        pkill(childs[i], SIGINT);
    }

    /* remove resources */
    pshmdt(nummem);
    pshmctl(shmid, IPC_RMID, NULL);

    return 0;
}