#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	
 *	@Param1 - OBJECT	- UNIT
 *	@Param2 - TEXT		- Message
 *	@Return - NA
 *	@Author	- X39|Cpt. HM Murdock
 */
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_msg = [_this, 0, "", ["", text ""]] call BIS_fnc_param;

FORCELOCAL(_unit);


hint format["%1", _msg];