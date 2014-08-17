#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will add given value to given unit for the LEGS hitzone
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to add
 * @Return - SCALAR - Current Bleeding of the unit
 */
if(!X39_MS2_var_Bleeding_EnableClotting) exitWith {};
FORCELOCAL(_this select 0);
private["_clottingValue"];
_clottingValue = [(_this select 0)] call X39_MS2_fnc_getClotting;
_clottingValue = _clottingValue + ((_this select 1) * X39_MS2_var_Bleeding_GlobalModificator * X39_MS2_var_Bleeding_ClottingModificator);
if(_clottingValue > 2) then
{
	_clottingValue = 2;
}
else
{
	if(_clottingValue < 0) then
	{
		_clottingValue = 0;
	};
};
[_this select 0, _clottingValue] call X39_MS2_fnc_setClotting;
_clottingValue