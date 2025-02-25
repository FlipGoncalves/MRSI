/*
 *  \author ...
 */

#include "dbc.h"
#include "exception.h"
#include "pct.h"
#include "somm24.h"
#include "tam.h"

#include <cerrno>
#include <cstdint>
#include <cstdlib>
#include <ctime>
#include <stdint.h>

namespace group {
/* ======================================================================== */

double pctLifetime(uint16_t pid) {
  soProbe(305, "%s(%u)\n", __func__, pid);

  require(pctList != UNDEF_PCT_NODE, "The PCT linked list must exist");
  require(pid > 0, "a valid process ID must be greater than zero");

  PctNode *tmp = pctList;
  double lifetime = -1;
  while (tmp != NULL) {
    if (tmp->pcb.pid == pid) {
      lifetime = tmp->pcb.lifetime;
      break;
    }
    else if (tmp->pcb.pid > pid) {
      require(tmp->pcb.pid == pid, "PID not found and ordered list was searched to this point\n");
    }
    tmp = tmp->next;
  }
  if (lifetime == -1)
      require(tmp->pcb.pid == pid, "PID not found and ordered list was searched to this point\n");
  return lifetime;
}

/* ======================================================================== */

uint32_t pctMemSize(uint16_t pid) {
  soProbe(306, "%s(%u)\n", __func__, pid);

  require(pctList != UNDEF_PCT_NODE, "The PCT linked list must exist");
  require(pid > 0, "a valid process ID must be greater than zero");

  PctNode *tmp = pctList;
  uint32_t memSize = UNDEF_ADDRESS;
  while (tmp != NULL) {
    if (tmp->pcb.pid == pid) {
      memSize = tmp->pcb.memSize;
      break;
    }
    else if (tmp->pcb.pid > pid) {
      require(tmp->pcb.pid == pid, "PID not found and ordered list was searched to this point\n");
    }
    tmp = tmp->next;
  }
  if (memSize == -1)
      require(tmp->pcb.pid == pid, "PID not found and ordered list was searched to this point\n");
  return memSize;
}

/* ======================================================================== */

uint32_t pctMemAddress(uint16_t pid) {
  soProbe(307, "%s(%u)\n", __func__, pid);

  require(pctList != UNDEF_PCT_NODE, "The PCT linked list must exist");
  require(pid > 0, "a valid process ID must be greater than zero");

  PctNode *tmp = pctList;
  uint32_t memAddress = UNDEF_ADDRESS;

  while (tmp != NULL) {
    if (tmp->pcb.pid == pid) {
      memAddress = tmp->pcb.memStart;
      break;
    }
    else if (tmp->pcb.pid > pid) {
      require(tmp->pcb.pid == pid, "PID not found and ordered list was searched to this point\n");
    }
    tmp = tmp->next;
  }

  if (memAddress == UNDEF_ADDRESS)
      require(tmp->pcb.pid == pid, "PID not found and ordered list was searched to this point\n");

  return memAddress;
}

/* ======================================================================== */

} // namespace group
