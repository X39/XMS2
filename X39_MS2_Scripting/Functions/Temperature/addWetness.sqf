#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will add given value to given units wetness value
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to add
 * @Return - SCALAR - Current wetness of the unit
 */
if(!X39_MS2_var_Temperature_enableWetness) exitWith {};
FORCELOCAL(_this select 0);
private["_wetness"];
_wetness = [(_this select 0)] call X39_MS2_fnc_getWetness;
_wetness = _wetness + ((_this select 1) * X39_MS2_var_Temperature_GlobalModificator * X39_MS2_var_Temperature_wetnessModificator);
if(_wetness > 1) then
{
	_wetness = 1;
}
else
{
	if(_wetness < 0) then
	{
		_wetness = 0;
	};
};
[_this select 0, _wetness] call X39_MS2_fnc_setWetness;
_wetness