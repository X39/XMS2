#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will add given value to given unit for the HANDS hitzone
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to add
 * @Return - SCALAR - Current Bleeding of the unit
 */
private["_Bleeding"];
_Bleeding = [(_this select 0)] call X39_MS2_fnc_getBleedingOfHands;
_Bleeding = _Bleeding + ((_this select 1) * X39_MS2_var_Bleeding_HandsModificator);
if(_Bleeding > X39_MS2_var_Bleeding_maxBleedingHands) then
{
	_Bleeding = X39_MS2_var_Bleeding_maxBleedingHands;
}
else
{
	if(_Bleeding < 0) then
	{
		_Bleeding = 0;
	};
};
[_this select 0, _Bleeding] call X39_MS2_fnc_setBleedingOfHands;
_Bleeding