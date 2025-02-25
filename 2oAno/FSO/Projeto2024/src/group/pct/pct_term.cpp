/*
 *  \author ...
 */

#include "pct.h"
#include "somm24.h"
#include "tam.h"
#include <cstdlib>
#include <ctime>

namespace group {

// ==================================================================================
// //

void pctTerm() {
  soProbe(302, "%s()\n", __func__);

  require(pctList != UNDEF_PCT_NODE, "Module is not in a valid open state!");
  PctNode *tmp;
  while (pctList != NULL) {
    tmp = pctList; // curent
    pctList = pctList->next;
    free(tmp);
  }
  for(int i = 0; i < MAX_JOBS; i++)
      pctPID[i] = 0;

  pctList = UNDEF_PCT_NODE;
}

// ==================================================================================
// //

} // end of namespace group
