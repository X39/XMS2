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

_damage = _damage + ([_unit] call X39_MS2_fnc_getDamageOfGeneric);
_damage = _damage + ([_unit] call X39_MS2_fnc_getDamageOfHead);
_damage = _damage + ([_unit] call X39_MS2_fnc_getDamageOfBody);
_damage = _damage + ([_unit] call X39_MS2_fnc_getDamageOfHands);
_damage = _damage + ([_unit] call X39_MS2_fnc_getDamageOfLegs);
_damage