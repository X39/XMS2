#include "\X39_MS2_Scripting\default.hpp"
/**
 *	LS (LimitationSystem) Function
 *	Evaluate if a given unit is allowed to use the given limited action
 *
 *	@Param1 - STRING/OBJECT	- ClassName/Object which the LimitationClass shall be assigned to
 *	@Param2 - SCALAR		- LimitationClass ID which shall be assigned
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 */
params [
	["_assignee", objNull, [objNull]],
	["_limitationClassId", "", [""]]
];

if(_limitationClassId >= count X39_MS2_var_Internal_LimitationSystem_Classes || _limitationClassId < 0) exitWith {PRINT_ERROR("Invalid LimitationClassId");};

if(ISOBJECT(_assignee)) then
{
	if(isNull _assignee) exitWith {PRINT_ERROR("Invalid Assignee");};
	_assignee setVariable["X39_MS2_var_lsClass", _limitationClassId];
}
else
{
	if(_assignee == "") exitWith {PRINT_ERROR("Invalid Assignee");};
	((X39_MS2_var_Internal_LimitationSystem_Classes select [_limitationClassId]) select 2) set [count ((X39_MS2_var_Internal_LimitationSystem_Classes select [_limitationClassId]) select 2), _assignee];
};