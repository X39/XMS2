#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will return current clotting value of given unit
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - SCALAR - Current clotting value of the unit
 */
if(!X39_MS2_var_Bleeding_EnableClotting) exitWith {1};
(_this select 0) getVariable ["X39_MS2_var_Bleeding_Clotting", 1]