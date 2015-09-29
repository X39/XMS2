#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will set flatLine value of given unit
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to set
 * @Param3 - ANY - If set, no blackOutUnit call will be done
 * @Return - NA
 * @Author - X39
 */
if(X39_MS2_var_Events_EnableSetEvents) then
{
	["FlatLineChanged", _this, false, "XMS2", missionNamespace] call X39_XLib_EH_fnc_triggerEvent;
};
(_this select 0) setVariable["X39_MS2_var_Heart_hasFlatLine", _this select 1, false];
if(!(count _this >= 3)) then
{
	if(_this select 1 > 0) then
	{
		[_this select 0, 3, -1, localize "STR_X39_MS2_Scripting_Adrenaline_Pulse_FlatLine"] call X39_MS2_fnc_blackOutUnit;
	}
	else
	{
		DEBUG_LOG("setFlatLine wont automatically unBlackout a unit");
	};
};