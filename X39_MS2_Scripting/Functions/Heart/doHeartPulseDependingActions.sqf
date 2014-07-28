#include "\X39_MS2_Scripting\default.hpp"
/* 
 * Will perform all actions which are required, depending on the current heartPulse
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to set
 * @Return - NA
 */
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
if(isNull _unit) exitWith { PRINT_ERROR("Null unit have been provided"); };
_currentPulse = [_unit] call X39_MS2_fnc_getHeartPulse;

["PulseDependingActions", [_unit, _currentPulse], false, "XMS2", missionNamespace] call X39_XLib_EH_fnc_triggerEvent;

if(_currentPulse >= X39_MS2_var_Heart_deadlyMaxHeartPulsePerSecond) exitWith
{
	[_unit, time] call X39_MS2_fnc_setFlatLine;
};
if(_currentPulse >= X39_MS2_var_Heart_knockOutUnitAtPulse) exitWith
{
	[_unit, 1, X39_MS2_var_Heart_temporaryKnockOutBaseTimePulse + (random X39_MS2_var_Heart_temporaryKnockOutRandomTimePulse) - (X39_MS2_var_Heart_temporaryKnockOutRandomTimePulse / 2), localize "STR_X39_MS2_Scripting_Adrenaline_Pulse_TooHigh"] call X39_MS2_fnc_blackOutUnit;
};