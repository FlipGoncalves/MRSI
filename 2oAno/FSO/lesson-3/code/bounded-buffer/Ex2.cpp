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

int main(int argc, char *argv[])
{
    int N = 10;

    /* create the shared memory and init it as a fifo  */
    int shmid = pshmget(IPC_PRIVATE, sizeof(Num), IPC_CREAT | 0600);
    Num *nummem = (Num *)pshmat(shmid, NULL, 0);
    nummem->sem = psemget(IPC_PRIVATE, 3, IPC_CREAT | 0600);
    psem_up(nummem->sem, ACCESS);
    nummem->val = 0;

    if (pfork() == 0)
    {
        psem_down(nummem->sem, ACCESS);
        while (nummem->val < N)
        {
            nummem->val++;
            printf("Child: Number %u\n", nummem->val);
        }
        psem_up(nummem->sem, ACCESS);
        exit(EXIT_SUCCESS);
    }
    else
    {
        pwait(NULL);
        psem_down(nummem->sem, ACCESS);
        while (nummem->val > 1) {
            nummem->val--;
            printf("Parent: Number %u\n", nummem->val);
        }
        psem_up(nummem->sem, ACCESS);
    }

    /* remove resources */
    pshmdt(nummem);
    pshmctl(shmid, IPC_RMID, NULL);

    return 0;
}