/*
 *  \author ...
 */

#include "somm24.h"
#include "tam.h"

#include <cerrno>
#include <cstddef>
#include <cstdio>
#include <stdint.h>

namespace group {

// ==================================================================================
// //

void pctUpdateState(uint16_t pid, ProcessState state, double time = UNDEF_TIME,
                    uint32_t address = UNDEF_ADDRESS) {
  bool validState = true;
  const char *sas = "UNKOWN";
  switch (state) {
  case NEW:
    sas = "NEW";
    break;
  case RUNNING:
    sas = "RUNNING";
    break;
  case READY:
    sas = "READY";
    break;
  case SWAPPED:
    sas = "SWAPPED";
    break;
  case TERMINATED:
    break;
  default:
    validState = false;
    break;
  }

  soProbe(308, "%s(%hu, %s, %.1f, %#x)\n", __func__, pid, sas, time, address);

  require(pctList != UNDEF_PCT_NODE, "Module is not in valid open state");
  require(pid != 0, "PID can't be zero");
  require(state != NEW, "on updating, state can not be NEW");
  require(validState, "Wrong state value");

  PctNode *tmp = pctList;
  while (tmp != NULL) {
    if (tmp->pcb.pid == pid) {
      break;
    } else if (tmp->pcb.pid > pid) {
      return;
    }
    tmp = tmp->next;
  }

  if (tmp == NULL) {
    throw Exception(EINVAL, __func__);
    return;
  }

  tmp->pcb.state = state;

  switch (state) {
  case RUNNING:
    sas = "RUNNING";
    tmp->pcb.state = state;
    tmp->pcb.startTime = time;
    break;
  case READY:
    sas = "READY";
    tmp->pcb.state = state;
    tmp->pcb.storeTime = time;
    break;
  case TERMINATED:
    tmp->pcb.finishTime = time;
    tmp->pcb.state = state;
    return;
    break;
  case NEW:
  case SWAPPED:
    break;
  }
  if (address != UNDEF_ADDRESS) {
    tmp->pcb.memStart = address;
  }
}

// ==================================================================================
// //

} // end of namespace group
