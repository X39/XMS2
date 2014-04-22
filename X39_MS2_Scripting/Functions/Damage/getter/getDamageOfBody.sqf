#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will return current damage value of given unit for the BODY hitzone
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - SCALAR - Current damage of the unit
 */
if(X39_MS2_var_Damage_EnableHitzoneBody) then
{
	(_this select 0) getVariable ["X39_MS2_var_Damage_Body", -1]
}
else
{
	0
};