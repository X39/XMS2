#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Sets current CprCount on given unit
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to set
 * @Return - NA
 * @Author - X39|Cpt. HM Murdock
 */
(_this select 0) setVariable["X39_MS2_var_Heart_cprCount", _this select 1, false];
