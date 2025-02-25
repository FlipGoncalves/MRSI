/*
 *  \author Filipe Gonçalves, 98083
 */

#include "somm24.h"
#include "string.h"

namespace group
{

// ================================================================================== //

    uint16_t jdtLoad(FILE *fin, uint32_t maxSize)
    {
        soProbe(204, "%s(%p, %#x)\n", __func__, fin, maxSize);

        require(jdtIn != UNDEF_JOB_INDEX and jdtOut != UNDEF_JOB_INDEX, "Module is not in a valid open state!");
        require(jdtCount != UNDEF_JOB_COUNT, "Module is not in a valid open state!");
        require(fin != nullptr and fileno(fin) != -1, "fin must be a valid file stream");

        // Rewind file as it was previously looked into
        rewind(fin);

        // Initialize number of loaded jobs, boolean to know when to parse the jobs and string to save the entire line
        uint16_t jobsLoaded = 0;
        bool readingJobs = false;
        char line[256];

        // Loop through all the lines in the file
        while (fgets(line, 200, fin) != NULL)
        {
            // Remove every line that starts with a comment
            if (memcmp("#", line, 1) == 0)
                continue;

            // Check for "Begin Jobs" tag to start reading job entries
            if (strstr(line, "Begin Jobs") != NULL)
            {
                readingJobs = true;
                continue;
            }

            // Check for "End Jobs" tag to stop reading job entries
            if (strstr(line, "End Jobs") != NULL)
            {
                readingJobs = false;
                break;
            }

            // Whenever we are ready to parse job entries
            if (readingJobs)
            {
                // Get job information from the file
                Job job;
                int result = sscanf(line, "%lf ; %lf ; %i", &job.submissionTime, &job.lifetime, &job.memSize);

                // Break if the end of the file is reached
                if (result != 3) 
                    break;

                // Add job to the table
                jdtTable[jdtIn] = job;

                // Update indices and counters
                jdtIn = (jdtIn + 1) % MAX_JOBS;
                jdtCount++; jobsLoaded++;
            }
        }

        // Return the number of jobs loaded
        return jobsLoaded;
    }

// ================================================================================== //

} // end of namespace group

