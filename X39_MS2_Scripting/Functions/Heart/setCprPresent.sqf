#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Sets whether a CPR is present at given unit or not
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to set
 * @Return - NA
 */
FORCELOCAL(_this select 0);
(_this select 0) setVariable["X39_MS2_var_Heart_cprPresent", _this select 1, false];
