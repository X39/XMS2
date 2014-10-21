#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Sets whether toungeBlocking is present or not
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to set
 * @Return - NA
 */
(_this select 0) setVariable ["X39_MS2_var_respiratory_toungeBlocking", _this select 1, false];