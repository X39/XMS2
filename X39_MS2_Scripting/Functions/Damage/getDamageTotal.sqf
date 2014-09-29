#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will return the overall damage combined from every hitzone
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - SCALAR - Current damage of the unit
 */
private["_damage", "_unit"];

_unit = _this select 0;
_damage = 0;
{
	_damage = _damage + ([_unit] call (missionNamespace getVariable format["X39_MS2_fnc_getDamageOf%1", _x select HITZONE_NAMEzz]));
	false
}count X39_MS2_var_Internal_HitZones;

_damage