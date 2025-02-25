/*
 *  \author Gonçalo Machado nMec 98359
 */

#include "somm24.h"

namespace group 
{

// ================================================================================== //

    void memTerm() 
    {
        soProbe(402, "%s()\n", __func__);

        require(memAllocationPolicy != UndefMemoryAllocationPolicy, "Module is not in a valid open state!");
        require(memFreeList != UNDEF_MEM_NODE and memOccupiedList != UNDEF_MEM_NODE, "Module is not in a valid open state!");

        MemNode* currentNode = nullptr;

        while (memFreeList != nullptr){
            currentNode = memFreeList;
            memFreeList = memFreeList->next;
            delete currentNode;
        }

        while (memOccupiedList != nullptr){
            currentNode = memOccupiedList;
            memOccupiedList = memOccupiedList->next;
            delete currentNode;
        }

        memFreeList = UNDEF_MEM_NODE;
        memOccupiedList = UNDEF_MEM_NODE;
        memAllocationPolicy = UndefMemoryAllocationPolicy;

    }

// ================================================================================== //

} // end of namespace group

