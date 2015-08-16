#include "\X39_MS2_Scripting\default.hpp"
#define CUControl (uiNamespace getVariable ["X39_MS2_var_Internal_QuickActions_CheckUnitControl", controlNull])

[
	localize "STR_X39_MS2_Scripting_QuickActions_ACE3_CheckUnit_Name",
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
		if(vehicle player == player) then
		{
			DEBUG_LOG_WFn_SC(format["Starting animation"])
			player playAction "MedicStart";
		};
		_timeout = X39_MS2_var_DialogControl_MedicalActionMenu_checkUnitTimeout select 2;
		[_timeout] call X39_MS2_fnc_setProgressBarTimeout;
		[
			X39_MS2_var_Internal_DialogCommunication_MA_Caller,
			["ainvpknlmstpsnonwrfldnon_medic", "ainvpknlmstpsnonwrfldnon_medic0s", "ainvpknlmstpsnonwrfldnon_ainvpknlmstpsnonwrfldnon_medic"],
			["ainvpknlmstpsnonwrfldnon_medicend"],
			{
				terminate X39_MS2_var_Internal_Handles_CheckUnitHandle;
				X39_MS2_var_Internal_DialogCommunication_MA_preventActions = false;
				[] call X39_MS2_fnc_clearProgressBarTimeout;
				[] call X39_MS2_fnc_clearAnimationLock;
			},
			{},
			[X39_MS2_var_Internal_DialogCommunication_MA_Caller, X39_MS2_var_Internal_DialogCommunication_MA_Target]
		] call X39_MS2_fnc_setAnimationLock;
		if(_timeout > 0) then
		{
			if(vehicle player == player) then
			{
				DEBUG_LOG_WFn_SC(format["Stopping animation"])
				player playAction "MedicStop";
			};
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
		_str = "";
		{
			DEBUG_LOG_WFn_SC(format["Checking %1" COMMA _x])
			if(_checkUnitType >= _x select 3) then
			{
				if(X39_MS2_var_Internal_DialogCommunication_MA_Target call (_x select 2)) then
				{
					DEBUG_LOG_WFn_SC(format["%1 is valid, Adding ..." COMMA _x])
					_str = _str + format["<t color='#%1'>%2</t>", (_x select 1) call BIS_fnc_colorRGBAtoHTML, format[(if(ISCODE(_x select 0)) then {[X39_MS2_var_Internal_DialogCommunication_MA_Target, X39_MS2_var_Internal_DialogCommunication_MA_Caller] call (_x select 0)} else {localize (_x select 0)}), name X39_MS2_var_Internal_DialogCommunication_MA_Target, name X39_MS2_var_Internal_DialogCommunication_MA_Caller]];
				};
			};
			false
		}count X39_MS2_var_Internal_MedicalMessages;
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
