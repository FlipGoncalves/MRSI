/*
 *  \author Pedro Lopes 97827
 */

#include "pct.h"
#include "somm24.h"
#include "tam.h"
#include <cstdint>
#include <cstdio>
#include <stdlib.h>
#include <time.h>

namespace group {

// ==================================================================================
// //

void pctInit(uint16_t pid0, uint16_t cnt, uint32_t seed) {
  soProbe(301, "%s(%hu, %hu, %u)\n", __func__, pid0, cnt, seed);
  require(pctList == UNDEF_PCT_NODE,
          "The module is not in a valid closed state");
  require(cnt > 1 and cnt <= MAX_JOBS, "cnt must be > 1 and <= MAX_JOBS");

  uint16_t upper_bound_pid = pid0 + cnt;

  // set random seed
  srand(seed);
  int r_pos; // store random pid to insert in pctPID list
  r_pos = (random() % (cnt));

  uint16_t pid = pid0; // initial pid to assign

  for (; pid < upper_bound_pid; pid++) {
    while (pctPID[r_pos] != 0) {
      r_pos = (random() % (cnt));
    }

    pctPID[r_pos] = pid; // assing pid to random pos
  }

  for (int i = cnt; i < MAX_JOBS; i++) {
    pctPID[i] = 0;
  }

  // REMOVE UNDEF_PCT_NODE
  pctList = NULL;
}

// ==================================================================================
// //

} // end of namespace group
