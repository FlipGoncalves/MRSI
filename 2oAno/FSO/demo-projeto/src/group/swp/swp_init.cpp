/*
 *  \author ...
 */

#include "somm24.h"

namespace group
{

// ================================================================================== //

    /*
     * \brief Init the module's internal data structure
     */
    void swpInit(SwappingPolicy policy)
    {
        const char *pas;
        switch (policy)
        {
            case FirstProcess: pas = "FirstProcess"; break;
            case FirstFitProcess: pas = "FirstFitProcess"; break;
            case NoSwappingPolicy: pas = "NoSwappingPolicy"; break;
            default: pas = "Unknown policy"; break;
        }
        soProbe(601, "%s(%s)\n", __func__, pas);

        require(swappingPolicy == NoSwappingPolicy, "swappingPolicy must be NoSwappingPolicy");
        require(swpList == UNDEF_SWP_NODE, "swpList must be undefined");
        require(swpTail == UNDEF_SWP_NODE, "swpList must be undefined");
        require(policy == FirstProcess or policy == FirstFitProcess, "policy must be FirstProcess or FirstFitProcess");

        /* TODO POINT: Replace next instruction with your code */
        throw Exception(ENOSYS, __func__);
    }

// ================================================================================== //

} // end of namespace binaries

