/*
 *  \author ...
 */

#include "pct.h"
#include "somm24.h"
#include "tam.h"

#include <stdint.h>
#include <stdio.h>

namespace group {

// ==================================================================================
// //

void pctPrint(FILE *fout) {
  soProbe(303, "%s(%p)\n", __func__, fout);

  require(pctList != UNDEF_PCT_NODE, "Module is not in a valid open state!");
  require(fout != NULL and fileno(fout) != -1,
          "fout must be a valid file stream");

  fprintf(fout,
          "+==================================================================="
          "===================================================+\n"
          "|                                                   PCT module "
          "state                                                   |\n"
          "+-------+-------------+-------------+-------------+------------+----"
          "--------+-------------+--------------+-------------+\n"
          "|  PID  |    state    |  admission  |  lifetime   | store time | "
          "start time | finish time | memory start | memory size |\n"
          "+-------+-------------+-------------+-------------+------------+----"
          "--------+-------------+--------------+-------------+\n");
  PctNode *tmp = pctList;
  while (tmp != NULL) {
    fprintf(fout, "| %5u | ", tmp->pcb.pid);
    switch (tmp->pcb.state) {
    case NEW:
      fprintf(fout, "%-11s |", "NEW");
      break;
    case RUNNING:
      fprintf(fout, "%-11s |", "RUNNING");
      break;
    case READY:
      fprintf(fout, "%-11s |", "READY");
      break;
    case SWAPPED:
      fprintf(fout, "%-11s |", "SWAPPED");
      break;
    case TERMINATED:
      fprintf(fout, "%-11s |", "TERMINATED");
      break;
    default:
      fprintf(fout, "%-11s |", "UNDEF");
      break;
    }
    fprintf(fout, "%12.1f |%12.1f |", tmp->pcb.admissionTime,
            tmp->pcb.lifetime);
    if (tmp->pcb.storeTime == UNDEF_TIME) {
      fprintf(fout, " %10s |", "UNDEF");
    } else {
      fprintf(fout, "%11.1f |", tmp->pcb.storeTime);
    }
    if (tmp->pcb.startTime  == UNDEF_TIME) {
      fprintf(fout, " %10s |", "UNDEF");
    } else {
      fprintf(fout, " %10.1f |", tmp->pcb.startTime);
    }

    if (tmp->pcb.finishTime  == UNDEF_TIME) {
      fprintf(fout, " %11s |", "UNDEF");
    } else {
      fprintf(fout, " %11.1f |", tmp->pcb.finishTime);
    }

    if (tmp->pcb.memStart == UNDEF_ADDRESS) {
      fprintf(fout, "%13s ", "UNDEF");
    } else {
      fprintf(fout, "%#13x ", tmp->pcb.memStart);
    }

    fprintf(fout, "|%#12x |\n", tmp->pcb.memSize);
    tmp = tmp->next;
  }
  fprintf(fout, "+============================================================="
                "=========================================================+\n");
}

// ==================================================================================
// //

} // end of namespace group
