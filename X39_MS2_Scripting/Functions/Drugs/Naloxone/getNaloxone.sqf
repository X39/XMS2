#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * returns current units naloxone concentration
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - SCALAR
 */
private["_unit", "_naloxone"];
_unit = _this select 0;
_naloxone = 0;
if(X39_MS2_var_Feature_EnableNaloxone) then
{
	_naloxone = _naloxone + (_unit getVariable ["X39_MS2_var_Drugs_Naloxone_value", -1]);
};
_naloxone