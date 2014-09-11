#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * returns true if any hitzone has a tournique
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - BOOL
 */
if(!X39_MS2_var_Feature_EnableBlood || !X39_MS2_var_Bleeding_EnableAterialDamage) exitWith {false};
if(![_this select 1] call X39_MS2_fnc_isValidHitZone) exitWith {false};
((_this select 0) getVariable [format["X39_MS2_var_Bleeding_%1AterieDamaged", _this select 1], false])
_flag = false;
({
	((_this select 0) getVariable [format["X39_MS2_var_Bleeding_%1AterieDamaged", _x select HITZONE_NAME], false])
}count X39_MS2_var_Internal_HitZones > 0)