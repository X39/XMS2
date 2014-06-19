#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Returns the first medicalAction + its index which is matching the given itemID
 *
 *	@Param1		- STRING	- ItemID (no uniqueCheck is performed here!)
 *	@Return		- ARRAY		- [arrayIndex, actionArray (the actual action)] or (if nothing was found) [-1, []]
 *	@Author - X39|Cpt. HM Murdock
 */
private["_id", "_action", "_i"];
_id = toUpper ([_this, 0	, "", [""]]	call BIS_fnc_param);
_i = 0;
_action = [""];
while {_action select 0 != _id && count X39_MS2_var_Internal_MedicalActions_actionArray > _i} do
{
	_action = X39_MS2_var_Internal_MedicalActions_actionArray select _i;
	_i = _i + 1;
};
if(count X39_MS2_var_Internal_MedicalActions_actionArray > _i) exitWith {[_i - 1, _action]};
[-1, []]