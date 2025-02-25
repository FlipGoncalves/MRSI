/*
 *  \author Vicente
 */

#include "somm24.h"

#include <stdio.h>
#include <time.h>
#include <unistd.h>

namespace group
{

// ================================================================================== //

    void simInit(FILE *fin)
    {
        soProbe(101, "%s(%p)\n", __func__, fin);

        require(simTime == UNDEF_TIME and stepCount == UNDEF_COUNT, "Module is not in a valid closed state!");
        require(submissionTime == UNDEF_TIME and runoutTime == UNDEF_TIME, "Module is not in a valid closed state!");
        require(runningProcess == UNDEF_PID, "Module is not in a valid closed state!");
        require(fin == nullptr or fileno(fin) != -1, "fin must be NULL or a valid file pointer");

        SimParameters* spp = (SimParameters*) malloc(sizeof(SimParameters));
        spp->pidStart = 1001;
        spp->pidRandomSeed = time(NULL);
        spp->memorySize = 0x100000;
        spp->memoryKernelSize = 0x10000;
        spp->memoryAllocPolicy = WorstFit;
        spp->schedulingPolicy = FCFS;
        spp->swappingPolicy = FIFO;
        spp->jobMaxSize = 0x10000;
        spp->jobCount = 0;
        spp->jobRandomSeed = getpid();
        spp->jobLoadStream = fin;

        if(fin != nullptr){
            simConfig(fin,spp);
        }
        if (spp->jobRandomSeed == UNDEF_SEED)
            spp->jobRandomSeed = getpid();
        if (spp->pidRandomSeed == UNDEF_SEED)
            spp->pidRandomSeed = time(NULL);

        simTime = 0.0;          
        stepCount = 0; 
        runningProcess = 0;  
        submissionTime = 10.0;   
        runoutTime = NEVER;       

        jdtInit();
        uint16_t n_jobs;
        if (spp->jobLoadStream == nullptr)
            n_jobs = jdtRandomFill(spp->jobRandomSeed,spp->jobCount,spp->jobMaxSize);
        else
            n_jobs = jdtLoad(spp->jobLoadStream, spp->jobMaxSize);

        memInit(spp->memorySize,spp->memoryKernelSize,spp->memoryAllocPolicy);
        pctInit(spp->pidStart,n_jobs,spp->pidRandomSeed);
        rdyInit(spp->schedulingPolicy);
        swpInit(spp->swappingPolicy);
        


        // throw Exception(ENOSYS, __func__);
    }

// ================================================================================== //

} // end of namespace group

