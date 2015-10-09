#include "\X39_MS2_Scripting\default.hpp"

private["_actionIndex"];
_actionIndex = ["HEATPACK"] call X39_MS2_fnc_getActionById;
if(_actionIndex == -1) exitWith {PRINT_ERROR("Cannot get Native XMS2 action 'HEATPACK'"); false};

[
	localize "STR_X39_MS2_Scripting_QuickActions_ACE3_GiveHeatpack_Name",
	parseText "",
	X39_MS2_var_Internal_MedicalActions_actionArray select _actionIndex select 2,
	X39_MS2_var_Internal_MedicalActions_actionArray select _actionIndex select 6,
	{1},//RequiredItemsCode
	{//ConditionCode
		private ["_isAllowedToUseResult", "_res"];
		_isAllowedToUseResult = [_this select 1, (X39_MS2_var_Internal_MedicalActions_actionArray select (_this select 2)) select 5] call X39_MS2_fnc_ls_isAllowedToUse;
		_res = ( [_this select 0, _this select 1, "", _isAllowedToUseResult select 1] call (X39_MS2_var_Internal_MedicalActions_actionArray select (_this select 2) select 3) );
		( (_isAllowedToUseResult select 0) && _res )
	},
	{//ExecutionCode
		private ["_hitzones", "_isAllowedToUseResult"];
		_hitzones = [];
		_isAllowedToUseResult = [_this select 1, X39_MS2_var_Internal_MedicalActions_actionArray select (_this select 0) select 5] call X39_MS2_fnc_ls_isAllowedToUse;
		[_this select 2, _this select 1, "", _isAllowedToUseResult select 1] call (X39_MS2_var_Internal_MedicalActions_actionArray select (_this select 0) select 4);
	},
	_actionIndex,
	true,
	false
] call X39_MS2_fnc_registerQuickAction;
true
