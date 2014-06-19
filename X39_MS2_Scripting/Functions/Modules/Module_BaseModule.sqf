#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Module function for the base module
 *	
 *	@Author - X39|Cpt. HM Murdock
 */
if(isServer) then
{
	[[{player}], "X39_MS2_fnc_initUnit", true, true] call BIS_fnc_MP;
};