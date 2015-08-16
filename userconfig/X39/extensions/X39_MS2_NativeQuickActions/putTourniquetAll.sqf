#include "\X39_MS2_Scripting\default.hpp"

private["_actionIndex"];
_actionIndex = ["PUTTOURNIQUET"] call X39_MS2_fnc_getActionById;
if(_actionIndex == -1) exitWith {PRINT_ERROR("Cannot get Native XMS2 action 'PUTTOURNIQUET'"); false};

[
	localize "STR_X39_MS2_Scripting_QuickActions_putTourniquetAll_Name",						//Name
	parseText localize "STR_X39_MS2_Scripting_QuickActions_putTourniquetAll_Description",	//Description
	X39_MS2_var_Internal_MedicalActions_actionArray select _actionIndex select 2,
	{//RequiredTimeCode
		private "_count";
		_count = {[_this select 1, _x select 0] call X39_MS2_fnc_getAterialDamage} count X39_MS2_var_Internal_HitZones;
		_count = _count - {[_this select 1, _x select 0] call X39_MS2_fnc_getTournique} count X39_MS2_var_Internal_HitZones;
		if(_count < 0) exitWith {0};
		( _count * ([] call (X39_MS2_var_Internal_MedicalActions_actionArray select (_this select 0) select 6)) )
	},
	{//RequiredItemsCode
		private "_count";
		_count = {[_this select 1, _x select 0] call X39_MS2_fnc_getAterialDamage} count X39_MS2_var_Internal_HitZones;
		_count = _count - {[_this select 1, _x select 0] call X39_MS2_fnc_getTournique} count X39_MS2_var_Internal_HitZones;
		if(_count < 0) exitWith {0};
		_count
	},
	{//ConditionCode
		private ["_isAllowedToUseResult", "_count"];
		_isAllowedToUseResult = [_this select 1, (X39_MS2_var_Internal_MedicalActions_actionArray select (_this select 2)) select 5] call X39_MS2_fnc_ls_isAllowedToUse;
		_count = {!( [_this select 0, _this select 1, _x select 0, _isAllowedToUseResult select 1] call (X39_MS2_var_Internal_MedicalActions_actionArray select (_this select 2) select 3) )} count X39_MS2_var_Internal_HitZones;
		( (_isAllowedToUseResult select 0) && (_count == 0) )
	},
	{//ExecutionCode
		private ["_hitzones", "_isAllowedToUseResult"];
		_hitzones = [];
		_isAllowedToUseResult = [_this select 1, X39_MS2_var_Internal_MedicalActions_actionArray select (_this select 0) select 5] call X39_MS2_fnc_ls_isAllowedToUse;
		{
			if([_this select 1, _x select 0] call X39_MS2_fnc_getAterialDamage && ![_this select 1, _x select 0] call X39_MS2_fnc_getTournique) then
			{
				_hitzones pushBack (_x select 0);
			};
			false
		} count X39_MS2_var_Internal_HitZones;
		{
			[_this select 2, _this select 1, _x, _isAllowedToUseResult select 1] call (X39_MS2_var_Internal_MedicalActions_actionArray select (_this select 0) select 4);
			false
		} count _hitzones;
	},
	_actionIndex
] call X39_MS2_fnc_registerQuickAction;
true
