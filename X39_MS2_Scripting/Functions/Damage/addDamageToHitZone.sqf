#define ALTERNATIVEDEBUGOUTPUT
#include "\X39_MS2_Scripting\default.hpp"
private["_fnc_scriptName"];
_fnc_scriptName = "X39_MS2_fnc_setDamageOf%1";
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will add given value to given unit for the %1 hitzone (damage type)
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to add
 * @Return - SCALAR - Current damage of the unit
 */
if(!(missionNamespace getVariable "X39_MS2_var_Damage_EnableHitzone%1")) exitWith {};
FORCELOCAL(_this select 0);
private["_damage"];
_damage = [(_this select 0)] call (missionNamespace getVariable "X39_MS2_fnc_getDamageOf%1");
_damage = _damage + (((_this select 1) * (missionNamespace getVariable "X39_MS2_var_Damage_%1Modificator")) * X39_MS2_var_Damage_GlobalModificator);
if(_damage > (missionNamespace getVariable "X39_MS2_var_Damage_maxDamage%1")) then
{
	_damage = (missionNamespace getVariable "X39_MS2_var_Damage_maxDamage%1");
}
else
{
	if(_damage < 0) then
	{
		_damage = 0;
	};
};
[_this select 0, _damage] call (missionNamespace getVariable "X39_MS2_fnc_setDamageOf%1");
_damage