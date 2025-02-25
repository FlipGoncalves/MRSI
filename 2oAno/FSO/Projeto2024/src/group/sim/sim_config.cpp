/*
 *  \author Vicente
 */

#include "somm24.h"

#include <stdio.h>
#include <string.h>

namespace group
{

// ================================================================================== //

    void simConfig(FILE *fin, SimParameters *spp)
    {
        soProbe(104, "%s(\"%p\")\n", __func__, fin);
     
        require(simTime == UNDEF_TIME and stepCount == UNDEF_COUNT, "Module is not in a valid closed state!");
        require(submissionTime == UNDEF_TIME and runoutTime == UNDEF_TIME, "Module is not in a valid closed state!");
        require(runningProcess == UNDEF_PID, "Module is not in a valid closed state!");
        require(fin != nullptr and fileno(fin) != -1, "fin must be a valid file stream");
        require(spp != nullptr, "spp must be a valid pointer");

        bool hasErros = false;
        bool isJobsLine = false;
        char line[256];
        uint32_t lineNumber = 0;
        int n = 0;
        uint16_t pid;
        uint16_t jobCount;
        uint32_t jobRandomSeed;
        uint32_t pidRand;
        uint32_t memorySize;
        uint32_t memoryKernelSize;
        uint32_t jobMaxSize;
        char memoryAllocationPolicy[256];
        char schedulingPolicy[256];
        char swappingPolicy[256];

        while (fgets(line, sizeof(line), fin)) {
            lineNumber++;

            if (*line == '\0' || *line == '#' || *line == '\n') continue;

            if(isJobsLine){
                sscanf(line, " End Jobs %n",&n);
                if (n != 0) {
                    isJobsLine = false;
                    n = 0;
                }
                continue;
            }
            sscanf(line, " Begin Jobs %n",&n);
            if (n != 0) {
                isJobsLine = true;
                n = 0;
                continue;
            }
            sscanf(line, " PIDStart = %hu %n", &pid,&n);
            if (n != 0) {
                spp->pidStart = pid;
                n = 0;
                continue;
            }
            sscanf(line, " PIDRandomSeed = %u %n", &pidRand,&n);
            if (n != 0) {
                spp->pidRandomSeed = pidRand;
                n = 0;
                continue;
            }


            sscanf(line, " MemorySize = %x %n", &memorySize,&n);
            if (n != 0) {
                spp->memorySize = memorySize;
                n = 0;
                continue;
            }
            sscanf(line, " MemorySize = %u %n", &memorySize,&n);
            if (n != 0) {
                spp->memorySize = memorySize;
                n = 0;
                continue;
            }
            
            sscanf(line, " MemoryKernelSize = %x %n", &memoryKernelSize,&n);
            if (n != 0) {
                spp->memoryKernelSize = memoryKernelSize;
                n = 0;
                continue;
            }      
            sscanf(line, " MemoryKernelSize = %u %n", &memoryKernelSize,&n);
            if (n != 0) {
                spp->memoryKernelSize = memoryKernelSize;
                n = 0;
                continue;
            }   
              
            sscanf(line, " MemoryAllocationPolicy = %s %n",memoryAllocationPolicy,&n);
            if (n != 0) {
                if(strcmp(memoryAllocationPolicy, "WorstFit") == 0){
                    spp->memoryAllocPolicy = WorstFit;
                    n = 0;
                    continue;
                }else if(strcmp(memoryAllocationPolicy, "BestFit") == 0){
                    spp->memoryAllocPolicy = BestFit;
                    n = 0;
                    continue;
                }
                n = 0;
            }
            sscanf(line, " SchedulingPolicy = %s %n", schedulingPolicy,&n);
            if (n != 0) {
                if(strcmp(schedulingPolicy, "SPN") == 0){
                    spp->schedulingPolicy = SPN;
                    n = 0;
                    continue;
                }else if(strcmp(schedulingPolicy, "FCFS") == 0){
                    spp->schedulingPolicy = FCFS;
                    n = 0;
                    continue;
                }
                n = 0;
            }
            sscanf(line, " SwappingPolicy = %s %n",swappingPolicy,&n);
            if (n != 0) {
                if(strcmp(swappingPolicy, "FIFO") == 0){
                    spp->swappingPolicy = FIFO;
                    n = 0;
                    continue;
                }else if(strcmp(swappingPolicy, "FirstFit") == 0){
                    spp->swappingPolicy = FirstFit;
                    n = 0;
                    continue;
                }
                n = 0;
            }
            sscanf(line, " JobMaxSize = %x %n", &jobMaxSize,&n);
            if (n != 0) {
                spp->jobMaxSize = jobMaxSize;
                n = 0;
                continue;
            }
            sscanf(line, " JobMaxSize = %u %n", &jobMaxSize,&n);
            if (n != 0) {
                spp->jobMaxSize = jobMaxSize;
                n = 0;
                continue;
            }    
            sscanf(line, " JobCount = %hu %n", &jobCount,&n);
            if (n != 0) {
                 if (jobCount < MAX_JOBS)
                    spp->jobCount = jobCount;
                else
                    hasErros = true;
                n = 0;
                continue;
            }
            sscanf(line, " JobRandomSeed = %u %n", &jobRandomSeed,&n);
            if (n != 0) {
                spp->jobRandomSeed = jobRandomSeed;
                n = 0;
                continue;
            }
            hasErros = true;
            line[strlen(line)-1] = '\0';
            fprintf(stderr,"simConfig: syntax error at line %u: wrong line \"%s\"\n", lineNumber, line);

        }

        if (spp->memoryKernelSize >= spp->memorySize){
            fprintf(stderr,"semantic error: memoryKernelSize >= memorySize\n");
            hasErros = true;
        }

        if (spp->jobMaxSize > spp->memorySize - spp->memoryKernelSize){
            fprintf(stderr,"semantic error: jobMaxSize > memorySize - memoryKernelSize\n");
            hasErros = true;
        }
        

        
        if(hasErros)
            throw Exception(EINVAL, __func__);

    }

// ================================================================================== //

} // end of namespace group

