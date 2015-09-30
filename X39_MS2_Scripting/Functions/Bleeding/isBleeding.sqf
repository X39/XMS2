#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Checks if given unit is bleeding
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - BOOL - true/false depending on if the unit is bleeding or not
 */
if(!X39_MS2_var_Feature_EnableBlood) exitWith {false};
private["_countResult", "_flag"];
_countResult = count X39_MS2_var_Internal_HitZones;
_flag = false;
scopeName "main";
for "_i" from 0 to _countResult do
{
	if(_this call (missionNamespace getVariable format["X39_MS2_fnc_getBleedingOf%1", X39_MS2_var_Internal_HitZones select _i select HITZONE_NAME]) > 0) then
	{
		_flag = true;
		breakTo "main";
	};
};
_flag