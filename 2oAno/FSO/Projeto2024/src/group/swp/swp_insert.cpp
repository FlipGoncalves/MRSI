/*
 *  \author Filipe Gonçalves, 98083
 */

#include "somm24.h"

namespace group
{

// ================================================================================== //

    void swpInsert(uint16_t pid, uint32_t size)
    {
        soProbe(604, "%s(%hu, %u)\n", __func__, pid, size);

        require(swappingPolicy == FIFO or swappingPolicy == FirstFit, "Module is not in a valid open state!");
        require(swpList != UNDEF_SWP_NODE and swpTail != UNDEF_SWP_NODE, "Module is not in a valid open state!");
        require(pid != 0, "a valid process ID must be greater than zero");

        // Create a new node
        SwpNode *newNode = new SwpNode;
        newNode->process.pid = pid;
        newNode->process.size = size;
        newNode->next = nullptr;

        // If the list is empty set both head to the new node
        // Else link the current tail to the new node
        if (swpList == nullptr)
            swpList = newNode;
        else
            swpTail->next = newNode;

        // Update the tail pointer
        swpTail = newNode;
    }

// ================================================================================== //

} // end of namespace group

