#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * returns the state for the Oropharyngeal device
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - STRING - XMS hitZone
 * @Return - BOOL - true/false depending on if unit has Oropharyngeal device attached or not
 */
if(!X39_MS2_var_Respiratory_Enable) exitWith {false};
((_this select 0) getVariable ["X39_MS2_var_hasOropharyngeal", false])