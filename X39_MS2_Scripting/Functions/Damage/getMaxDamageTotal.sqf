#include "\X39_MS2_Scripting\default.hpp"
/* 
 * Will return the maximum damage a unit can receive
 * 
 * @Return - SCALAR - maximum damage a unit can receive
 */
private["_damage"];

_damage = 0;
{
	_damage = _damage + (missionNamespace getVariable format["X39_MS2_var_Damage_maxDamage%1", _x select HITZONE_NAME]);
	false
}count X39_MS2_var_Internal_HitZones;

_damage