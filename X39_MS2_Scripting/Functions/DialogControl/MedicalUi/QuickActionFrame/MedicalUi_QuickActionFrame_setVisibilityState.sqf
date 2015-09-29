#include "\X39_MS2_Scripting\default.hpp"
#include "\X39_MS2_UIs\MedicalUi\ui.defs"
/**
 *	UI function
 *	
 *	@Param1 - BOOL - True to show the UI frame; False to hide the UI frame
 *	@Return - N/A
 *	@Author - X39
 */
params [
	["_flag", false, [false]],
	["_animationTime", MEDICALUI_ANIMATIONTIME, [0]]
];
if(!_flag) then
{
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEQUICKACTIONFRAME)	ctrlSetText ">";
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEQUICKACTIONFRAME)	ctrlSetPosition [
																						[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleQuickActionFrameOff select 0),
																						[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleQuickActionFrameOff select 1),
																						[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleQuickActionFrameOff select 2),
																						[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleQuickActionFrameOff select 3)
																					];
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_PERFORMQUICKACTION)		ctrlSetFade 1;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BACK_QUICKACTIONFRAME)		ctrlSetFade 1;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LABEL_QUICKACTIONS)			ctrlSetFade 1;
	displayCtrl_MedicalUi(IDC_MEDICALUI_TB_QUICKACTIONDESCRIPTION)	ctrlSetFade 1;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LB_QUICKACTIONLIST)			ctrlSetFade 1;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_PERFORMQUICKACTION)		ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEQUICKACTIONFRAME)	ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BACK_QUICKACTIONFRAME)		ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LABEL_QUICKACTIONS)			ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_TB_QUICKACTIONDESCRIPTION)	ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LB_QUICKACTIONLIST)			ctrlCommit _animationTime;
	uiSleep _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_PERFORMQUICKACTION)		ctrlShow false;
	displayCtrl_MedicalUi(IDC_MEDICALUI_TB_QUICKACTIONDESCRIPTION)	ctrlShow false;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LB_QUICKACTIONLIST)			ctrlShow false;
}
else
{
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEQUICKACTIONFRAME)	ctrlSetText "<";
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEQUICKACTIONFRAME)	ctrlSetPosition [
																					[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleQuickActionFrameOn select 0),
																					[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleQuickActionFrameOn select 1),
																					[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleQuickActionFrameOn select 2),
																					[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleQuickActionFrameOn select 3)
																				];
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_PERFORMQUICKACTION)		ctrlSetFade 0;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BACK_QUICKACTIONFRAME)		ctrlSetFade 0;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LABEL_QUICKACTIONS)			ctrlSetFade 0;
	displayCtrl_MedicalUi(IDC_MEDICALUI_TB_QUICKACTIONDESCRIPTION)	ctrlSetFade 0;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LB_QUICKACTIONLIST)			ctrlSetFade 0;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_PERFORMQUICKACTION)		ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEQUICKACTIONFRAME)	ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BACK_QUICKACTIONFRAME)		ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LABEL_QUICKACTIONS)			ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_TB_QUICKACTIONDESCRIPTION)	ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LB_QUICKACTIONLIST)			ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_PERFORMQUICKACTION)		ctrlShow true;
	displayCtrl_MedicalUi(IDC_MEDICALUI_TB_QUICKACTIONDESCRIPTION)	ctrlShow true;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LB_QUICKACTIONLIST)			ctrlShow true;
};
profileNamespace setVariable ["X39_MS2_options_MedicalUi_toggleFrame_state_ToggleQuickActionFrame", _this select 0];
saveProfileNamespace;