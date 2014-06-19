#include "\X39_MS2_Scripting\default.hpp"
/*
 *	sends the player a message
 *	
 *	@Param1 - STRING - message to output
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
_msg = [_this, 0, "", [""]] call BIS_fnc_param;
if(_msg != "") then
{
	systemChat _msg;
};