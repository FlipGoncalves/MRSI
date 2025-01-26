/*
 *  \author ...
 */

#include "somm24.h"

namespace group
{

// ================================================================================== //

    /*
     * Init the module's internal data structure
     */
    void jdtInit(uint32_t maxSize)
    {
        soProbe(201, "%s(%#x)\n", __func__, maxSize);

        require(maxAddressSpace == NO_SIZE, "Module must be closed");

        /* TODO POINT: Replace next instruction with your code */
        throw Exception(ENOSYS, __func__);
    }

// ================================================================================== //

} // end of namespace group

