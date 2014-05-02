#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will return current damage value of given unit for the GENERIC hitzone
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - SCALAR - Current damage of the unit
 */
if(((_this select 0) getVariable ["X39_MS2_var_Adrenaline_HasFlatLine", false]) > 0) exitWith {0};
(_this select 0) getVariable ["X39_MS2_var_Adrenaline_heartPulse", -1]