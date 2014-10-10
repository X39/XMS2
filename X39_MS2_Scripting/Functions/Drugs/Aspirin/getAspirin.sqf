#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will return current damage value of given unit for the GENERIC hitzone
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - SCALAR - Current damage of the unit
 */
private["_unit", "_Aspirin"];
_unit = _this select 0;
_Aspirin = 0;
if(X39_MS2_var_Feature_EnableAspirin) then
{
	_Aspirin = _Aspirin + (_unit getVariable ["X39_MS2_var_Drugs_Aspirin_value", -1]);
};
_Aspirin