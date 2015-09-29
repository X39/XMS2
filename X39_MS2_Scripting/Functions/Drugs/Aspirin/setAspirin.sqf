#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * sets given units aspirin concentration
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to set
 * @Return - NA
 * @Author - X39
 */
if(X39_MS2_var_Events_EnableSetEvents) then
{
	["AspirinChanged", _this, false, "XMS2", missionNamespace] call X39_XLib_EH_fnc_triggerEvent;
};
(_this select 0) setVariable ["X39_MS2_var_Drugs_Aspirin_value", _this select 1, false];