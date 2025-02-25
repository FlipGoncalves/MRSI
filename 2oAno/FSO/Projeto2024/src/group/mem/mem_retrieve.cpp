/*
 *  \author Gonçalo Machado nMec 98359
 */

#include "somm24.h"

#include <stdint.h>

namespace group 
{

// ================================================================================== //

    MemNode *memRetrieveNodeFromFreeList(uint32_t size, MemoryAllocationPolicy policy)
    {
        soProbe(409, "%s(%#x, %d)\n", __func__, size, policy);

        require(memAllocationPolicy != UndefMemoryAllocationPolicy, "Module is not in a valid open state!");
        require(memFreeList != UNDEF_MEM_NODE and memOccupiedList != UNDEF_MEM_NODE, "Module is not in a valid open state!");
        require(policy == BestFit or policy == WorstFit, "Allocation policy must be 'BestFit' or 'WorstFit'");

        MemNode* nodeToUse = nullptr;
        MemNode* nodeBeforeToUse = nullptr;
        MemNode* temp = memFreeList;
        MemNode* tempBefore= nullptr;

        while(temp != nullptr){
            if(temp->block.size >= size){
                if((policy == BestFit && (nodeToUse == nullptr || temp->block.size < nodeToUse->block.size)) || (policy == WorstFit && (nodeToUse == nullptr || temp->block.size > nodeToUse->block.size))){
                    nodeToUse = temp;
                    nodeBeforeToUse = tempBefore;
                }
            }

            tempBefore = temp;
            temp = temp->next;
        }

        if(nodeToUse->block.size == size){
            if(nodeBeforeToUse != nullptr){
                nodeBeforeToUse->next = nodeToUse->next;
            }else{
                //nodeToUse is head
                memFreeList = nodeToUse->next;
            }
        }else{
            //Split node
            MemNode* nodeNew = (MemNode*)malloc(sizeof(MemNode));

            if (nodeNew != nullptr) {
                nodeNew->block.start = nodeToUse->block.start + size;
                nodeNew->block.size = nodeToUse->block.size - size;
                nodeNew->next = nodeToUse->next;
            }else{
                throw Exception(ENOMEM,__func__);
            }

            nodeToUse->block.size = size;

            if(nodeBeforeToUse != nullptr){
                nodeBeforeToUse->next = nodeNew;
            }else{
                //nodeToUse is head
                memFreeList = nodeNew;
            }
        }

        nodeToUse->next = nullptr;

        return nodeToUse;
    }


// ================================================================================== //

    MemNode *memRetrieveNodeFromOccupiedList(uint32_t address)
    {
        soProbe(410, "%s(%#x)\n", __func__, address);

        require(memAllocationPolicy != UndefMemoryAllocationPolicy, "Module is not in a valid open state!");
        require(memFreeList != UNDEF_MEM_NODE and memOccupiedList != UNDEF_MEM_NODE, "Module is not in a valid open state!");

        MemNode* nodeToReturn = nullptr;
        MemNode* temp = memOccupiedList;


        if(memOccupiedList->block.start == address){
            nodeToReturn = memOccupiedList;
            memOccupiedList = memOccupiedList->next;
            nodeToReturn->next = nullptr;
            return nodeToReturn;
        }

        while(temp->next != nullptr){
            if(temp->next->block.start == address){
                nodeToReturn = temp->next;
                temp->next = temp->next->next;
                nodeToReturn->next = nullptr;
                return nodeToReturn;
            }
            temp = temp->next;
        }

        return nodeToReturn;
    }

// ================================================================================== //

} // end of namespace group

