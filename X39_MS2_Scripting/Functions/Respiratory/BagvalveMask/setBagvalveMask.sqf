#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * sets the state for the BagvalveMask device
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - BOOL - value to set
 * @Return - NA
 */
if(!X39_MS2_var_Respiratory_Enable) exitWith {};
FORCELOCAL(_this select 0);
((_this select 0) setVariable ["X39_MS2_var_hasBagvalveMask", (_this select 1)])