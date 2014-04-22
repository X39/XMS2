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

if(_currentPulse >= X39_MS2_var_Adrenaline_deadlyMaxHeartPulsePerSecond) exitWith
{
	[_unit, time] call X39_MS2_fnc_setFlatLine;
	[_unit, 3, -1] call X39_MS2_fnc_blackOutUnit;
};
if(_currentPulse >= X39_MS2_var_Adrenaline_knockOutUnitAt) then
{
	[_unit, 1, -1] call X39_MS2_fnc_blackOutUnit;
};