#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * returns the current bleeding with aterial damage etc. calculated in
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - SCALAR - Current bleeding of the unit (> 0)
 */
if(!X39_MS2_var_Feature_EnableBlood) exitWith {0};
private["_val"];
_val = 0;
{
	_val = _val + (([_unit] call (missionNamespace getVariable format["X39_MS2_fnc_getBleedingOf%1", _x select HITZONE_Name])) * (if(_x select HITZONE_HasAterie && {_unit getVariable [format["X39_MS2_var_Bleeding_%1AterieDamaged", _x select HITZONE_Name], false]}) then {(missionNamespace getVariable format["X39_MS2_var_Bleeding_AterialDamageMultiplicator%1", _x select HITZONE_Name])} else {1}));
}count X39_MS2_var_Internal_HitZones;
_val