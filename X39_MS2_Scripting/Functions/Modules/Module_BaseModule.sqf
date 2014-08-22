#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Module function for the base module
 *	
 *	@Author - X39|Cpt. HM Murdock
 */
if(isServer) then
{
	if(isNil "X39_MS2_var_ModuleProtector_BaseModule") then
	{
		X39_MS2_var_ModuleProtector_BaseModule = 0;
		[[{player}, true], "X39_MS2_fnc_initUnit", true, true] call BIS_fnc_MP;
	};
};