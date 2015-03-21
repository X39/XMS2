#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will return current blood level of given unit
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - SCALAR - Current Bleeding of the unit
 */
if(X39_MS2_var_Feature_EnableBlood) then
{
	(_this select 0) getVariable ["X39_MS2_var_Bleeding_Blood", -1]
}
else
{
	X39_MS2_var_Bleeding_maxBloodInEntireBody
};