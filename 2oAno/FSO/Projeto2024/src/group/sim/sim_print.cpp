/*
 *  \author Vicente
 */

#include "somm24.h"

#include <stdio.h>
#include <stdint.h>

namespace group 
{

// ================================================================================== //

    void simPrint(FILE *fout, uint32_t satelliteModules)
    {
        soProbe(103, "%s(\"%p\")\n", __func__, fout);

        require(simTime != UNDEF_TIME and stepCount != UNDEF_COUNT, "Module not in a valid open state!");
        require(submissionTime != UNDEF_TIME and runoutTime != UNDEF_TIME, "Module is not in a valid open state!");
        require(runningProcess != UNDEF_PID, "Module is not in a valid open state!");
        require(fout != NULL and fileno(fout) != -1, "fout must be a valid file stream");

        switch (satelliteModules)
        {
            case PRINT_JDT:
                jdtPrint(fout);
                fprintf(fout,"\n");
                break;
            case PRINT_PCT:
                pctPrint(fout);
                fprintf(fout,"\n");
                break;
            case PRINT_MEM:
                memPrint(fout);
                fprintf(fout,"\n");
                break;
            case PRINT_RDY:
                rdyPrint(fout);
                fprintf(fout,"\n");
                break;
            case PRINT_SWP:
                swpPrint(fout);
                fprintf(fout,"\n");
                break;
            case PRINT_ALL:
                jdtPrint(fout);
                fprintf(fout,"\n");
                pctPrint(fout);
                fprintf(fout,"\n");
                memPrint(fout);
                fprintf(fout,"\n");
                rdyPrint(fout);
                fprintf(fout,"\n");
                swpPrint(fout);
                fprintf(fout,"\n");
                break;
            default:
                break;
        }
    char runningProcessString[20] = "---";
    if(runningProcess != 0)
        sprintf(runningProcessString, "%12d", runningProcess);

    char submissionTimeString[20] = "NEVER";
    if(submissionTime != NEVER)
        sprintf(submissionTimeString, "%15.1f", submissionTime);

    char runoutTimeString[20] = "NEVER";
    if(runoutTime != NEVER)
        sprintf(runoutTimeString, "%13.1f", runoutTime);

  fprintf(fout,
          "+====================================================================================+\n"
          "+ -------------------------------- SIM Module State -------------------------------- +\n"
          "+====================================================================================+\n"
          "| simulation time |  step count  | running process | next submission |  next runout  |\n"
          "+-----------------+--------------+-----------------+-----------------+---------------+\n"
          "| %15.1f | %12d | %15s | %15s | %13s |\n"
          "+====================================================================================+\n",
          simTime,stepCount,runningProcessString,submissionTimeString,runoutTimeString);

        // throw Exception(ENOSYS, __func__);
    }

// ================================================================================== //

} // end of namespace group

