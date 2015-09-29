#include "\X39_MS2_Scripting\default.hpp"
/**
 *	LS (LimitationSystem) Function
 *	Converts current LimitationSystem Classes&Objects to its final state so that it can be used & sends them to all clients
 *	@Return - NA
 *	@Author - X39
 */
X39_MS2_var_Internal_LimitationSystem_Structure = [];
private["_finalArray"];
{
	
	_finalArray = ([_forEachIndex, _finalArray] call X39_MS2_fnc_ls_convertLimitation);
	//																	CLASS		LIMITATION	  <-CON.->	EFFICENCY
	X39_MS2_var_Internal_LimitationSystem_Structure set[_forEachIndex, [_x select 2, _finalArray select 0, _finalArray select 1]];
	
}forEach X39_MS2_var_Internal_LimitationSystem_Limitations;

publicVariable "X39_MS2_var_Internal_LimitationSystem_Structure";