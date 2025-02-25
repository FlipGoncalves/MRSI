/*
 *  \author ...
 */

#include "somm24.h"
#include "swp.h"
#include "tam.h"

#include <cstddef>
#include <stdint.h>
#include <stdio.h>

namespace group {

// ==================================================================================
// //

void swpPrint(FILE *fout) {
  soProbe(603, "%s(%p)\n", __func__, fout);

  require(swappingPolicy == FIFO or swappingPolicy == FirstFit,
          "Module is not in a valid open state!");
  require(swpList != UNDEF_SWP_NODE and swpTail != UNDEF_SWP_NODE,
          "Module is not in a valid open state!");
  require(fout != NULL and fileno(fout) != -1,
          "fout must be a valid file stream");

  switch (swappingPolicy) {
  case -1: ///< Indication that no policy has been yet defined
           /// UndefSwappingPolicy

    fprintf(fout,
            "+=====================+\n"
            "|  SWP Module State   |\n"
            "|     %8s      |\n"
            "+-------+-------------+\n"
            "|  PID  | memory size |\n"
            "+-------+-------------+\n",
            "(UndefSwappingPolicy)");
    break;
  case 1: ///< try to swap in the oldest process in the queu
    fprintf(fout,
            "+=====================+\n"
            "|  SWP Module State   |\n"
            "|     %8s        |\n"
            "+-------+-------------+\n"
            "|  PID  | memory size |\n"
            "+-------+-------------+\n",
            "(FIFO)");
    break;
  default: ///< try to swap in the oldest process that fits in the biggest
           ///< available memory block

    fprintf(fout,
            "+=====================+\n"
            "|  SWP Module State   |\n"
            "|     %8s      |\n"
            "+-------+-------------+\n"
            "|  PID  | memory size |\n"
            "+-------+-------------+\n",
            "(FirstFit)");
    break;
  }
  SwpNode *node = swpList;
  if (swpList == NULL) {
    fprintf(fout, "+=====================+\n");
    return;
  }
  fprintf(fout, "|%6u |%#12x |\n", swpList->process.pid, swpList->process.size);
  while (node != NULL && node->next != NULL) {
    fprintf(fout, "|%6u |%#12x |\n", node->process.pid, node->process.size);
    node = node->next;
  }
  /**
   *
   *|  1000 |      0x7000 |
   */
  fprintf(fout, "+=====================+\n");
}

// ==================================================================================
// //

} // end of namespace group
