#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	
 *	@Param1 - OBJECT	- UNIT
 *	@Param2 - TEXT	- Message
 *	@Return - NA
 *	@Author	- X39|Cpt. HM Murdock
 */
params [
	["_unit", objNull, [objNull]],
	["_msg", "", ["", text ""]]
];

FORCELOCAL(_unit);


hint format["%1", _msg];