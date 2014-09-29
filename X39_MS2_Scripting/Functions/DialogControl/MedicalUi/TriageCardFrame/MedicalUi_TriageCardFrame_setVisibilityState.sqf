#include "\X39_MS2_Scripting\default.hpp"
#include "\X39_MS2_UIs\MedicalUi\ui.defs"
/**
 *	UI function
 *	
 *	@Param1 - BOOL - True to show the UI frame; False to hide the UI frame
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_flag", "_anmiationTime"];
_flag = [_this, 0, false, [false]] call BIS_fnc_param;
_animationTime = [_this, 1, MEDICALUI_ANIMATIONTIME, [0]] call BIS_fnc_param;
if(!_flag) then
{
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLETRIAGECARDFRAME)	ctrlSetText ">";
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLETRIAGECARDFRAME)					ctrlSetPosition [
																										[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleTriageCardFrameOff select 0),
																										[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleTriageCardFrameOff select 1),
																										[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleTriageCardFrameOff select 2),
																										[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleTriageCardFrameOff select 3)
																									];
	displayCtrl_MedicalUi(IDC_MEDICALUI_LABEL_TRIAGECARD)							ctrlSetFade 1;
	displayCtrl_MedicalUi(IDC_MEDICALUI_TB_CUSTOMTRIAGECARDENTRY)					ctrlSetFade 1;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LB_TRIAGECARDENTRIES)						ctrlSetFade 1;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_ADDPREDEFINEDMESSAGETOTRIAGECARD)		ctrlSetFade 1;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_ADDCUSTOMMESSAGETOTRIAGECARD)			ctrlSetFade 1;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_REMOVEENTRYFROMTRIAGECARD)				ctrlSetFade 1;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_PRUNETRIAGECARD)						ctrlSetFade 1;
	displayCtrl_MedicalUi(IDC_MEDICALUI_CB_PREDEFINEDTRIAGECARDMESSAGES)			ctrlSetFade 1;
	displayCtrl_MedicalUi(IDC_MEDICALUI_CB_CUSTOMTRIAGECARDMESSAGECOLORSELECTION)	ctrlSetFade 1;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BACK_TRIAGECARDFRAME)						ctrlSetFade 1;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BACK_CUSTOMTRIAGECARDENTRYBACKGROUND)		ctrlSetFade 1;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LABEL_TRIAGECARD)							ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLETRIAGECARDFRAME)					ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_TB_CUSTOMTRIAGECARDENTRY)					ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LB_TRIAGECARDENTRIES)						ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_ADDPREDEFINEDMESSAGETOTRIAGECARD)		ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_ADDCUSTOMMESSAGETOTRIAGECARD)			ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_REMOVEENTRYFROMTRIAGECARD)				ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_PRUNETRIAGECARD)						ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_CB_PREDEFINEDTRIAGECARDMESSAGES)			ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_CB_CUSTOMTRIAGECARDMESSAGECOLORSELECTION)	ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BACK_TRIAGECARDFRAME)						ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BACK_CUSTOMTRIAGECARDENTRYBACKGROUND)		ctrlCommit _animationTime;
	uiSleep _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_TB_CUSTOMTRIAGECARDENTRY)					ctrlShow false;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LB_TRIAGECARDENTRIES)						ctrlShow false;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_ADDPREDEFINEDMESSAGETOTRIAGECARD)		ctrlShow false;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_ADDCUSTOMMESSAGETOTRIAGECARD)			ctrlShow false;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_REMOVEENTRYFROMTRIAGECARD)				ctrlShow false;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_PRUNETRIAGECARD)						ctrlShow false;
	displayCtrl_MedicalUi(IDC_MEDICALUI_CB_PREDEFINEDTRIAGECARDMESSAGES)			ctrlShow false;
	displayCtrl_MedicalUi(IDC_MEDICALUI_CB_CUSTOMTRIAGECARDMESSAGECOLORSELECTION)	ctrlShow false;
}
else
{
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLETRIAGECARDFRAME)	ctrlSetText "<";
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLETRIAGECARDFRAME)	ctrlSetPosition [
																						[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleTriageCardFrameOn select 0),
																						[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleTriageCardFrameOn select 1),
																						[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleTriageCardFrameOn select 2),
																						[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleTriageCardFrameOn select 3)
																					];
	displayCtrl_MedicalUi(IDC_MEDICALUI_LABEL_TRIAGECARD)							ctrlSetFade 0;
	displayCtrl_MedicalUi(IDC_MEDICALUI_TB_CUSTOMTRIAGECARDENTRY)					ctrlSetFade 0;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LB_TRIAGECARDENTRIES)						ctrlSetFade 0;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_ADDPREDEFINEDMESSAGETOTRIAGECARD)		ctrlSetFade 0;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_ADDCUSTOMMESSAGETOTRIAGECARD)			ctrlSetFade 0;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_REMOVEENTRYFROMTRIAGECARD)				ctrlSetFade 0;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_PRUNETRIAGECARD)						ctrlSetFade 0;
	displayCtrl_MedicalUi(IDC_MEDICALUI_CB_PREDEFINEDTRIAGECARDMESSAGES)			ctrlSetFade 0;
	displayCtrl_MedicalUi(IDC_MEDICALUI_CB_CUSTOMTRIAGECARDMESSAGECOLORSELECTION)	ctrlSetFade 0;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BACK_TRIAGECARDFRAME)						ctrlSetFade 0;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BACK_CUSTOMTRIAGECARDENTRYBACKGROUND)		ctrlSetFade 0;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LABEL_TRIAGECARD)							ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLETRIAGECARDFRAME)					ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_TB_CUSTOMTRIAGECARDENTRY)					ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LB_TRIAGECARDENTRIES)						ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_ADDPREDEFINEDMESSAGETOTRIAGECARD)		ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_ADDCUSTOMMESSAGETOTRIAGECARD)			ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_REMOVEENTRYFROMTRIAGECARD)				ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_PRUNETRIAGECARD)						ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_CB_PREDEFINEDTRIAGECARDMESSAGES)			ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_CB_CUSTOMTRIAGECARDMESSAGECOLORSELECTION)	ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BACK_TRIAGECARDFRAME)						ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BACK_CUSTOMTRIAGECARDENTRYBACKGROUND)		ctrlCommit _animationTime;
	displayCtrl_MedicalUi(IDC_MEDICALUI_TB_CUSTOMTRIAGECARDENTRY)					ctrlShow true;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LB_TRIAGECARDENTRIES)						ctrlShow true;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_ADDPREDEFINEDMESSAGETOTRIAGECARD)		ctrlShow true;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_ADDCUSTOMMESSAGETOTRIAGECARD)			ctrlShow true;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_REMOVEENTRYFROMTRIAGECARD)				ctrlShow true;
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_PRUNETRIAGECARD)						ctrlShow true;
	displayCtrl_MedicalUi(IDC_MEDICALUI_CB_PREDEFINEDTRIAGECARDMESSAGES)			ctrlShow true;
	displayCtrl_MedicalUi(IDC_MEDICALUI_CB_CUSTOMTRIAGECARDMESSAGECOLORSELECTION)	ctrlShow true;
};
profileNamespace setVariable ["X39_MS2_options_MedicalUi_toggleFrame_state_ToggleTriageCardFrame", _this select 0];
saveProfileNamespace;