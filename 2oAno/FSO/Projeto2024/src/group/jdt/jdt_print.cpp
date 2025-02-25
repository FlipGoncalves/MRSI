/*
 *  \author Filipe Gonçalves, 98083
 */

#include "somm24.h"
#include <stdio.h>
#include <stdint.h>

namespace group 
{

// ================================================================================== //

    void jdtPrint(FILE *fout)
    {
        soProbe(203, "%s(%p)\n", __func__, fout);

        require(jdtIn != UNDEF_JOB_INDEX and jdtOut != UNDEF_JOB_INDEX, "Module is not in a valid open state!");
        require(jdtCount != UNDEF_JOB_COUNT, "Module is not in a valid open state!");
        require(fout != NULL and fileno(fout) != -1, "fout must be a valid file stream");

        // Print the table header
        fprintf(fout, "+=====================================+\n");
        fprintf(fout, "|          JDT module state           |\n");
        fprintf(fout, "+------------+------------+-----------+\n");
        fprintf(fout, "| submission |  lifetime  |  memory   |\n");
        fprintf(fout, "|    time    |            | requested |\n");
        fprintf(fout, "+------------+------------+-----------+\n");

        // Get current Job index
        uint16_t current = jdtOut;

        // Iterate through the job table
        for (uint16_t i = 0; i < jdtCount; i++)
        {
            // Get current Job
            Job job = jdtTable[current];

            // Print relevant information about the Job
            fprintf(fout, "|%11.1f |%11.1f |%10.1p |\n", job.submissionTime, job.lifetime, job.memSize);

            // Move to the next job in the circular buffer
            current = (current + 1) % MAX_JOBS;
        }

        // Print the table footer
        fprintf(fout, "+=====================================+\n");
    }

// ================================================================================== //

} // end of namespace group

