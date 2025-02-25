/*
 *  \author Vicente
 */

#include "somm24.h"
#include <time.h>

namespace group
{

// ================================================================================== //

    bool simStep()
    {
        soProbe(105, "%s()\n", __func__);

        require(simTime != UNDEF_TIME and stepCount != UNDEF_COUNT, "Module not in a valid open state!");
        require(submissionTime != UNDEF_TIME and runoutTime != UNDEF_TIME, "Module is not in a valid open state!");
        require(runningProcess != UNDEF_PID, "Module is not in a valid open state!");

        double nextEventTime = submissionTime < runoutTime ? submissionTime : runoutTime;
        
        if (nextEventTime == NEVER) {
            stepCount++;
            return false; // No events to process
        }
        if(submissionTime < runoutTime){
            simTime = submissionTime;
            Job nextJob = jdtFetchNext();

            double processLifeTime = nextJob.lifetime;
            double processMemSize = nextJob.memSize;
            uint16_t new_pid = pctNewProcess(simTime,processLifeTime,processMemSize);
            if (nextJob.memSize <= memBiggestFreeBlockSize()){
                uint32_t vmfn = memAlloc(processMemSize);
                rdyInsert(new_pid, processLifeTime);
                pctUpdateState(new_pid, READY, simTime, vmfn);
            }
            else{
                swpInsert(new_pid, nextJob.memSize);
                pctUpdateState(new_pid, SWAPPED, simTime);
            }
            submissionTime = jdtNextSubmission();
        }
        else {
            simTime = runoutTime;
            pctUpdateState(runningProcess, TERMINATED, simTime);
            uint32_t processMemAdd = pctMemAddress(runningProcess);
            memFree(processMemAdd);
            runningProcess = 0;
            uint16_t swpPID = swpFetch(memBiggestFreeBlockSize());
            while ( swpPID != 0){
                uint32_t swpMemSize = pctMemSize(swpPID);
                double swpLifeTime = pctLifetime(swpPID);
                if (swpMemSize <= memBiggestFreeBlockSize()){
                    uint32_t vmfn = memAlloc(swpMemSize);
                    rdyInsert(swpPID, swpLifeTime);
                    pctUpdateState(swpPID, READY, simTime,vmfn);
                }
                else{
                    swpInsert(swpPID, swpMemSize);
                    pctUpdateState(swpPID, SWAPPED, simTime);
                }
                swpPID = swpFetch(memBiggestFreeBlockSize());
            }
        }

        if(runningProcess == 0){
            uint16_t newProces = rdyFetch();
            if(newProces != 0){
                pctUpdateState(newProces, RUNNING, simTime);
                runoutTime = simTime + pctLifetime(newProces);
            }
            else{
                runoutTime = NEVER;
            }
            runningProcess = newProces;
        }
        
        // throw Exception(ENOSYS, __func__);
        stepCount++;
        return true;
    }

// ================================================================================== //

} // end of namespace group

