/*
 *  \author Filipe Gonçalves, 98083
 */

#include "somm24.h"

namespace group
{

// ================================================================================== //

    void jdtInit()
    {
        soProbe(201, "%s()\n", __func__);

        require(jdtIn == UNDEF_JOB_INDEX and jdtOut == UNDEF_JOB_INDEX, "Module is not in a valid closed state!");
        require(jdtCount == UNDEF_JOB_COUNT, "Module is not in a valid closed state!");

        // Initialize indices and count
        jdtIn = 0; jdtOut = 0; jdtCount = 0;

        // Initialize the job table 
        for (uint16_t i = 0; i < MAX_JOBS; i++)
            jdtTable[i] = Job();
    }

// ================================================================================== //

} // end of namespace group

