/*
 *  \author Gonçalo Machado nMec 98359
 */

#include "somm24.h"

namespace group
{

// ================================================================================== //

    uint16_t rdyFetch()
    {
        soProbe(505, "%s()\n", __func__);

        require(schedulingPolicy == FCFS or schedulingPolicy == SPN, "Module is not in a valid open state!");
        require(rdyList != UNDEF_RDY_NODE and rdyTail != UNDEF_RDY_NODE, "Module is not in a valid open state!");

        if (rdyList == nullptr) {
            return 0;
        }

        RdyNode* fetchedNode = rdyList;
        uint16_t fetchedPid = fetchedNode->process.pid;

        rdyList = rdyList->next;

        if (rdyList == nullptr) {
            rdyTail = nullptr;
        }

        free(fetchedNode);

        return fetchedPid;
    }

// ================================================================================== //

} // end of namespace group

