/*
 *  \author Gonçalo Machado nMec 98359
 */

#include "somm24.h"

#include <stdint.h>
#include <string.h>

namespace group 
{

// ================================================================================== //

    uint32_t memBiggestFreeBlockSize()
    {
        soProbe(406, "%s()\n", __func__);

        require(memAllocationPolicy != UndefMemoryAllocationPolicy, "Module is not in a valid open state!");
        require(memFreeList != UNDEF_MEM_NODE and memOccupiedList != UNDEF_MEM_NODE, "Module is not in a valid open state!");

        MemNode* temp = memFreeList;
        uint32_t max_size = 0;

        do{
            if(max_size < temp->block.size){
                max_size = temp->block.size;
            }
            if(temp->next != nullptr){
                temp = temp->next;
            }
        }while(temp->next != nullptr);

        return max_size;
    }

// ================================================================================== //

    uint32_t memAlloc(uint32_t size)
    {
        soProbe(404, "%s(%#x)\n", __func__, size);

        require(memAllocationPolicy != UndefMemoryAllocationPolicy, "Module is not in a valid open state!");
        require(memFreeList != UNDEF_MEM_NODE and memOccupiedList != UNDEF_MEM_NODE, "Module is not in a valid open state!");

        MemNode* node = memRetrieveNodeFromFreeList(size,memAllocationPolicy);

        memAddNodeToOccupiedList(node);

        return node->block.start;

    }

// ================================================================================== //

} // end of namespace group

