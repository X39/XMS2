#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will set given value to given unit for the GENERIC hitzone
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to set
 * @Return - NA
 */
["PulseChanged", _this, false, "XMS2", missionNamespace] call X39_XLib_EH_fnc_triggerEvent;
(_this select 0) setVariable ["X39_MS2_var_Heart_heartPulse", _this select 1, false];