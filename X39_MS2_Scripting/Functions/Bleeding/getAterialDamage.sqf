#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * returns the status of aterial damage state
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - STRING - XMS hitZone
 * @Return - BOOL - true/false depending on if aterie is damaged or not
 */
if(!X39_MS2_var_Feature_EnableBlood || !X39_MS2_var_Bleeding_EnableAterialDamage) exitWith {false};
if(![_this select 1] call X39_MS2_fnc_isValidHitZone) exitWith {false};
(_this select 0) getVariable [format["X39_MS2_var_Bleeding_%1AterieDamaged", _this select 1], false]
