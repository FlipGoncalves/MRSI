/*
 * Definition of the FIFO data type and manipulating functions
 *
 * The fifo is defined for a maximum capacity of N items
 */

#ifndef __SO_FSO_2425_IPC_FIFO__
#define __SO_FSO_2425_IPC_FIFO__

#include <stdint.h>
#include <stdlib.h>

#define N 5

struct Fifo
{
    uint32_t in, out;
    int id; 
    int sem;     // to be used in the sem-safe version
};

void fifoInit(Fifo *f);

bool fifoIsFull(Fifo *f);

bool fifoIsEmpty(Fifo *f);

void fifoInsert(Fifo *f, int item);

int fifoRetrieve(Fifo *f);

void fifoDestroy(Fifo *f);

#endif // __SO_FSO_2425_IPC_FIFO__

