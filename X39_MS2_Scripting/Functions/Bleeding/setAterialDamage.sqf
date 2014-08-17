#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * sets the aterial status of a unit
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - NA
 */
if(!X39_MS2_var_Feature_EnableBlood || !X39_MS2_var_Bleeding_EnableAterialDamage) exitWith {};
(_this select 0) setVariable ["X39_MS2_var_Bleeding_AterieDamaged", (_this select 1)];