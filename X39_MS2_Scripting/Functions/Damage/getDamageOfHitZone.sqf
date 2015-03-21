#define ALTERNATIVEDEBUGOUTPUT
#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will return current damage value of given unit for the %1 hitzone
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - SCALAR - Current damage of the unit
 */
if(!(missionNamespace getVariable "X39_MS2_var_Damage_EnableHitzone%1")) exitWith {0};
((_this select 0) getVariable ["X39_MS2_var_Damage_%1", -1])
