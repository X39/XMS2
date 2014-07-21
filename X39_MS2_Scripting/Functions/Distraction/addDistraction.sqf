#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will add given value to given units distraction value
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to add
 * @Return - SCALAR - Current distraction of the unit
 */
if(!X39_MS2_var_Feature_EnableDistraction) exitWith {};
FORCELOCAL(_this select 0);
private["_distraction"];
_distraction = [(_this select 0)] call X39_MS2_fnc_getDistraction;
_distraction = _distraction + (_this select 1);
if(_distraction < 0) then
{
	_distraction = 0;
};
[_this select 0, _distraction] call X39_MS2_fnc_setDistraction;
_distraction