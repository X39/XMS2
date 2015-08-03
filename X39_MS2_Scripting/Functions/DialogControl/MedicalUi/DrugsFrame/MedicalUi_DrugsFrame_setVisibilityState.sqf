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
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEDRUGSFRAME)	ctrlSetText "<";
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEDRUGSFRAME)	ctrlSetPosition [
																					[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleDrugsFrameOff select 0),
																					[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleDrugsFrameOff select 1),
																					[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleDrugsFrameOff select 2),
																					[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleDrugsFrameOff select 3)
																				];
	displayCtrl_MedicalUi(IDC_MEDICALUI_LABEL_DRUGS)			ctrlSetFade 1;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BACK_DRUGSFRAME)		ctrlSetFade 1;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LB_DRUGSLIST)			ctrlSetFade 1;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_APPLYSELECTEDDRUG)	ctrlSetFade 1;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEDRUGSFRAME)	ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LABEL_DRUGS)			ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BACK_DRUGSFRAME)		ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LB_DRUGSLIST)			ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_APPLYSELECTEDDRUG)	ctrlCommit _animationTime;
	uiSleep _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LB_DRUGSLIST)			ctrlShow false;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_APPLYSELECTEDDRUG)	ctrlShow false;
}
else
{
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEDRUGSFRAME)	ctrlSetText ">";
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEDRUGSFRAME)	ctrlSetPosition [
																					[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleDrugsFrameOn select 0),
																					[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleDrugsFrameOn select 1),
																					[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleDrugsFrameOn select 2),
																					[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleDrugsFrameOn select 3)
																				];
	displayCtrl_MedicalUi(IDC_MEDICALUI_LABEL_DRUGS)			ctrlSetFade 0;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BACK_DRUGSFRAME)		ctrlSetFade 0;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LB_DRUGSLIST)			ctrlSetFade 0;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_APPLYSELECTEDDRUG)	ctrlSetFade 0;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEDRUGSFRAME)	ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LABEL_DRUGS)			ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BACK_DRUGSFRAME)		ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LB_DRUGSLIST)			ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_APPLYSELECTEDDRUG)	ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LB_DRUGSLIST)			ctrlShow true;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_APPLYSELECTEDDRUG)	ctrlShow true;
};
profileNamespace setVariable ["X39_MS2_options_MedicalUi_toggleFrame_state_ToggleDrugsFrame", _this select 0];
saveProfileNamespace;