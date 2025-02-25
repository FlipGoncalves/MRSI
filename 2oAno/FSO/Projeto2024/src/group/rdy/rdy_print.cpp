/*
 *  \author ...
 */

#include "rdy.h"
#include "somm24.h"
#include "tam.h"

#include <ctime>
#include <stdint.h>
#include <stdio.h>

namespace group {

// ==================================================================================
// //

void rdyPrint(FILE *fout) {
  soProbe(503, "%s(%p)\n", __func__, fout);

  require(schedulingPolicy == FCFS or schedulingPolicy == SPN,
          "Module is not in a valid open state!");
  require(rdyList != UNDEF_RDY_NODE and rdyTail != UNDEF_RDY_NODE,
          "Module is not in a valid open state!");

  fprintf(fout, "+====================+\n"
                "|  RDY Module State  |\n");
  switch (schedulingPolicy) {
  case FCFS:
    fprintf(fout, "|       (FCFS)       |\n");
    break;
  default:
    fprintf(fout, "|       (SPN)        |\n");
    break;
  }
  fprintf(fout, "+-------+------------+\n"
                "|  PID  |  lifetime  |\n"
                "+-------+------------+\n");
  RdyNode *tmp = rdyList;
  while (tmp != NULL) {
    fprintf(fout, "| %5u | ", tmp->process.pid);
    fprintf(fout, "%10.1f |\n",
            tmp->process.lifetime);
    tmp = tmp->next;
  }

  /**
  "|  1002 |      200.0 |\n" \
  "|  1000 |      100.0 |\n" \
   \
  */
    fprintf(fout, "+====================+\n");
}

// ==================================================================================
// //

} // end of namespace group
