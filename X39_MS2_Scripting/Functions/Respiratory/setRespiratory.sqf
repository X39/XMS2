#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will set given value to given unit for the GENERIC hitzone
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to set
 * @Param3 - ANY - if param count >= 3 then the event wont be triggered
 * @Return - NA
 */
if(count _this < 3) then {["RespiratoryChanged", _this, false, "XMS2", missionNamespace] call X39_XLib_EH_fnc_triggerEvent;};
(_this select 0) setVariable ["X39_MS2_var_respiratory_value", _this select 1, false];