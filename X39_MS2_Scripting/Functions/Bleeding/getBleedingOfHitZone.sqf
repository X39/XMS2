#define ALTERNATIVEDEBUGOUTPUT
#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will return current Bleeding value of given unit for the BODY hitzone
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - SCALAR - Current Bleeding of the unit
 */
if(!(missionNamespace getVariable "X39_MS2_var_Bleeding_EnableHitzone%1")) exitWith {0};
((_this select 0) getVariable ["X39_MS2_var_Bleeding_%1", -1])
