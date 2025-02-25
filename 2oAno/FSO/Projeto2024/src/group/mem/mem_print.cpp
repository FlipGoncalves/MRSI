/*
 *  \author Gonçalo Machado nMec 98359
 */

#include "somm24.h"

#include <stdio.h>
#include <stdint.h>
#include <sstream>
#include <string.h>
namespace group 
{

// ================================================================================== //

// Helper function to format the hexadecimal values
    std::string formatHex(uint32_t value)
    {
        std::stringstream ss;
        ss << "0x" << std::hex << value;
        return ss.str();
    }

    // ================================================================================== //

    void memPrint(FILE *fout)
    {
        soProbe(403, "%s(\"%p\")\n", __func__, fout);

        require(memAllocationPolicy != UndefMemoryAllocationPolicy, "Module is not in a valid open state!");
        require(memFreeList != UNDEF_MEM_NODE && memOccupiedList != UNDEF_MEM_NODE, "Module is not in a valid open state!");
        require(fout != nullptr && fileno(fout) != -1, "fout must be a valid file stream");

        const char *policyStr = (memAllocationPolicy == BestFit) ? "BestFit" : "WorstFit";

        int totalWidth = 29;
        int strLength = strlen(policyStr);
        int paddingLeft = (totalWidth - strLength) / 2;
        int paddingRight = totalWidth - strLength - paddingLeft;

        fprintf(fout, "+===============================+\n");
        fprintf(fout, "|       MEM module state        |\n");
        fprintf(fout, "|%*s(%s)%*s|\n", paddingLeft, "", policyStr, paddingRight, "");
        fprintf(fout, "+-------------------------------+\n");

        fprintf(fout, "|         occupied list         |\n");
        fprintf(fout, "+---------------+---------------+\n");
        fprintf(fout, "|  start frame  |     size      |\n");
        fprintf(fout, "+---------------+---------------+\n");

        for (MemNode *node = memOccupiedList; node; node = node->next)
        {
            fprintf(fout, "|%14s |%14s |\n", formatHex(node->block.start).c_str(), formatHex(node->block.size).c_str());
        }

        fprintf(fout, "+---------------+---------------+\n");

        fprintf(fout, "|            free list          |\n");
        fprintf(fout, "+---------------+---------------+\n");
        fprintf(fout, "|  start frame  |     size      |\n");
        fprintf(fout, "+---------------+---------------+\n");

        for (MemNode *node = memFreeList; node; node = node->next)
        {
            fprintf(fout, "|%14s |%14s |\n", formatHex(node->block.start).c_str(), formatHex(node->block.size).c_str());
        }

        fprintf(fout, "+===============================+\n");
    }

// ================================================================================== //

} // end of namespace group

