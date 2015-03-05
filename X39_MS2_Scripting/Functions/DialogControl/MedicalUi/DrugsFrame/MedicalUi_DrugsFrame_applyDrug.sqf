#include "\X39_MS2_Scripting\default.hpp"
#include "\X39_MS2_UIs\MedicalUi\ui.defs"
/**
 *	UI function
 *	
 *	@Param1 - BOOL - True to show the UI frame; False to hide the UI frame
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
X39_MS2_var_Internal_Handles_ApplyDrugHandle = _this spawn {
	private["_flag", "_anmiationTime", "_lbCurVal"];
	DEBUG_CODE_SC(_fnc_scriptName = "X39_MS2_fnc_MedicalUi_DrugsFrame_applyDrug")
	X39_MS2_var_Internal_DialogCommunication_MA_preventActions = true;
	_currentSelectedDrug = X39_MS2_var_Internal_MedicalUi_RegisteredDrugs select (displayCtrl_MedicalUi(IDC_MEDICALUI_LB_DRUGSLIST) lbValue (lbCurSel displayCtrl_MedicalUi(IDC_MEDICALUI_LB_DRUGSLIST)));
	_lbCurValue = (displayCtrl_MedicalUi(IDC_MEDICALUI_LB_DRUGSLIST) lbValue (lbCurSel displayCtrl_MedicalUi(IDC_MEDICALUI_LB_DRUGSLIST)));
	if(vehicle X39_MS2_var_Internal_DialogCommunication_MA_Caller == X39_MS2_var_Internal_DialogCommunication_MA_Caller) then
	{
		X39_MS2_var_Internal_DialogCommunication_MA_Caller playAction "MedicStart";
	};
	[3] call X39_MS2_fnc_setProgressBarTimeout;
	[
		X39_MS2_var_Internal_DialogCommunication_MA_Caller,
		["ainvpknlmstpsnonwrfldnon_medic", "ainvpknlmstpsnonwrfldnon_medic0s", "ainvpknlmstpsnonwrfldnon_ainvpknlmstpsnonwrfldnon_medic"],
		["ainvpknlmstpsnonwrfldnon_medicend"],
		{
			terminate X39_MS2_var_Internal_Handles_ApplyDrugHandle;
			X39_MS2_var_Internal_DialogCommunication_MA_preventActions = false;
			[] call X39_MS2_fnc_clearProgressBarTimeout;
			[] call X39_MS2_fnc_clearAnimationLock;
		},
		{},
		[X39_MS2_var_Internal_DialogCommunication_MA_Caller, X39_MS2_var_Internal_DialogCommunication_MA_Target]
	] call X39_MS2_fnc_setAnimationLock;
	[X39_MS2_var_Internal_DialogCommunication_MA_Caller, X39_MS2_var_Internal_DialogCommunication_MA_Target] call (_currentSelectedDrug select 4);
	
	uiSleep 3;
	
	if(vehicle X39_MS2_var_Internal_DialogCommunication_MA_Caller == X39_MS2_var_Internal_DialogCommunication_MA_Caller) then
	{
		X39_MS2_var_Internal_DialogCommunication_MA_Caller playAction "MedicStop";
	};
	if(X39_MS2_var_Internal_DialogCommunication_MA_Target == X39_MS2_var_Internal_DialogCommunication_MA_Caller ||
		!isPlayer X39_MS2_var_Internal_DialogCommunication_MA_Target ||
		[X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_isBlackedOut) then
	{
		DEBUG_LOG_WFn_SC("Creating no request")
		[
			true,
			X39_MS2_var_Internal_DialogCommunication_MA_Caller,
			X39_MS2_var_Internal_DialogCommunication_MA_Target,
			[
				X39_MS2_var_Internal_DialogCommunication_MA_Caller,
				X39_MS2_var_Internal_DialogCommunication_MA_Target,
				(
					[
						X39_MS2_var_Internal_DialogCommunication_MA_Caller,
						(
							X39_MS2_var_Internal_MedicalUi_RegisteredDrugs select _lbCurValue
						) select 7
					] call X39_MS2_fnc_ls_isAllowedToUse
				) select 1,
				_lbCurValue
			]
		] call X39_MS2_fnc_executeDrug;
	}
	else
	{
		DEBUG_LOG_WFn_SC("Creating a request")
		[
			format[localize "STR_X39_MS2_Scripting_Drugs_executeDrugRequestTemplate", name X39_MS2_var_Internal_DialogCommunication_MA_Caller, localize (_currentSelectedDrug select 1)],
			"X39_MS2_fnc_executeDrug",
			[
				X39_MS2_var_Internal_DialogCommunication_MA_Caller,
				X39_MS2_var_Internal_DialogCommunication_MA_Target,
				([X39_MS2_var_Internal_DialogCommunication_MA_Caller, (X39_MS2_var_Internal_MedicalUi_RegisteredDrugs select _lbCurValue) select 7] call X39_MS2_fnc_ls_isAllowedToUse) select 1,
				(displayCtrl_MedicalUi(IDC_MEDICALUI_LB_DRUGSLIST) lbValue (lbCurSel displayCtrl_MedicalUi(IDC_MEDICALUI_LB_DRUGSLIST)))
			],
			X39_MS2_var_Internal_DialogCommunication_MA_Caller,
			X39_MS2_var_Internal_DialogCommunication_MA_Target,
			true
		] call X39_XLib_fnc_createAcceptRequest;
	};
	X39_MS2_var_Internal_DialogCommunication_MA_preventActions = false;
};