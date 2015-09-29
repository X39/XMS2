#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Sets whether toungeBlocking is present or not
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to set
 * @Return - NA
 * @Author - X39
 */
(
	((_this select 0) getVariable ["X39_MS2_var_respiratory_toungeBlocking", false]) &&
	!(([_this select 0] call X39_MS2_fnc_getKingLt) || ([_this select 0] call X39_MS2_fnc_getNasopharyngeal))
)