#include "\X39_MS2_Scripting\default.hpp"
/**
 *	UI function
 *
 *	@Param1 - SCALAR - index
 *	@Param2 - STRING - function suffix
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
_item = [_this, 0, "", [""]] call BIS_fnc_param;
_unit = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
[format[localize format["STR_X39_MS2_Scripting_DialogControl_MedicalActionMenu_NotEnoughItems%1", floor random 5]], _item, if(isNull _unit) then { "NA" } else { name _unit }] call X39_MS2_fnc_MessagePlayer;