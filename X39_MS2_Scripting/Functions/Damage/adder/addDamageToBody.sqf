#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will add given value to given unit for the BODY hitzone
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to add
 * @Return - SCALAR - Current damage of the unit
 */
if(X39_MS2_var_Damage_EnableHitzoneBody) exitWith {};
FORCELOCAL(_this select 0);
private["_damage"];
_damage = [(_this select 0)] call X39_MS2_fnc_getDamageOfBody;
_damage = _damage + ((_this select 1) * X39_MS2_var_Damage_BodyModificator);
if(_damage > X39_MS2_var_Damage_maxDamageBody) then
{
	_damage = X39_MS2_var_Damage_maxDamageBody;
}
else
{
	if(_damage < 0) then
	{
		_damage = 0;
	};
};
[_this select 0, _damage] call X39_MS2_fnc_setDamageOfBody;
_damage