/*
 *  \author Filipe Gonçalves, 98083
 */

#include "somm24.h"

namespace group
{

// ================================================================================== //

    void rdyTerm()
    {
        soProbe(502, "%s()\n", __func__);

        require(schedulingPolicy == FCFS or schedulingPolicy == SPN, "Module is not in a valid open state!");
        require(rdyList != UNDEF_RDY_NODE and rdyTail != UNDEF_RDY_NODE, "Module is not in a valid open state!");

        // Empty the linked list
        while (rdyList != nullptr)
        {
            RdyNode *temp = rdyList; 
            rdyList = rdyList->next; 
            delete temp;            
        }

        // Reset the head and tail pointers
        schedulingPolicy = UndefSchedulingPolicy;
        rdyList = UNDEF_RDY_NODE; rdyTail = UNDEF_RDY_NODE;
    }

// ================================================================================== //

} // end of namespace group

