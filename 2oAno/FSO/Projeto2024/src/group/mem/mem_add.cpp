/*
 *  \author Gonçalo Machado nMec 98359
 */

#include "somm24.h"

#include <stdint.h>

namespace group 
{

// ================================================================================== //

    void memAddNodeToFreeList(MemNode *p)
    {
        soProbe(407, "%s(%p)\n", __func__, p);

        require(memAllocationPolicy != UndefMemoryAllocationPolicy, "Module is not in a valid open state!");
        require(memFreeList != UNDEF_MEM_NODE and memOccupiedList != UNDEF_MEM_NODE, "Module is not in a valid open state!");
        require(p != nullptr, "p must be a valid pointer");

        if(memFreeList == nullptr){
            memFreeList = p;
            return;
        }

        if(memFreeList->block.start > p->block.start){
            if((p->block.start + p->block.size) == memFreeList->block.start){
                //Merge right
                MemNode* nodeToDelete = memFreeList;
                p->block.size = p->block.size + memFreeList->block.size;
                p->next = memFreeList->next;
                memFreeList = p;
                free(nodeToDelete);
            }else{
                p->next = memFreeList;
            }
            memFreeList = p;
            return;
        }

        MemNode* temp = memFreeList;

        while(temp->next != nullptr){
            if(temp->next->block.start > p->block.start){
                p->next = temp->next;
                temp->next = p;
                if((p->block.start + p->block.size) == p->next->block.start){
                    //merge right
                    MemNode* nodeToDelete = p->next;
                    p->block.size = p->block.size + p->next->block.size;
                    p->next = p->next->next;
                    free(nodeToDelete);
                }
                if((temp->block.start + temp->block.size) == p->block.start){
                    //merge left
                    MemNode* nodeToDelete = p;
                    temp->block.size = temp->block.size + p->block.size;
                    temp->next = p->next;
                    free(nodeToDelete);
                }
                return;
            }
            temp = temp->next;
        }

        if(temp->next == nullptr){
            if((temp->block.start + temp->block.size) == p->block.start){
                //merge left
                MemNode* nodeToDelete = p;
                temp->block.size = temp->block.size + p->block.size;
                temp->next = p->next;
                free(nodeToDelete);
            }
            else{
                temp->next = p;
            }
            return;
        }
        
    }

// ================================================================================== //

    void memAddNodeToOccupiedList(MemNode *p)
    {
        soProbe(408, "%s(%p)\n", __func__, p);

        require(memAllocationPolicy != UndefMemoryAllocationPolicy, "Module is not in a valid open state!");
        require(memFreeList != UNDEF_MEM_NODE and memOccupiedList != UNDEF_MEM_NODE, "Module is not in a valid open state!");
        require(p != nullptr, "p must be a valid pointer");


        if(memOccupiedList == nullptr){
            memOccupiedList = p;
            return;
        }


        if(memOccupiedList->block.start > p->block.start){
            p->next = memOccupiedList;
            memOccupiedList = p;
            return;
        }

        MemNode* temp = memOccupiedList;

        while(temp->next != nullptr){
            if(temp->next->block.start > p->block.start){
                p->next = temp->next;
                temp->next = p;
                return;
            }
            temp = temp->next;
        }

        if(temp->next == nullptr){
            temp->next = p;
            return;
        }

    }

// ================================================================================== //

} // end of namespace group

