/*
 *  \author Filipe Gonçalves, 98083
 */

#include "somm24.h"

namespace group
{

// ================================================================================== //

    void swpTerm()
    {
        soProbe(602, "%s()\n", __func__);

        require(swappingPolicy == FIFO or swappingPolicy == FirstFit, "Module is not in a valid open state!");
        require(swpList != UNDEF_SWP_NODE and swpTail != UNDEF_SWP_NODE, "Module is not in a valid open state!");

        // Empty the linked list
        while (swpList != nullptr)
        {
            SwpNode *temp = swpList; 
            swpList = swpList->next;
            delete temp;
        }

        // Reset the swapping policy and head and tail pointers
        swappingPolicy = UndefSwappingPolicy; 
        swpList = UNDEF_SWP_NODE; swpTail = UNDEF_SWP_NODE;
    }

// ================================================================================== //

} // end of namespace group

