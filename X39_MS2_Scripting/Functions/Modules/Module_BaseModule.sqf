#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Module function for the base module
 *	
 *	@Author - X39|Cpt. HM Murdock
 */
if(!isDedicated && hasInterface) then
{
	[{player}, true, true] call X39_MS2_fnc_initUnit;
};