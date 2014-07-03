#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will add given value to given units pain value
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to add
 * @Return - SCALAR - Current pain of the unit
 */
if(!X39_MS2_var_Feature_EnablePain) exitWith {};
FORCELOCAL(_this select 0);
private["_pain"];
_pain = [(_this select 0)] call X39_MS2_fnc_getPain;
_pain = _pain + ((_this select 1) * X39_MS2_var_Pain_GlobalModificator);
if(_pain > X39_MS2_var_Pain_maxPain) then
{
	_pain = X39_MS2_var_Pain_maxPain;
}
else
{
	if(_pain < 0) then
	{
		_pain = 0;
	};
};
[_this select 0, _pain] call X39_MS2_fnc_setPain;
_pain