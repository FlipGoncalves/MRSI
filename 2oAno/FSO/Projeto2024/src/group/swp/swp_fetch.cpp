/*
 *  \author Pedro Lopes, Vicente Costa, Goncalo Machado, Filipe Goncalves
 */

#include "dbc.h"
#include "exception.h"
#include "sim.h"
#include "somm24.h"
#include "swp.h"
#include "tam.h"
#include <cerrno>

namespace group {

// ==================================================================================
// //

uint16_t swpFetch(uint32_t sizeAvailable) {
  soProbe(605, "%s(%#x)\n", __func__, sizeAvailable);

  require(swappingPolicy == FIFO or swappingPolicy == FirstFit,
          "Module is not in a valid open state!");
  require(swpList != UNDEF_SWP_NODE and swpTail != UNDEF_SWP_NODE,
          "Module is not in a valid open state!");

  if (swpList == NULL) {
    return 0;
  }

  SwpNode *tmp_node = swpList;
  SwpNode *tmp_node_prev = NULL;
  if (swpTail == swpList) {
    if (swpList->process.size <= sizeAvailable) {
      swpList = swpTail = NULL;

      return tmp_node->process.pid;
    }
  }

  if (swappingPolicy == FIFO) {
    if (tmp_node->process.size <= sizeAvailable) {
      swpList = tmp_node->next;
      tmp_node->next = NULL;
      return tmp_node->process.pid;
    }
  } else {
    // 101 38090 102 32732
    while (tmp_node->next != NULL) {

      tmp_node_prev = tmp_node;
      tmp_node = tmp_node->next;
      if (tmp_node->process.size <= sizeAvailable) {
        break;
      }
    }
    if (tmp_node_prev == NULL) {
      if (tmp_node->process.size <= sizeAvailable) {
        swpList = tmp_node->next;
        tmp_node->next = NULL;
        return tmp_node->process.pid;
      }
    }
    if (tmp_node == swpTail) {
      if (tmp_node->process.size <= sizeAvailable) {
        swpTail = tmp_node_prev;
        tmp_node->next = NULL;

        return tmp_node->process.pid;
      }
    }
    if (tmp_node->process.size <= sizeAvailable) {
      tmp_node_prev->next = tmp_node->next;
      tmp_node->next = NULL;
      return tmp_node->process.pid;
    }
  }
  return 0;
}

// ==================================================================================
// //

} // end of namespace group
