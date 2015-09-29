#include "\X39_MS2_Scripting\default.hpp"
/**
 *	UI function
 *
 *	@Param1 - SCALAR - index
 *	@Param2 - STRING - function suffix
 *	@Return - N/A
 *	@Author - X39
 */
[player, localize format["STR_X39_MS2_Scripting_DialogControl_MedicalActionMenu_BlockedMessage%1", floor random 5]] call X39_MS2_fnc_notifyUnit;