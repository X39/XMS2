#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * sets the state for the tournique on the given hitzone
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - STRING - XMS hitZone
 * @Param3 - BOOL - value to set
 * @Return - NA
 */
if(!X39_MS2_var_Feature_EnableBlood || !X39_MS2_var_Bleeding_EnableAterialDamage) exitWith {};
FORCELOCAL(_this select 0);
if(!([_this select 1] call X39_MS2_fnc_isValidHitZone)) exitWith {false};
(_this select 0) setVariable [format["X39_MS2_var_%1HasTourniquet", _this select 1], (_this select 2)];
