#include "demoMarinerPathFollowingCourseControl_capi_host.h"
static demoMarinerPathFollowingCourseControl_host_DataMapInfo_T root;
static int initialized = 0;
__declspec( dllexport ) rtwCAPI_ModelMappingInfo *getRootMappingInfo()
{
    if (initialized == 0) {
        initialized = 1;
        demoMarinerPathFollowingCourseControl_host_InitializeDataMapInfo(&(root), "demoMarinerPathFollowingCourseControl");
    }
    return &root.mmi;
}

rtwCAPI_ModelMappingInfo *mexFunction(){return(getRootMappingInfo());}
