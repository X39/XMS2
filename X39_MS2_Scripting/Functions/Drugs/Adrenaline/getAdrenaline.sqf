#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Returns current units adrenaline concentration
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - SCALAR
 */
private["_unit", "_adrenaline"];
_unit = _this select 0;
_adrenaline = 0;
if(X39_MS2_var_Feature_EnableAdrenaline) then
{
	_adrenaline = _adrenaline + (_unit getVariable ["X39_MS2_var_Drugs_Adrenaline_value", -1]);
};
_adrenaline