#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will add given value to given units pain value
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to add
 * @Return - SCALAR - Current pain of the unit
 */
if(!X39_MS2_var_Feature_EnableTemperature) exitWith {};
FORCELOCAL(_this select 0);
private["_temperature"];
_temperature = [(_this select 0)] call X39_MS2_fnc_getTemperature;
_temperature = _temperature + ((_this select 1) * X39_MS2_var_Temperature_GlobalModificator);
if(_temperature > X39_MS2_var_Temperature_max) then
{
	_temperature = X39_MS2_var_Temperature_max;
}
else
{
	if(_temperature < 0) then
	{
		_temperature = 0;
	};
};
[_this select 0, _temperature] call X39_MS2_fnc_setTemperature;
_temperature