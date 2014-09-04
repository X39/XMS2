#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Function will check if given HitZone is a valid hitzone
 * 
 * @Param1 - STRING - XMS2 HitZone
 * @Return - BOOL - true/false depending on if given hitZone is a valid one
 */
private["_flag"];
_flag = false;
scopeName "main";
{
	if((_x select HITZONE_NAME) == (_this select 0)) then {
		_flag = true;
		breakTo "main";
	};
	false
} count X39_MS2_var_Internal_HitZones;
_flag