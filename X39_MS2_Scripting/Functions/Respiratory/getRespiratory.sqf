#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will return current respiratory value
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - SCALAR - Current respiratory of the unit
 * @Author - X39
 */
((_this select 0) getVariable ["X39_MS2_var_respiratory_value", 0])