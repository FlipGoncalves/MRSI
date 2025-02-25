/*
 *  \author Filipe Gonçalves, 98083
 */

#include "somm24.h"

namespace group 
{

// ================================================================================== //

    void jdtTerm() 
    {
        soProbe(202, "%s()\n", __func__);

        require(jdtIn != UNDEF_JOB_INDEX and jdtOut != UNDEF_JOB_INDEX, "Module is not in a valid open state!");
        require(jdtCount != UNDEF_JOB_COUNT, "Module is not in a valid open state!");

        // Reset the indices and job count
        jdtIn = UNDEF_JOB_INDEX; jdtOut = UNDEF_JOB_INDEX; jdtCount = UNDEF_JOB_COUNT;

        // Clear the job table
        for (uint16_t i = 0; i < MAX_JOBS; i++)
            jdtTable[i] = Job();
    }

// ================================================================================== //

} // end of namespace group

