/*
 *  \author Pedro Lopes, Vicente Costa, Gonçalo Machado
 */

#include "dbc.h"
#include "exception.h"
#include "pct.h"
#include "somm24.h"
#include "tam.h"
#include <cerrno>
#include <cstddef>
#include <cstdio>
#include <ctime>

namespace group {
static int pos = 0;
// ==================================================================================
// //

uint16_t pctNewProcess(double admissionTime, double lifetime,
                       uint32_t memSize) {
  soProbe(304, "%s(%0.1f, %0.1f, %#x)\n", __func__, admissionTime, lifetime,
          memSize);

  require(pctList != UNDEF_PCT_NODE, "Module is not in a valid open state!");
  require(admissionTime >= 0, "Bad admission time");
  require(lifetime > 0, "Bad lifetime");
  require(memSize > 0, "Bad memory size");

  uint16_t newpid = pctPID[pos];
  if (newpid == 0)
    return NULL;

  PctNode *new_node = (PctNode *)malloc(sizeof(PctNode));
  if (new_node == NULL)
    throw new Exception(EINVAL, "Memory could not be requested");
  new_node->pcb.pid = newpid;
  new_node->pcb.admissionTime = admissionTime;
  new_node->pcb.lifetime = lifetime;
  new_node->pcb.memSize = memSize;
  new_node->pcb.state = NEW;
  new_node->pcb.storeTime = UNDEF_TIME;
  new_node->pcb.startTime = UNDEF_TIME;
  new_node->pcb.finishTime = UNDEF_TIME;
  new_node->pcb.memStart = UNDEF_ADDRESS;
  new_node->next = NULL;

  pos++;
  if (pctList == NULL) {
    pctList = new_node;
    return newpid;
  }
  // inserir na cabeca
  if (pctList->pcb.pid > newpid) {
    new_node->next = pctList;
    pctList = new_node;
    return newpid;
  }

  int not_inserted = 1;
  PctNode *tmp = pctList;
  do {
    if (tmp->next == NULL) {
      // inserir no fim
      tmp->next = new_node;
      not_inserted = 0;
      break;
    }
    if (tmp->next->pcb.pid > newpid) {
      // inserir no meio
      new_node->next = tmp->next;
      tmp->next = new_node;
      not_inserted = 0;
      break;
    }
    tmp = tmp->next;
  } while (tmp->next != NULL);

  if (not_inserted == 1) {

    if (tmp->next == NULL) {
      // inserir no fim
      tmp->next = new_node;
      not_inserted = 0;
    }
  }

  return newpid;
}

// ==================================================================================
// //

} // end of namespace group
