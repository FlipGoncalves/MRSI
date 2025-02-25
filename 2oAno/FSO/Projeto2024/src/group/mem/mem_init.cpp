/*
 *  \author Gonçalo Machado nMec 98359
 */

#include "somm24.h"

#include <stdint.h>
#include <math.h>

namespace group 
{

// ================================================================================== //

    void memInit(uint32_t memSize, uint32_t memKernelSize, MemoryAllocationPolicy policy)
    {
        const char *pas;
        switch (policy)
        {
            case UndefMemoryAllocationPolicy: pas = "UndefMemoryAllocationPolicy"; break;
            case BestFit: pas = "BestFit"; break;
            case WorstFit: pas = "WorstFit"; break;
            default: pas = "InvalidPattern"; break;
        }
        soProbe(401, "%s(%#x, %#x, %s)\n", __func__, memSize, memKernelSize, pas);

        require(memAllocationPolicy == UndefMemoryAllocationPolicy, "Module is not in a valid closed state!");
        require(memFreeList == UNDEF_MEM_NODE and memOccupiedList == UNDEF_MEM_NODE, "Module is not in a valid closed state!");
        require(memSize > memKernelSize, "total memory size must be bigger than the one use by the kernel of OS");
        require(policy == BestFit or policy == WorstFit, "policy must be BestFit or WorstFit");

        memAllocationPolicy = policy;

        uint32_t memUsable = memSize - memKernelSize;

        MemBlock memFirstBlock =  MemBlock{memKernelSize,memUsable};

        MemNode* memFirstNode = (MemNode*)malloc(sizeof(MemNode));

        if (memFirstNode != nullptr) {
            memFirstNode->block = memFirstBlock;
            memFirstNode->next = nullptr;
        }else{
            throw Exception(ENOMEM,__func__);
        }

        memFreeList = memFirstNode;
        memOccupiedList = nullptr;

    }

// ================================================================================== //

} // end of namespace group

