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
    void rdyInit(SchedulingPolicy policy)
    {
        soProbe(501, "%s()\n", __func__);

        require(schedulingPolicy == NoSchedulingPolicy, "schedulingPolicy must be NoSchedulingPolicy");
        require(rdyList == UNDEF_RDY_NODE, "rdyList must be undefined");
        require(rdyTail == UNDEF_RDY_NODE, "rdyList must be undefined");
        require(policy == FCFS or policy == SPN, "policy must be FCFS or SPN");

        /* TODO POINT: Replace next instruction with my code */
        throw Exception(ENOSYS, __func__);
    }

// ================================================================================== //

} // end of namespace binaries

