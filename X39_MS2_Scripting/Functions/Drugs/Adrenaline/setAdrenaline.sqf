#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will set given value to given unit for the GENERIC hitzone
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to set
 * @Return - NA
 */
if(X39_MS2_var_Events_EnableSetEvents) then
{
	["AdrenalineChanged", _this, false, "XMS2", missionNamespace] call X39_XLib_EH_fnc_triggerEvent;
};
(_this select 0) setVariable ["X39_MS2_var_Drugs_Adrenaline_value", _this select 1, false];