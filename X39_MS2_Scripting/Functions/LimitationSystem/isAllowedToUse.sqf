#include "\X39_MS2_Scripting\default.hpp"
/**
 *	!!!DUMMY IMPLEMENTATION!!!
 *	files to be edited when implementing:
 *		- \X39_MS2_Scripting\Functions\DialogControl\InteractionMenu\openDialog.sqf
 *	
 *	LS (LimitationSystem) Function
 *	Evaluate if a given unit is allowed to use the given limited action
 *
 *	@Param1 - OBJECT/STRING - unit/class to check
 *	@Param2 - STRING - limited action to check
 *	@Return - ARRAY - array containing the info as plain bool
 *	
 *	@Author - X39|Cpt. HM Murdock
 */
private["_input", "_limitation", "_limitationClassId"];
_input = [_this, 0, "", [objNull, ""]] call BIS_fnc_param;
_limitation = [_this, 1, "", [""]] call BIS_fnc_param;
_limitationClassId = -1;
if(ISOBJECT(_input)) then
{
	_limitationClassId = (_input getVariable ["X39_MS2_var_lsClass", -1]);
	if(_limitationClassId == -1) then
	{
		_input = typeOf _input;
	};
};
if(ISSTRING(_input) && {_input == ""}) exitWith {PRINT_ERROR("Please provide a valid input for checking");};
if(_limitationClassId == -1) then
{
	{
		scopeName "out_1";
		if(_input in (_x select 0)) then
		{
			if(!(_limitation in (_x select 1))) exitWith {};
			_limitationClassId = _forEachIndex;
			breakOut "out_1";
		};
	}forEach X39_MS2_var_Internal_LimitationSystem_Structure;
};
if(_limitationClassId == -1) exitWith {[true, 1]};
[(X39_MS2_var_Internal_LimitationSystem_Structure select _limitationClassId select 1) > 0, X39_MS2_var_Internal_LimitationSystem_Structure select _limitationClassId select 1]