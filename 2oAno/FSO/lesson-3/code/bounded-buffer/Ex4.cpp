/*
 * An implementation of the bounded-buffer problem
 *
 * NC producers and NC consumers communicate through a fifo.
 * The fifo has a fixed capacity.
 * NI items will be produced by the producers and consume by the consumers.
 * An item is composed of 2 equal integers, ranging from 1 to NI.
 */

#include <ctype.h>
#include <stdio.h>
#include <unistd.h>
#include <stdint.h>
#include <math.h>
#include <libgen.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>

#include <string.h>
#include "process.h"
#include "fifo-Ex4.h"

#define ACCESS 0
#define N 5

struct Buffer {
    char* str[100];
    int num_char;
    int num_dig;
    int num_let;
};

struct SharedData
{
    Buffer* pool[N];
    uint32_t count;
    Fifo *freeBuffers;
    Fifo *pendingRequests;
};

void Client(uint32_t id, SharedData *data)
{
    while (true) 
    {
        // getFreeBuffer()
        psem_down(data->freeBuffers->sem, ACCESS);
        int id = fifoRetrieve(data->freeBuffers);
        psem_up(data->freeBuffers->sem, ACCESS);

        // putRequestData(data, id)
        char str[100];
        printf("Enter a phrase: \n");
        scanf("%s", str);
        Buffer *bf;
        memset(bf->str, '\0', sizeof(char) * 100);
        *bf->str = str;
        data->pool[id] = bf;

        // submitRequest(id)
        fifoInsert(data->pendingRequests, id);

        // waitForResponse(id)
        psem_up(data->pendingRequests->sem, ACCESS);
        psem_down(data->pendingRequests->sem, ACCESS);

        // getResponseData(id)
        Buffer *resp = data->pool[id];
        printf("Number of Characres: %d\nNumber of Digits: %d\nNumber of Letters: %d", resp->num_char, resp->num_dig, resp->num_let);
        psem_up(data->pendingRequests->sem, ACCESS);

        // releaseBuffer(id)
        psem_down(data->freeBuffers->sem, ACCESS);
        fifoInsert(data->freeBuffers, id);
        psem_up(data->freeBuffers->sem, ACCESS);
    }
}

void Server(uint32_t id, SharedData *data)
{
    while (true)
    {
        // getPendingRequest()
        psem_down(data->pendingRequests->sem, ACCESS);
        int id = fifoRetrieve(data->pendingRequests);

        // getRequestData(id)
        Buffer* req = data->pool[id];

        // produceResponse(reg)
        req->num_char = strlen(*req->str);

        int i = 0, count = 0;
        while (*req->str[i] != '\0')
        {
            if (isdigit(*req->str[i]))
            {
                count++;
            }
            i++;
        }

        // notifyClient(id)
        req->num_dig = count;
        req->num_let = req->num_char - req->num_dig;

        // putResponseData(data, id)
        psem_up(data->pendingRequests->sem, ACCESS);
    }
}

int main(int argc, char *argv[])
{
    /* create the shared memory and init it as a fifo  */
    int shmid = pshmget(IPC_PRIVATE, sizeof(SharedData), IPC_CREAT | 0600);
    SharedData *data = (SharedData *)pshmat(shmid, NULL, 0);
    data->count = 0;

    Fifo *freeBuffers = (Fifo *)pshmat(shmid, NULL, 0);
    fifoInit(freeBuffers);

    int count = 0;
    while (!fifoIsFull(freeBuffers)) {
        fifoInsert(freeBuffers, count);
        count++;
    }

    Fifo *pendingRequests = (Fifo *)pshmat(shmid, NULL, 0);
    fifoInit(pendingRequests);

    memset(data->pool, 0, sizeof(Buffer) *N);

    data->freeBuffers = freeBuffers;
    data->pendingRequests = pendingRequests;

    psem_up(data->freeBuffers->sem, ACCESS);

    uint32_t nc = 1;
    pid_t childs[nc];
    for (uint32_t i = 0; i < nc; i++)
    {
        if ((childs[i] = pfork()) == 0)
        {
            Client(i + 1, data);
            exit(EXIT_SUCCESS);
        } else {
            Server(i + 1, data);
        }
    }

    for (uint32_t i = 0; i < nc; i++)
    {
        pwaitpid(childs[i], NULL, 0);
        pkill(childs[i], SIGINT);
    }

    /* remove resources */
    pshmdt(data->freeBuffers);
    pshmdt(data->pendingRequests);
    pshmdt(data);
    pshmctl(shmid, IPC_RMID, NULL);

    return 0;
}