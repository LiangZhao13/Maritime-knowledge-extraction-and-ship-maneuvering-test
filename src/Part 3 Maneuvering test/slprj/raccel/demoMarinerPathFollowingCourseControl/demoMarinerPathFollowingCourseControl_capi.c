#include "rtw_capi.h"
#ifdef HOST_CAPI_BUILD
#include "demoMarinerPathFollowingCourseControl_capi_host.h"
#define sizeof(s) ((size_t)(0xFFFF))
#undef rt_offsetof
#define rt_offsetof(s,el) ((uint16_T)(0xFFFF))
#define TARGET_CONST
#define TARGET_STRING(s) (s)
#ifndef SS_UINT64
#define SS_UINT64 17
#endif
#ifndef SS_INT64
#define SS_INT64 18
#endif
#else
#include "builtin_typeid_types.h"
#include "demoMarinerPathFollowingCourseControl.h"
#include "demoMarinerPathFollowingCourseControl_capi.h"
#include "demoMarinerPathFollowingCourseControl_private.h"
#ifdef LIGHT_WEIGHT_CAPI
#define TARGET_CONST
#define TARGET_STRING(s)               ((NULL))
#else
#define TARGET_CONST                   const
#define TARGET_STRING(s)               (s)
#endif
#endif
static const rtwCAPI_Signals rtBlockSignals [ ] = { { 0 , 2 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/ILOS" ) , TARGET_STRING ( "" ) , 0 , 0
, 0 , 0 , 0 } , { 1 , 0 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/x0" ) , TARGET_STRING ( "" ) , 0 , 0 ,
1 , 0 , 1 } , { 2 , 0 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/Gain" ) , TARGET_STRING ( "delta" ) ,
0 , 0 , 0 , 0 , 2 } , { 3 , 0 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/Saturation1" ) , TARGET_STRING (
"delta_c" ) , 0 , 0 , 0 , 0 , 2 } , { 4 , 0 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/Sum2" ) , TARGET_STRING ( "COG" ) , 0
, 0 , 0 , 0 , 2 } , { 5 , 0 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/Course autopilot /I-action   " ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 2 } , { 6 , 0 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/Crab angle/Trigonometric Function" ) ,
TARGET_STRING ( "beta_c" ) , 0 , 0 , 0 , 0 , 2 } , { 7 , 1 , TARGET_STRING (
 "demoMarinerPathFollowingCourseControl/Discerte-time EKF for SOG and COG/Five-state EKF for North-East positions"
) , TARGET_STRING ( "" ) , 0 , 0 , 2 , 0 , 0 } , { 8 , 0 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/LOS observer/Sum" ) , TARGET_STRING (
"" ) , 0 , 0 , 0 , 0 , 2 } , { 9 , 0 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/LOS observer/         " ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 2 } , { 10 , 0 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/LOS observer/Differentiator" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 2 } , { 11 , 3 , TARGET_STRING (
 "demoMarinerPathFollowingCourseControl/Mariner class cargo ship (mariner.m)/MATLAB Function"
) , TARGET_STRING ( "" ) , 0 , 0 , 1 , 0 , 2 } , { 12 , 3 , TARGET_STRING (
 "demoMarinerPathFollowingCourseControl/Mariner class cargo ship (mariner.m)/MATLAB Function"
) , TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 2 } , { 13 , 0 , TARGET_STRING (
 "demoMarinerPathFollowingCourseControl/Mariner class cargo ship (mariner.m)/Integrator"
) , TARGET_STRING ( "" ) , 0 , 0 , 1 , 0 , 2 } , { 0 , 0 , ( NULL ) , ( NULL
) , 0 , 0 , 0 , 0 , 0 } } ; static const rtwCAPI_BlockParameters
rtBlockParameters [ ] = { { 14 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/Course autopilot " ) , TARGET_STRING (
"K_nomoto" ) , 0 , 0 , 0 } , { 15 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/Course autopilot " ) , TARGET_STRING (
"Kp" ) , 0 , 0 , 0 } , { 16 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/Course autopilot " ) , TARGET_STRING (
"Td" ) , 0 , 0 , 0 } , { 17 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/Course autopilot " ) , TARGET_STRING (
"Ti" ) , 0 , 0 , 0 } , { 18 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/Discerte-time EKF for SOG and COG" ) ,
TARGET_STRING ( "alpha_1" ) , 0 , 0 , 0 } , { 19 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/Discerte-time EKF for SOG and COG" ) ,
TARGET_STRING ( "alpha_2" ) , 0 , 0 , 0 } , { 20 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/Discerte-time EKF for SOG and COG" ) ,
TARGET_STRING ( "Qd" ) , 0 , 3 , 0 } , { 21 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/Discerte-time EKF for SOG and COG" ) ,
TARGET_STRING ( "Rd" ) , 0 , 3 , 0 } , { 22 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/Discerte-time EKF for SOG and COG" ) ,
TARGET_STRING ( "h_samp" ) , 0 , 0 , 0 } , { 23 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/LOS observer" ) , TARGET_STRING (
"K_f" ) , 0 , 0 , 0 } , { 24 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/Delta" ) , TARGET_STRING ( "Value" ) ,
0 , 0 , 0 } , { 25 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/R_switch" ) , TARGET_STRING ( "Value"
) , 0 , 0 , 0 } , { 26 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/U0" ) , TARGET_STRING ( "Value" ) , 0
, 0 , 0 } , { 27 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/Waypoints xdata" ) , TARGET_STRING (
"Value" ) , 0 , 4 , 0 } , { 28 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/Waypoints ydata" ) , TARGET_STRING (
"Value" ) , 0 , 4 , 0 } , { 29 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/h" ) , TARGET_STRING ( "Value" ) , 0 ,
0 , 0 } , { 30 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/kappa" ) , TARGET_STRING ( "Value" ) ,
0 , 0 , 0 } , { 31 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/x0" ) , TARGET_STRING ( "Value" ) , 0
, 1 , 0 } , { 32 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/Gain" ) , TARGET_STRING ( "Gain" ) , 0
, 0 , 0 } , { 33 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/Saturation1" ) , TARGET_STRING (
"UpperLimit" ) , 0 , 0 , 0 } , { 34 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/Saturation1" ) , TARGET_STRING (
"LowerLimit" ) , 0 , 0 , 0 } , { 35 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/Course autopilot /Integral" ) ,
TARGET_STRING ( "A" ) , 0 , 0 , 0 } , { 36 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/Course autopilot /Integral" ) ,
TARGET_STRING ( "C" ) , 0 , 0 , 0 } , { 37 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/LOS observer/         " ) ,
TARGET_STRING ( "A" ) , 0 , 0 , 0 } , { 38 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/LOS observer/         " ) ,
TARGET_STRING ( "C" ) , 0 , 0 , 0 } , { 39 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/LOS observer/Differentiator" ) ,
TARGET_STRING ( "A" ) , 0 , 0 , 0 } , { 40 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/LOS observer/Differentiator" ) ,
TARGET_STRING ( "C" ) , 0 , 0 , 0 } , { 41 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/LOS observer/Differentiator" ) ,
TARGET_STRING ( "D" ) , 0 , 0 , 0 } , { 42 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/Course autopilot /ssa /Constant" ) ,
TARGET_STRING ( "Value" ) , 0 , 0 , 0 } , { 43 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/Course autopilot /ssa /Constant1" ) ,
TARGET_STRING ( "Value" ) , 0 , 0 , 0 } , { 44 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/LOS observer/ssa/Constant" ) ,
TARGET_STRING ( "Value" ) , 0 , 0 , 0 } , { 45 , TARGET_STRING (
"demoMarinerPathFollowingCourseControl/LOS observer/ssa/Constant1" ) ,
TARGET_STRING ( "Value" ) , 0 , 0 , 0 } , { 0 , ( NULL ) , ( NULL ) , 0 , 0 ,
0 } } ; static int_T rt_LoggedStateIdxList [ ] = { - 1 } ; static const
rtwCAPI_Signals rtRootInputs [ ] = { { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 ,
0 , 0 , 0 } } ; static const rtwCAPI_Signals rtRootOutputs [ ] = { { 0 , 0 ,
( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const
rtwCAPI_ModelParameters rtModelParameters [ ] = { { 0 , ( NULL ) , 0 , 0 , 0
} } ;
#ifndef HOST_CAPI_BUILD
static void * rtDataAddrMap [ ] = { & rtB . mr1cm4oexz , & rtB . fjukfd0ml0 [
0 ] , & rtB . an2daryais , & rtB . h2tvvxrgwg , & rtB . o4uvmnpinp , & rtB .
gvtucr52ij , & rtB . ngqggygexp , & rtB . bml0aszsag [ 0 ] , & rtB .
ncqyk10zdm , & rtB . biizpmf3bn , & rtB . n5pvzdd33j , & rtB . b4ooc0e13f [ 0
] , & rtB . cg041zrfu4 , & rtB . d25mgzrntl [ 0 ] , & rtP .
Courseautopilot_K_nomoto , & rtP . Courseautopilot_Kp , & rtP .
Courseautopilot_Td , & rtP . Courseautopilot_Ti , & rtP .
DiscertetimeEKFforSOGandCOG_alpha_1 , & rtP .
DiscertetimeEKFforSOGandCOG_alpha_2 , & rtP . DiscertetimeEKFforSOGandCOG_Qd
[ 0 ] , & rtP . DiscertetimeEKFforSOGandCOG_Rd [ 0 ] , & rtP .
DiscertetimeEKFforSOGandCOG_h_samp , & rtP . LOSobserver_K_f , & rtP .
Delta_Value , & rtP . R_switch_Value , & rtP . U0_Value , & rtP .
Waypointsxdata_Value [ 0 ] , & rtP . Waypointsydata_Value [ 0 ] , & rtP .
h_Value , & rtP . kappa_Value , & rtP . x0_Value [ 0 ] , & rtP . Gain_Gain ,
& rtP . Saturation1_UpperSat , & rtP . Saturation1_LowerSat , & rtP .
Integral_A , & rtP . Integral_C , & rtP . _A , & rtP . _C , & rtP .
Differentiator_A , & rtP . Differentiator_C , & rtP . Differentiator_D , &
rtP . Constant_Value , & rtP . Constant1_Value , & rtP .
Constant_Value_pwerxxgmrl , & rtP . Constant1_Value_gv1s2zl30d , } ; static
int32_T * rtVarDimsAddrMap [ ] = { ( NULL ) } ;
#endif
static TARGET_CONST rtwCAPI_DataTypeMap rtDataTypeMap [ ] = { { "double" ,
"real_T" , 0 , 0 , sizeof ( real_T ) , ( uint8_T ) SS_DOUBLE , 0 , 0 , 0 } }
;
#ifdef HOST_CAPI_BUILD
#undef sizeof
#endif
static TARGET_CONST rtwCAPI_ElementMap rtElementMap [ ] = { { ( NULL ) , 0 ,
0 , 0 , 0 } , } ; static const rtwCAPI_DimensionMap rtDimensionMap [ ] = { {
rtwCAPI_SCALAR , 0 , 2 , 0 } , { rtwCAPI_VECTOR , 2 , 2 , 0 } , {
rtwCAPI_VECTOR , 4 , 2 , 0 } , { rtwCAPI_MATRIX_COL_MAJOR , 6 , 2 , 0 } , {
rtwCAPI_VECTOR , 8 , 2 , 0 } } ; static const uint_T rtDimensionArray [ ] = {
1 , 1 , 7 , 1 , 5 , 1 , 2 , 2 , 6 , 1 } ; static const real_T
rtcapiStoredFloats [ ] = { 0.1 , 0.0 } ; static const rtwCAPI_FixPtMap
rtFixPtMap [ ] = { { ( NULL ) , ( NULL ) , rtwCAPI_FIX_RESERVED , 0 , 0 , (
boolean_T ) 0 } , } ; static const rtwCAPI_SampleTimeMap rtSampleTimeMap [ ]
= { { ( const void * ) & rtcapiStoredFloats [ 0 ] , ( const void * ) &
rtcapiStoredFloats [ 1 ] , ( int8_T ) 1 , ( uint8_T ) 0 } , { ( NULL ) , (
NULL ) , 2 , 0 } , { ( const void * ) & rtcapiStoredFloats [ 1 ] , ( const
void * ) & rtcapiStoredFloats [ 1 ] , ( int8_T ) 0 , ( uint8_T ) 0 } } ;
static rtwCAPI_ModelMappingStaticInfo mmiStatic = { { rtBlockSignals , 14 ,
rtRootInputs , 0 , rtRootOutputs , 0 } , { rtBlockParameters , 32 ,
rtModelParameters , 0 } , { ( NULL ) , 0 } , { rtDataTypeMap , rtDimensionMap
, rtFixPtMap , rtElementMap , rtSampleTimeMap , rtDimensionArray } , "float"
, { 373249137U , 160212562U , 1219092673U , 2074649765U } , ( NULL ) , 0 , (
boolean_T ) 0 , rt_LoggedStateIdxList } ; const
rtwCAPI_ModelMappingStaticInfo *
demoMarinerPathFollowingCourseControl_GetCAPIStaticMap ( void ) { return &
mmiStatic ; }
#ifndef HOST_CAPI_BUILD
void demoMarinerPathFollowingCourseControl_InitializeDataMapInfo ( void ) {
rtwCAPI_SetVersion ( ( * rt_dataMapInfoPtr ) . mmi , 1 ) ;
rtwCAPI_SetStaticMap ( ( * rt_dataMapInfoPtr ) . mmi , & mmiStatic ) ;
rtwCAPI_SetLoggingStaticMap ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetDataAddressMap ( ( * rt_dataMapInfoPtr ) . mmi , rtDataAddrMap ) ;
rtwCAPI_SetVarDimsAddressMap ( ( * rt_dataMapInfoPtr ) . mmi ,
rtVarDimsAddrMap ) ; rtwCAPI_SetInstanceLoggingInfo ( ( * rt_dataMapInfoPtr )
. mmi , ( NULL ) ) ; rtwCAPI_SetChildMMIArray ( ( * rt_dataMapInfoPtr ) . mmi
, ( NULL ) ) ; rtwCAPI_SetChildMMIArrayLen ( ( * rt_dataMapInfoPtr ) . mmi ,
0 ) ; }
#else
#ifdef __cplusplus
extern "C" {
#endif
void demoMarinerPathFollowingCourseControl_host_InitializeDataMapInfo (
demoMarinerPathFollowingCourseControl_host_DataMapInfo_T * dataMap , const
char * path ) { rtwCAPI_SetVersion ( dataMap -> mmi , 1 ) ;
rtwCAPI_SetStaticMap ( dataMap -> mmi , & mmiStatic ) ;
rtwCAPI_SetDataAddressMap ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetVarDimsAddressMap ( dataMap -> mmi , ( NULL ) ) ; rtwCAPI_SetPath
( dataMap -> mmi , path ) ; rtwCAPI_SetFullPath ( dataMap -> mmi , ( NULL ) )
; rtwCAPI_SetChildMMIArray ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( dataMap -> mmi , 0 ) ; }
#ifdef __cplusplus
}
#endif
#endif
