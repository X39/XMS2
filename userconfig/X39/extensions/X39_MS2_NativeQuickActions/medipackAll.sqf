#include "\X39_MS2_Scripting\default.hpp"

private["_actionIndex"];
_actionIndex = ["BANDAGE"] call X39_MS2_fnc_getActionById;
if(_actionIndex == -1) exitWith {PRINT_ERROR("Cannot get Native XMS2 action 'BANDAGE'"); false};

[
	localize "STR_X39_MS2_Scripting_QuickActions_MedipackAll_Name",					//Name
	parseText localize "STR_X39_MS2_Scripting_QuickActions_MedipackAll_Description",	//Description
	X39_MS2_var_Internal_MedicalActions_actionArray select _actionIndex select 2,
	{//RequiredTimeCode
		private "_time";
		_time = {([_this select 1] call (missionNamespace getVariable format["X39_MS2_fnc_getBleedingOf%1", _x select 0])) > 0}count X39_MS2_var_Internal_HitZones;
		( _time * ([] call (X39_MS2_var_Internal_MedicalActions_actionArray select (_this select 0) select 6)) )
	},
	{//RequiredItemsCode
		({([_this select 1] call (missionNamespace getVariable format["X39_MS2_fnc_getDamageOf%1", _x select 0])) > 0} count X39_MS2_var_Internal_HitZones)
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
			if(([_this select 1] call (missionNamespace getVariable format["X39_MS2_fnc_getDamageOf%1", _x select 0])) > 0) then
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
