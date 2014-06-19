#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will add given value to given unit for the HEAD hitzone
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to add
 * @Return - SCALAR - Current Bleeding of the unit
 */
if(!X39_MS2_var_Bleeding_EnableHitzoneHead) exitWith {};
FORCELOCAL(_this select 0);
private["_Bleeding"];
_Bleeding = [(_this select 0)] call X39_MS2_fnc_getBleedingOfHead;
_Bleeding = _Bleeding + ((_this select 1) * X39_MS2_var_Bleeding_HeadModificator);
if(_Bleeding > X39_MS2_var_Bleeding_maxBleedingHead) then
{
	_Bleeding = X39_MS2_var_Bleeding_maxBleedingHead;
}
else
{
	if(_Bleeding < 0) then
	{
		_Bleeding = 0;
	};
};
[_this select 0, _Bleeding] call X39_MS2_fnc_setBleedingOfHead;
_Bleeding