#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * returns a units current pulse
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - SCALAR
 */
if(((_this select 0) getVariable ["X39_MS2_var_Heart_hasFlatLine", -1]) > 0) exitWith {0};
(_this select 0) getVariable ["X39_MS2_var_Heart_heartPulse", -1]