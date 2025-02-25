/*
 *  \author Filipe Gonçalves, 98083
 */

#include "somm24.h"
#include <cstdlib> // For srand and rand

namespace group
{

// ================================================================================== //

    uint16_t jdtRandomFill(uint32_t seed, uint16_t cnt, uint32_t maxSize)
    {
        soProbe(205, "%s(%u, %u, %#x)\n", __func__, seed, cnt, maxSize);

        require(jdtIn != UNDEF_JOB_INDEX and jdtOut != UNDEF_JOB_INDEX, "Module is not in a valid open state!");
        require(jdtCount != UNDEF_JOB_COUNT, "Module is not in a valid open state!");
        require(cnt == 0 or (cnt >= 2 and cnt <= MAX_JOBS), "Number of jobs is invalid");

        // Initialize random number generator
        srand(seed);

        // Initialize number of added jobs
        uint16_t jobsAdded = 0;

        // If number of jobs is 0
        if (cnt == 0) {
            cnt = rand() % (MAX_JOBS - 1) + 2;              // Random number of jobs between 2 and MAX_JOBS
        }

        // Loop through all possible jobs
        while (jobsAdded < cnt && jdtCount < MAX_JOBS)
        {
            // Create a random job
            Job newJob;
            newJob.submissionTime = rand() % (100 - 1);          // Random submission time between 0 and 100
            newJob.lifetime = rand() % (1000 - 1) + 10;          // Random execution time between 10 and 1000
            newJob.memSize = rand() % maxSize;                   // Random address space size ithin maxSize

            // Add the job to the job table
            jdtTable[jdtIn] = newJob;

            // Update indices and counters
            jdtIn = (jdtIn + 1) % MAX_JOBS;
            jdtCount++; jobsAdded++;
        }

        // Return the number of jobs added
        return jobsAdded;
    }

// ================================================================================== //

} // end of namespace group

