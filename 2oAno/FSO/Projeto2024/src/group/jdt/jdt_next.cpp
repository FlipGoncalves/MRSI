/*
 *  \author Filipe Gonçalves, 98083
 */

#include "somm24.h"

namespace group
{

// ================================================================================== //

    double jdtNextSubmission()
    {
        soProbe(206, "%s()\n", __func__);

        require(jdtIn != UNDEF_JOB_INDEX and jdtOut != UNDEF_JOB_INDEX, "Module is not in a valid open state!");
        require(jdtCount != UNDEF_JOB_COUNT, "Module is not in a valid open state!");

        // Return the submission time of the next job to be processed if there is any, else
        return jdtCount > 0 ? jdtTable[jdtOut].submissionTime : NEVER;
    }

// ================================================================================== //

    Job jdtFetchNext()
    {
        soProbe(207, "%s()\n", __func__);

        require(jdtIn != UNDEF_JOB_INDEX and jdtOut != UNDEF_JOB_INDEX, "Module is not in a valid open state!");
        require(jdtCount != UNDEF_JOB_COUNT, "Module is not in a valid open state!");

        // Fetch the next job
        Job jobNext = jdtTable[jdtOut];

        // Update the output index and decrement job count
        jdtOut = (jdtOut + 1) % MAX_JOBS;
        jdtCount--;

        // Return the retrieved job
        return jobNext;
    }

// ================================================================================== //

} // end of namespace group


