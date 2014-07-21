#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will return current distraction value of given unit
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - SCALAR - Current distraction of the unit
 */
((_this select 0) getVariable ["X39_MS2_var_distraction", 0])