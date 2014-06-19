#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAFE!
 * Checks if a unit is blacked out
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - BOOL - true when unit is blacked out, false is not
 */
((_this select 0) getvariable ["X39_MS2_var_BlackOut_isBlackedOut", false])