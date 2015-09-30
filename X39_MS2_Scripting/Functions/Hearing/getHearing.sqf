#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * returns a units hearing value
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - SCALAR
 */
private "_hearingAbility";
params ["_unit"];
_hearingAbility = _unit getVariable ["X39_MS2_var_Hearing_value", 0];
if(_unit getVariable ["X39_MS2_var_hasEarplugs", false] && {count _this < 2}) then
{
	_hearingAbility = _hearingAbility - X39_MS2_var_Hearing_reductionThroughEarplugs;
};
if(_hearingAbility < 0) then
{
	_hearingAbility = 0;
};
_hearingAbility