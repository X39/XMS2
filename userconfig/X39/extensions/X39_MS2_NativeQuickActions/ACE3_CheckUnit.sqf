#include "\X39_MS2_Scripting\default.hpp"
#define CUControl (uiNamespace getVariable ["X39_MS2_var_Internal_QuickActions_CheckUnitControl", controlNull])

[
	localize "STR_X39_MS2_Scripting_QuickActions_ACE3_GiveSaline_Name",
	parseText "",
	X39_MS2_var_Internal_MedicalActions_actionArray select _actionIndex select 2,
	X39_MS2_var_Internal_MedicalActions_actionArray select _actionIndex select 6,
	{1},//RequiredItemsCode
	{true},//ConditionCode
	{//ExecutionCode
		if(isNull CUControl) then
		{
			ctrlDelete CUControl
			terminate X39_MS2_var_Internal_QuickActions_CheckUnitHandle;
		};
		uiNamespace setVariable ["X39_MS2_var_Internal_QuickActions_CheckUnitControl", (findDisplay 46) ctrlCreate["RscStructuredText", -1]];
		CUControl ctrlSetPosition [
			0.711406 * safezoneW + safezoneX,
			0.225 * safezoneH + safezoneY,
			0.283594 * safezoneW,
			0.77 * safezoneH
		];
		CUControl ctrlCommit 0;
		CUControl ctrlSetBackgroundColor [0, 0, 0, 0.25];
		X39_MS2_var_Internal_QuickActions_CheckUnitHandle = [] spawn
		{
			sleep 15;
			ctrlDelete CUControl;
			uiNamespace setVariable ["X39_MS2_var_Internal_QuickActions_CheckUnitControl", controlNull];
		};
	},
	[],
	false
] call X39_MS2_fnc_registerQuickAction;
true
