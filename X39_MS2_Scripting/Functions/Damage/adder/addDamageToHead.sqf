#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will add given value to given unit for the HEAD hitzone
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to add
 * @Return - SCALAR - Current damage of the unit
 */
private["_damage"];
_damage = [(_this select 0)] call X39_MS2_fnc_getDamageOfHead;
_damage = _damage + ((_this select 1) * X39_MS2_var_Damage_HeadModificator);
if(_damage > X39_MS2_var_Damage_maxDamageHead) then
{
	_damage = X39_MS2_var_Damage_maxDamageHead;
}
else
{
	if(_damage < 0) then
	{
		_damage = 0;
	};
};
[_this select 0, _damage] call X39_MS2_fnc_setDamageOfHead;
_damage