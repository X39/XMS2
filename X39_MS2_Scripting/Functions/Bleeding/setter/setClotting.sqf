#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Sets given units clotting property
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to set
 * @Return - NA
 * @Author - X39|Cpt. HM Murdock
 */
if(!X39_MS2_var_Bleeding_EnableClotting) exitWith {};
if(X39_MS2_var_Events_EnableSetEvents) then
{
	["ClottingChanged", _this, false, "XMS2", missionNamespace] call X39_XLib_EH_fnc_triggerEvent;
};
(_this select 0) setVariable ["X39_MS2_var_Bleeding_Clotting", _this select 1, false];