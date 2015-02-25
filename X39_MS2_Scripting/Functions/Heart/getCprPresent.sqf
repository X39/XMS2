#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * returns true depending on if a CPR is performed right now on targeted unit
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - BOOL - result
 */
(_this select 0) getVariable ["X39_MS2_var_Heart_cprPresent", false]