#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Changes a units pulse value according to given value
 * Also makes sure that the pulse is in accepted bounds
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to add
 * @Return - SCALAR - Current adrenaline of the unit
 */
if(!X39_MS2_var_Feature_EnableAdrenaline) exitWith {};
FORCELOCAL(_this select 0);
private["_pulse"];
_pulse = [(_this select 0)] call X39_MS2_fnc_getHeartPulse;
_pulse = _pulse + ((_this select 1) * X39_MS2_var_Heart_pulseGlobalMultiplicator);
if(_pulse > X39_MS2_var_Heart_deadlyMaxHeartPulsePerSecond) then
{
	_pulse = X39_MS2_var_Heart_deadlyMaxHeartPulsePerSecond;
};
if(_pulse < 0) then
{
	_pulse = 0;
};
[_this select 0, _pulse] call X39_MS2_fnc_setHeartPulse;
_pulse