#include "\X39_MS2_Scripting\default.hpp"
/**
 *	!FUNCTION IS NOT CALLSAFE!
 *	updates crafting output slot
 *
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_fncCheckForRequirements", "_x", "_requirements"];
//X39_MS2_var_Internal_DialogCommunication_MA_crafting = [-1, -1, -1];
//X39_MS2_var_Internal_DialogCommunication_MA_currentItem = -1;

//@Param1 - RequirementsArray (ItemIDs)
//@Return - BOOL - true if requirements are matched, false if not
_fncCheckForRequirements = {
	private["_action", "_id"];
	({
		_action = _x call X39_MS2_fnc_getActionById;
		_id = _action select 0;
		//_action = _action select 1;
		
		if(_id in X39_MS2_var_Internal_DialogCommunication_MA_crafting) then
		{
			true
		}
		else
		{
			false
		}
	}count _this == count _this)
};

X39_MS2_var_Internal_DialogCommunication_MA_craftingResultItemIndex = -1;

for "_forEachIndex" from 1 to ((count X39_MS2_var_Internal_MedicalActions_actionArray) - 1) do 
{
	scopeName "out";
	_requirements = (X39_MS2_var_Internal_MedicalActions_actionArray select _forEachIndex) select 17;
	if(count _requirements > 0) then
	{
		if(_fncCheckForRequirements) then
		{
			X39_MS2_var_Internal_DialogCommunication_MA_craftingResultItemIndex = _forEachIndex;
			breakOut "out"
		};
	};
};