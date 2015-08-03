#include "\X39_MS2_Scripting\default.hpp"
#include "\X39_MS2_UIs\MedicalUi\ui.defs"
/**
 *	UI function
 *	
 *	@Param1 - BOOL - True to show the UI frame; False to hide the UI frame
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
params [
	["_flag", false, [false]],
	["_animationTime", MEDICALUI_ANIMATIONTIME, [0]]
];
if(!_flag) then
{
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEDIAGNOSTICFRAME)	ctrlSetText "<";
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEDIAGNOSTICFRAME)				ctrlSetPosition [
																								[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleDiagnosticFrameOff select 0),
																								[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleDiagnosticFrameOff select 1),
																								[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleDiagnosticFrameOff select 2),
																								[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleDiagnosticFrameOff select 3)
																							];
	displayCtrl_MedicalUi(IDC_MEDICALUI_LABEL_DIAGNOSTIC)						ctrlSetFade 1;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BACK_DIAGNOSTICFRAME)					ctrlSetFade 1;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LB_DIAGNOSTICSLIST)						ctrlSetFade 1;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_ADDSELECTEDDIAGNOSTICSTOTRIAGECARD)	ctrlSetFade 1;
	displayCtrl_MedicalUi(IDC_MEDICALUI_CB_CHECKUNITTYPE)						ctrlSetFade 1;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_CHECKUNIT)							ctrlSetFade 1;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEDIAGNOSTICFRAME)				ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LABEL_DIAGNOSTIC)						ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BACK_DIAGNOSTICFRAME)					ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LB_DIAGNOSTICSLIST)						ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_ADDSELECTEDDIAGNOSTICSTOTRIAGECARD)	ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_CB_CHECKUNITTYPE)						ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_CHECKUNIT)							ctrlCommit _animationTime;
	uiSleep _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LB_DIAGNOSTICSLIST)						ctrlShow false;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_ADDSELECTEDDIAGNOSTICSTOTRIAGECARD)	ctrlShow false;
	displayCtrl_MedicalUi(IDC_MEDICALUI_CB_CHECKUNITTYPE)						ctrlShow false;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_CHECKUNIT)							ctrlShow false;
}
else
{
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEDIAGNOSTICFRAME)	ctrlSetText ">";
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEDIAGNOSTICFRAME)				ctrlSetPosition [
																								[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleDiagnosticFrameOn select 0),
																								[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleDiagnosticFrameOn select 1),
																								[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleDiagnosticFrameOn select 2),
																								[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleDiagnosticFrameOn select 3)
																							];
	displayCtrl_MedicalUi(IDC_MEDICALUI_LABEL_DIAGNOSTIC)						ctrlSetFade 0;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BACK_DIAGNOSTICFRAME)					ctrlSetFade 0;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LB_DIAGNOSTICSLIST)						ctrlSetFade 0;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_ADDSELECTEDDIAGNOSTICSTOTRIAGECARD)	ctrlSetFade 0;
	displayCtrl_MedicalUi(IDC_MEDICALUI_CB_CHECKUNITTYPE)						ctrlSetFade 0;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_CHECKUNIT)							ctrlSetFade 0;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEDIAGNOSTICFRAME)				ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LABEL_DIAGNOSTIC)						ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BACK_DIAGNOSTICFRAME)					ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LB_DIAGNOSTICSLIST)						ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_ADDSELECTEDDIAGNOSTICSTOTRIAGECARD)	ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_CB_CHECKUNITTYPE)						ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_CHECKUNIT)							ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LB_DIAGNOSTICSLIST)						ctrlShow true;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_ADDSELECTEDDIAGNOSTICSTOTRIAGECARD)	ctrlShow true;
	displayCtrl_MedicalUi(IDC_MEDICALUI_CB_CHECKUNITTYPE)						ctrlShow true;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_CHECKUNIT)							ctrlShow true;
};
profileNamespace setVariable ["X39_MS2_options_MedicalUi_toggleFrame_state_ToggleDiagnosticFrame", _this select 0];
saveProfileNamespace;