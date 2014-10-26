#include "\X39_MS2_Scripting\default.hpp"
#include "\X39_MS2_UIs\MedicalUi\ui.defs"
#define ACTIONMENUBUTTONS [ IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON1, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON2, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON3, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON4, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON5, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON6, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON7, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON8, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON9, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON10 ]
#define HITZONEINFOPICTURES [ IDC_MEDICALUI_IMG_HITZONEINFOPIC6, IDC_MEDICALUI_IMG_HITZONEINFOPIC5, IDC_MEDICALUI_IMG_HITZONEINFOPIC7, IDC_MEDICALUI_IMG_HITZONEINFOPIC4, IDC_MEDICALUI_IMG_HITZONEINFOPIC8, IDC_MEDICALUI_IMG_HITZONEINFOPIC3, IDC_MEDICALUI_IMG_HITZONEINFOPIC9, IDC_MEDICALUI_IMG_HITZONEINFOPIC2, IDC_MEDICALUI_IMG_HITZONEINFOPIC10, IDC_MEDICALUI_IMG_HITZONEINFOPIC1, IDC_MEDICALUI_IMG_HITZONEINFOPIC11 ]
#define HITZONES	 [ IDC_MEDICALUI_IMG_HEAD,									IDC_MEDICALUI_IMG_LEFTLOWERARM,									IDC_MEDICALUI_IMG_LEFTLOWERLEG,									IDC_MEDICALUI_IMG_LEFTUPPERARM,									IDC_MEDICALUI_IMG_LEFTUPPERLEG,									IDC_MEDICALUI_IMG_LOWERBODY,									IDC_MEDICALUI_IMG_RIGHTLOWERARM,									IDC_MEDICALUI_IMG_RIGHTLOWERLEG,									IDC_MEDICALUI_IMG_RIGHTUPPERARM,									IDC_MEDICALUI_IMG_RIGHTUPPERLEG,									IDC_MEDICALUI_IMG_UPPERBODY,									IDC_MEDICALUI_IMG_LEFTFOOT,										IDC_MEDICALUI_IMG_RIGHTFOOT]
#define HITZONENAMES [ X39_MS2_var_Internal_HitZones select HITZONE_IndexHead,	X39_MS2_var_Internal_HitZones select HITZONE_IndexLeftLowerArm,	X39_MS2_var_Internal_HitZones select HITZONE_IndexLeftLowerLeg,	X39_MS2_var_Internal_HitZones select HITZONE_IndexLeftUpperArm,	X39_MS2_var_Internal_HitZones select HITZONE_IndexLeftUpperLeg,	X39_MS2_var_Internal_HitZones select HITZONE_IndexLowerBody,	X39_MS2_var_Internal_HitZones select HITZONE_IndexRightLowerArm,	X39_MS2_var_Internal_HitZones select HITZONE_IndexRightLowerLeg,	X39_MS2_var_Internal_HitZones select HITZONE_IndexRightUpperArm,	X39_MS2_var_Internal_HitZones select HITZONE_IndexRightUpperLeg,	X39_MS2_var_Internal_HitZones select HITZONE_IndexUpperBody,	X39_MS2_var_Internal_HitZones select HITZONE_IndexLeftFoot,		X39_MS2_var_Internal_HitZones select HITZONE_IndexRightFoot ]

/**
 *	UI function to create the MedicalActionMenu dialog
 *
 *	@Param1 - OBJECT - targeted unit
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
_this spawn {
	DEBUG_CODE_SC(_fnc_scriptName = "X39_MS2_fnc_MedicalUi_createDialog";);
	if(dialog) exitWith {PRINT_ERROR("Another UI is already displayed!");};
	private["_index", "_marker", "_color", "_name", "_i", "_bodyViewType", "_dmg", "_maxDmg", "_triageCardEntries", "_triageState", "_txt", "_arr", "_controlArray", "_largerArray", "_smallerArray", "_flag", "_lastDrugList"];
	_lastDrugList = [];
	X39_MS2_var_Internal_DialogCommunication_MA_Caller = player;
	X39_MS2_var_Internal_DialogCommunication_MA_Target = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	if(stance X39_MS2_var_Internal_DialogCommunication_MA_Caller != "PRONE" && {stance X39_MS2_var_Internal_DialogCommunication_MA_Caller != "CROUCH"}) then
	{
		X39_MS2_var_Internal_DialogCommunication_MA_Caller playActionNow "CROUCH";
	};
	if(!createDialog "X39_MS2_MedicalUi") exitWith {PRINT_ERROR("Something moved wrong while executing 'createDialog ""X39_MS2_MedicalUi""'");};
	if(isNull X39_MS2_var_Internal_DialogCommunication_MA_Target) then { X39_MS2_var_Internal_DialogCommunication_MA_Target = X39_MS2_var_Internal_DialogCommunication_MA_Caller; };
	displayCtrl_MedicalUi(IDC_MEDICALUI_LABEL_UNITNAME) ctrlSetText name X39_MS2_var_Internal_DialogCommunication_MA_Target;
	//Apply customization stuff
	[profileNamespace getVariable["X39_MS2_options_MedicalUi_toggleFrame_state_ToggleDrugsFrame", true], 0] call X39_MS2_fnc_MedicalUi_DrugsFrame_setVisibilityState;
	[profileNamespace getVariable["X39_MS2_options_MedicalUi_toggleFrame_state_ToggleDiagnosticFrame", true], 0] call X39_MS2_fnc_MedicalUi_DiagnosticFrame_setVisibilityState;
	[profileNamespace getVariable["X39_MS2_options_MedicalUi_toggleFrame_state_ToggleTriageCardFrame", true], 0] call X39_MS2_fnc_MedicalUi_TriageCardFrame_setVisibilityState;
	[profileNamespace getVariable["X39_MS2_options_MedicalUi_toggleFrame_state_ToggleQuickActionFrame", true], 0] call X39_MS2_fnc_MedicalUi_QuickActionFrame_setVisibilityState;
	[profileNamespace getVariable ["X39_MS2_var_MedicalUI_ViewType", 0]] call X39_MS2_fnc_MedicalUi_SetBodyViewType;
	
	//Enable fake buttons (reason for them: http://feedback.arma3.com/view.php?id=20546)
	{displayCtrl_MedicalUi(_x) ctrlEnable true; false} count ACTIONMENUBUTTONS;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LBTN_TRIAGECARDTOP) ctrlEnable true;
	displayCtrl_MedicalUi(IDC_MEDICALUI_LBTN_TRIAGECARDBOTTOM) ctrlEnable true;
	//Enable HitZones
	{displayCtrl_MedicalUi(_x) ctrlEnable true; false} count HITZONES;
	//Hide all InfoPictures
	{displayCtrl_MedicalUi(_x) ctrlShow false; false} count HITZONEINFOPICTURES;
	
	
	//All that fancy eyeCandy crap logic stuff (the crap is connected to the eyeCandy! Not the actual logic (which is kinda cool))
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEDRUGSFRAME)		ctrlSetEventHandler["MouseButtonDown", {_res = [] spawn {
																												_currentPos = ctrlPosition displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEDRUGSFRAME);
																												_pos1 = [
																															[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleDrugsFrameOn select 0),
																															[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleDrugsFrameOn select 1),
																															[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleDrugsFrameOn select 2),
																															[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleDrugsFrameOn select 3)
																														];
																												if(str _currentPos == str _pos1) then
																												{
																													[false] call X39_MS2_fnc_MedicalUi_DrugsFrame_setVisibilityState;
																												}
																												else
																												{
																													[true] call X39_MS2_fnc_MedicalUi_DrugsFrame_setVisibilityState;
																												};
																											};} call X39_XLib_fnc_ConvertCodeToString];
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEDIAGNOSTICFRAME)	ctrlSetEventHandler["MouseButtonDown", {_res = [] spawn {
																												_currentPos = ctrlPosition displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEDIAGNOSTICFRAME);
																												_pos1 = [
																															[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleDiagnosticFrameOn select 0),
																															[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleDiagnosticFrameOn select 1),
																															[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleDiagnosticFrameOn select 2),
																															[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleDiagnosticFrameOn select 3)
																														];
																												if(str _currentPos == str _pos1) then
																												{
																													[false] call X39_MS2_fnc_MedicalUi_DiagnosticFrame_setVisibilityState;
																												}
																												else
																												{
																													[true] call X39_MS2_fnc_MedicalUi_DiagnosticFrame_setVisibilityState;
																												};
																											};} call X39_XLib_fnc_ConvertCodeToString];
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLETRIAGECARDFRAME)	ctrlSetEventHandler["MouseButtonDown", {_res = [] spawn {
																												_currentPos = ctrlPosition displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLETRIAGECARDFRAME);
																												_pos1 = [
																															[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleTriageCardFrameOn select 0),
																															[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleTriageCardFrameOn select 1),
																															[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleTriageCardFrameOn select 2),
																															[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleTriageCardFrameOn select 3)
																														];
																												if(str _currentPos == str _pos1) then
																												{
																													[false] call X39_MS2_fnc_MedicalUi_TriageCardFrame_setVisibilityState;
																												}
																												else
																												{
																													[true] call X39_MS2_fnc_MedicalUi_TriageCardFrame_setVisibilityState;
																												};
																											};} call X39_XLib_fnc_ConvertCodeToString];
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEQUICKACTIONFRAME) ctrlSetEventHandler["MouseButtonDown", {_res = [] spawn {
																												_currentPos = ctrlPosition displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEQUICKACTIONFRAME);
																												_pos1 = [
																															[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleQuickActionFrameOn select 0),
																															[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleQuickActionFrameOn select 1),
																															[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleQuickActionFrameOn select 2),
																															[] call compile (X39_MS2_options_MedicalUi_toggleFrame_position_ToggleQuickActionFrameOn select 3)
																														];
																												if(str _currentPos == str _pos1) then
																												{
																													[false] call X39_MS2_fnc_MedicalUi_QuickActionFrame_setVisibilityState;
																												}
																												else
																												{
																													[true] call X39_MS2_fnc_MedicalUi_QuickActionFrame_setVisibilityState;
																												};
																											};} call X39_XLib_fnc_ConvertCodeToString];
	displayCtrl_MedicalUi(IDC_MEDICALUI_LBTN_TRIAGECARDTOP)			ctrlSetEventHandler["MouseButtonDown", {if(X39_MS2_var_Internal_DialogCommunication_MA_preventActions) exitWith {[] call X39_MS2_fnc_MedicalUi_outputBlockedMessage;};
																										_res = [] spawn {
																										_arr = ACTIONMENUBUTTONS;
																										_currentUiElementPos = ctrlPosition displayCtrl_MedicalUi(IDC_MEDICALUI_LBTN_TRIAGECARDTOP);
																										if(count X39_MS2_var_Internal_Dialog_TriageCard_States > {displayCtrl_MedicalUi(_x) ctrlShow false;true}count _arr) exitWith { ["TriageCardStates outOfRange (>10)"] call BIS_fnc_HALT; };
																										
																										{
																											displayCtrl_MedicalUi(_arr select _forEachIndex) ctrlSetPosition [_currentUiElementPos select 0, (_currentUiElementPos select 1) + (((_currentUiElementPos select 3) + 0.002) * (_forEachIndex + 1)), _currentUiElementPos select 2, _currentUiElementPos select 3]; 
																											displayCtrl_MedicalUi(_arr select _forEachIndex) ctrlSetFade 1;
																											displayCtrl_MedicalUi(_arr select _forEachIndex) ctrlCommit 0;
																											displayCtrl_MedicalUi(_arr select _forEachIndex) ctrlShow true;
																											displayCtrl_MedicalUi(_arr select _forEachIndex) ctrlSetFade 0;
																											displayCtrl_MedicalUi(_arr select _forEachIndex) ctrlCommit (MEDICALUI_ANIMATIONTIME / (count X39_MS2_var_Internal_Dialog_TriageCard_States));
																											displayCtrl_MedicalUi(_arr select _forEachIndex) ctrlSetEventHandler["MouseButtonDown", format["_res = [] spawn {[X39_MS2_var_Internal_DialogCommunication_MA_Target, %1] call X39_MS2_fnc_setTriageState; {((uiNamespace getVariable 'X39_MS2_var_UIs_MedicalUi') displayCtrl (_x)) ctrlSetFade 1; ((uiNamespace getVariable 'X39_MS2_var_UIs_MedicalUi') displayCtrl (_x)) ctrlCommit (%3 / (count X39_MS2_var_Internal_Dialog_TriageCard_States)); uiSleep (%3 / (count X39_MS2_var_Internal_Dialog_TriageCard_States)); ((uiNamespace getVariable 'X39_MS2_var_UIs_MedicalUi') displayCtrl (_x)) ctrlShow false;true}count %2;};", _forEachIndex, _arr, MEDICALUI_ANIMATIONTIME]];
																											displayCtrl_MedicalUi(_arr select _forEachIndex) ctrlSetForegroundColor [(_x select 2) select 0, (_x select 2) select 1, (_x select 2) select 2, (_x select 2) select 3];
																											displayCtrl_MedicalUi(_arr select _forEachIndex) ctrlSetBackgroundColor [(_x select 2) select 0, (_x select 2) select 1, (_x select 2) select 2, (_x select 2) select 3 ];
																											displayCtrl_MedicalUi(_arr select _forEachIndex) ctrlSetActiveColor [(_x select 2) select 0, (_x select 2) select 1, (_x select 2) select 2, (_x select 2) select 3];
																											displayCtrl_MedicalUi(_arr select _forEachIndex) ctrlSetTextColor [(_x select 4) select 0, (_x select 4) select 1, (_x select 4) select 2, (_x select 4) select 3];
																											displayCtrl_MedicalUi(_arr select _forEachIndex) ctrlSetText format["%1 (%2)", (_x select 0), (_x select 1)];
																											uiSleep (MEDICALUI_ANIMATIONTIME / (count X39_MS2_var_Internal_Dialog_TriageCard_States));
																										} forEach X39_MS2_var_Internal_Dialog_TriageCard_States;
																									};} call X39_XLib_fnc_ConvertCodeToString];
	displayCtrl_MedicalUi(IDC_MEDICALUI_LBTN_TRIAGECARDBOTTOM)		ctrlSetEventHandler["MouseButtonDown", {if(X39_MS2_var_Internal_DialogCommunication_MA_preventActions) exitWith {[] call X39_MS2_fnc_MedicalUi_outputBlockedMessage;};
																										_res = [] spawn {
																										_arr = ACTIONMENUBUTTONS;
																										_currentUiElementPos = ctrlPosition displayCtrl_MedicalUi(IDC_MEDICALUI_LBTN_TRIAGECARDBOTTOM);
																										if(count X39_MS2_var_Internal_Dialog_TriageCard_States > {displayCtrl_MedicalUi(_x) ctrlShow false;true}count _arr) exitWith { ["TriageCardStates outOfRange (>10)"] call BIS_fnc_HALT; };
																										{
																											displayCtrl_MedicalUi(_arr select _forEachIndex) ctrlSetPosition [_currentUiElementPos select 0, (_currentUiElementPos select 1) - (((_currentUiElementPos select 3) + 0.002) * (_forEachIndex + 1)), _currentUiElementPos select 2, _currentUiElementPos select 3];
																											displayCtrl_MedicalUi(_arr select _forEachIndex) ctrlSetFade 1;
																											displayCtrl_MedicalUi(_arr select _forEachIndex) ctrlCommit 0;
																											displayCtrl_MedicalUi(_arr select _forEachIndex) ctrlShow true;
																											displayCtrl_MedicalUi(_arr select _forEachIndex) ctrlSetFade 0;
																											displayCtrl_MedicalUi(_arr select _forEachIndex) ctrlCommit (MEDICALUI_ANIMATIONTIME / (count X39_MS2_var_Internal_Dialog_TriageCard_States));
																											displayCtrl_MedicalUi(_arr select _forEachIndex) ctrlSetEventHandler["MouseButtonDown", format["_res = [] spawn {[X39_MS2_var_Internal_DialogCommunication_MA_Target, %1] call X39_MS2_fnc_setTriageState; {((uiNamespace getVariable 'X39_MS2_var_UIs_MedicalUi') displayCtrl (_x)) ctrlSetFade 1; ((uiNamespace getVariable 'X39_MS2_var_UIs_MedicalUi') displayCtrl (_x)) ctrlCommit (%3 / (count X39_MS2_var_Internal_Dialog_TriageCard_States)); uiSleep (%3 / (count X39_MS2_var_Internal_Dialog_TriageCard_States)); ((uiNamespace getVariable 'X39_MS2_var_UIs_MedicalUi') displayCtrl (_x)) ctrlShow false;true}count %2;};", _forEachIndex, _arr, MEDICALUI_ANIMATIONTIME]];
																											displayCtrl_MedicalUi(_arr select _forEachIndex) ctrlSetForegroundColor [(_x select 2) select 0, (_x select 2) select 1, (_x select 2) select 2, (_x select 2) select 3];
																											displayCtrl_MedicalUi(_arr select _forEachIndex) ctrlSetBackgroundColor [(_x select 2) select 0, (_x select 2) select 1, (_x select 2) select 2, (_x select 2) select 3 ];
																											displayCtrl_MedicalUi(_arr select _forEachIndex) ctrlSetActiveColor [(_x select 2) select 0, (_x select 2) select 1, (_x select 2) select 2, (_x select 2) select 3];
																											displayCtrl_MedicalUi(_arr select _forEachIndex) ctrlSetTextColor [(_x select 4) select 0, (_x select 4) select 1, (_x select 4) select 2, (_x select 4) select 3];
																											displayCtrl_MedicalUi(_arr select _forEachIndex) ctrlSetText format["%1 (%2)", (_x select 0), (_x select 1)];
																											uiSleep (MEDICALUI_ANIMATIONTIME / (count X39_MS2_var_Internal_Dialog_TriageCard_States));
																										} forEach X39_MS2_var_Internal_Dialog_TriageCard_States;
																									};} call X39_XLib_fnc_ConvertCodeToString];
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEHEALTHVIEW)					ctrlSetEventHandler["MouseButtonDown", {[0] call X39_MS2_fnc_MedicalUi_SetBodyViewType;} call X39_XLib_fnc_ConvertCodeToString];
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEBLOODVIEW)					ctrlSetEventHandler["MouseButtonDown", {[1] call X39_MS2_fnc_MedicalUi_SetBodyViewType;} call X39_XLib_fnc_ConvertCodeToString];
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_CHECKUNIT)							ctrlSetEventHandler["MouseButtonDown", {
																															if(X39_MS2_var_Internal_DialogCommunication_MA_preventActions) exitWith {[] call X39_MS2_fnc_MedicalUi_outputBlockedMessage;};
																															[lbCurSel IDC_MEDICALUI_CB_CHECKUNITTYPE] call X39_MS2_fnc_MedicalUi_btnDiagnosisPerformCheckUnit;
																														} call X39_XLib_fnc_ConvertCodeToString];
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_ADDSELECTEDDIAGNOSTICSTOTRIAGECARD)	ctrlSetEventHandler["MouseButtonDown", {
																															if(X39_MS2_var_Internal_DialogCommunication_MA_preventActions) exitWith {[] call X39_MS2_fnc_MedicalUi_outputBlockedMessage;};
																															if(lbCurSel IDC_MEDICALUI_LB_DIAGNOSTICSLIST == -1) exitWith {[] call X39_MS2_fnc_MedicalUi_outputNothingSelectedMessage};
																															[lbText[IDC_MEDICALUI_LB_DIAGNOSTICSLIST, lbCurSel IDC_MEDICALUI_LB_DIAGNOSTICSLIST], lbColor[IDC_MEDICALUI_LB_DIAGNOSTICSLIST, lbCurSel IDC_MEDICALUI_LB_DIAGNOSTICSLIST]] call X39_MS2_fnc_MedicalUi_addGivenMessageToTriageCard;
																														} call X39_XLib_fnc_ConvertCodeToString];
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_ADDPREDEFINEDMESSAGETOTRIAGECARD)	ctrlSetEventHandler["MouseButtonDown", {
																															if(X39_MS2_var_Internal_DialogCommunication_MA_preventActions) exitWith {[] call X39_MS2_fnc_MedicalUi_outputBlockedMessage;};
																															if(lbCurSel IDC_MEDICALUI_CB_PREDEFINEDTRIAGECARDMESSAGES == -1) exitWith {[] call X39_MS2_fnc_MedicalUi_outputNothingSelectedMessage};
																															[lbText [IDC_MEDICALUI_CB_PREDEFINEDTRIAGECARDMESSAGES, lbCurSel IDC_MEDICALUI_CB_PREDEFINEDTRIAGECARDMESSAGES], lbColor [IDC_MEDICALUI_CB_PREDEFINEDTRIAGECARDMESSAGES, lbCurSel IDC_MEDICALUI_CB_PREDEFINEDTRIAGECARDMESSAGES]] call X39_MS2_fnc_MedicalUi_addGivenMessageToTriageCard;
																														} call X39_XLib_fnc_ConvertCodeToString];
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_ADDCUSTOMMESSAGETOTRIAGECARD)		ctrlSetEventHandler["MouseButtonDown", {
																															if(X39_MS2_var_Internal_DialogCommunication_MA_preventActions) exitWith {[] call X39_MS2_fnc_MedicalUi_outputBlockedMessage;};
																															if(ctrlText IDC_MEDICALUI_TB_CUSTOMTRIAGECARDENTRY == "") exitWith {};
																															[ctrlText IDC_MEDICALUI_TB_CUSTOMTRIAGECARDENTRY, lbColor [IDC_MEDICALUI_CB_CUSTOMTRIAGECARDMESSAGECOLORSELECTION, lbCurSel IDC_MEDICALUI_CB_CUSTOMTRIAGECARDMESSAGECOLORSELECTION]] call X39_MS2_fnc_MedicalUi_addGivenMessageToTriageCard;
																														} call X39_XLib_fnc_ConvertCodeToString];
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_REMOVEENTRYFROMTRIAGECARD)			ctrlSetEventHandler["MouseButtonDown", {
																															if(X39_MS2_var_Internal_DialogCommunication_MA_preventActions) exitWith {[] call X39_MS2_fnc_MedicalUi_outputBlockedMessage;};
																															_index = lbCurSel IDC_MEDICALUI_LB_TRIAGECARDENTRIES;
																															if(lbCurSel IDC_MEDICALUI_LB_TRIAGECARDENTRIES == -1) exitWith {[] call X39_MS2_fnc_MedicalUi_outputNothingSelectedMessage;};
																															_triageCardEntries = [X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getTriageCard;
																															_triageCardEntries set [_index, -1];
																															_triageCardEntries = _triageCardEntries - [-1];
																															[X39_MS2_var_Internal_DialogCommunication_MA_Target, _triageCardEntries] call X39_MS2_fnc_setTriageCard;
																														} call X39_XLib_fnc_ConvertCodeToString];
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_PRUNETRIAGECARD)					ctrlSetEventHandler["MouseButtonDown", {
																															if(X39_MS2_var_Internal_DialogCommunication_MA_preventActions) exitWith {[] call X39_MS2_fnc_MedicalUi_outputBlockedMessage;};
																															[X39_MS2_var_Internal_DialogCommunication_MA_Target, nil] call X39_MS2_fnc_setTriageCard;
																															[X39_MS2_var_Internal_DialogCommunication_MA_Target, nil] call X39_MS2_fnc_setTriageState;
																															lbSetCurSel[IDC_MEDICALUI_LB_TRIAGECARDENTRIES, -1];
																														} call X39_XLib_fnc_ConvertCodeToString];
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_APPLYSELECTEDDRUG)					ctrlSetEventHandler["MouseButtonDown", {
																															if(X39_MS2_var_Internal_DialogCommunication_MA_preventActions) exitWith {[] call X39_MS2_fnc_MedicalUi_outputBlockedMessage;};
																															_this call X39_MS2_fnc_MedicalUi_DrugsFrame_applyDrug;
																														} call X39_XLib_fnc_ConvertCodeToString];
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_PERFORMQUICKACTION)					ctrlSetEventHandler["MouseButtonDown", {
																															if(X39_MS2_var_Internal_DialogCommunication_MA_preventActions) exitWith {[] call X39_MS2_fnc_MedicalUi_outputBlockedMessage;};
																															//ToDo: Add performQuickAction code
																														} call X39_XLib_fnc_ConvertCodeToString];
	//Create rightClick menu & StatusEffect event handles 
	{
		displayCtrl_MedicalUi(_x) ctrlSetEventHandler["MouseButtonDown",	format["_res = _this spawn {if((_this select 1) != 1) exitWith {};if(X39_MS2_var_Internal_DialogCommunication_MA_preventActions) exitWith {[] call X39_MS2_fnc_MedicalUi_outputBlockedMessage;};[%1, [_this select 2, _this select 3]] call X39_MS2_fnc_MedicalUi_HitZones_CreateMenu;};", str (HITZONENAMES select _forEachIndex select HITZONE_NAME)]];
		displayCtrl_MedicalUi(_x) ctrlSetEventHandler["MouseEnter",		format["[%1, _this, true] call X39_MS2_fnc_MedicalUi_HitZones_UpdateStatusEffects", str (HITZONENAMES select _forEachIndex select HITZONE_NAME)]];
		displayCtrl_MedicalUi(_x) ctrlSetEventHandler["MouseExit",			format["[%1, _this, false] call X39_MS2_fnc_MedicalUi_HitZones_UpdateStatusEffects", str (HITZONENAMES select _forEachIndex select HITZONE_NAME)]];
	}forEach HITZONES;
	
	//Add preDefinedTriageCardMessages to UI
	{
		_index = lbAdd[IDC_MEDICALUI_CB_PREDEFINEDTRIAGECARDMESSAGES, _x select 0];
		lbSetPicture[IDC_MEDICALUI_CB_PREDEFINEDTRIAGECARDMESSAGES, _index, format["#(argb,8,8,3)color(%1,%2,%3,%4)", (_x select 2) select 0, (_x select 2) select 1, (_x select 2) select 2, (_x select 2) select 3]];
		false
	} count X39_MS2_var_Internal_Dialog_TriageCard_PreDefinedMessages;
	if(count X39_MS2_var_Internal_Dialog_TriageCard_PreDefinedMessages > 0) then
	{
		lbSetCurSel[IDC_MEDICALUI_CB_PREDEFINEDTRIAGECARDMESSAGES, 0];
	};
	
	//Add colors to customTriageCardMessage colorSelection comboBox
	for "_i" from 0 to ((count (configfile >> "CfgMarkerColors")) - 1) do
	{
		_marker		= (configfile >> "CfgMarkerColors") select _i;
		_color		= getArray (_marker >> "color");
		_name		= getText (_marker >> "name");
		if(count _color > 0) then
		{
			if(typeName (_color select 0) == "STRING" || typeName (_color select 0) == "TEXT") then
			{
				{
					_color set[_forEachIndex, call (compile _x)];
				}forEach _color;
			};
			_index = lbAdd[IDC_MEDICALUI_CB_CUSTOMTRIAGECARDMESSAGECOLORSELECTION, _name];
			lbSetValue[IDC_MEDICALUI_CB_CUSTOMTRIAGECARDMESSAGECOLORSELECTION, _index, _i];
			lbSetColor [IDC_MEDICALUI_CB_CUSTOMTRIAGECARDMESSAGECOLORSELECTION, _index, _color];
			lbSetPicture[IDC_MEDICALUI_CB_CUSTOMTRIAGECARDMESSAGECOLORSELECTION, _index, format["#(argb,8,8,3)color(%1,%2,%3,%4)", _color select 0, _color select 1, _color select 2, _color select 3]];
		};
	};
	
	//Add checkUnitTypes
	_index = lbAdd[IDC_MEDICALUI_CB_CHECKUNITTYPE, localize "STR_X39_MS2_Scripting_DialogControl_MedicalActionMenu_CheckUnit_quick"];
	_index = lbAdd[IDC_MEDICALUI_CB_CHECKUNITTYPE, localize "STR_X39_MS2_Scripting_DialogControl_MedicalActionMenu_CheckUnit_normal"];
	_index = lbAdd[IDC_MEDICALUI_CB_CHECKUNITTYPE, localize "STR_X39_MS2_Scripting_DialogControl_MedicalActionMenu_CheckUnit_full"];
	lbSetCurSel[IDC_MEDICALUI_CB_CHECKUNITTYPE, profileNamespace getVariable["X39_MS2_var_MedicalUI_selectedCheckUnitIndex", 0]];
	displayCtrl_MedicalUi(IDC_MEDICALUI_CB_CHECKUNITTYPE) ctrlSetEventHandler ["LBSelChanged", "profileNamespace setVariable['X39_MS2_var_MedicalUI_selectedCheckUnitIndex', _this select 1]"];

	while {!([X39_MS2_var_Internal_DialogCommunication_MA_Caller] call X39_MS2_fnc_isBlackedOut) && dialog && ((X39_MS2_var_Internal_DialogCommunication_MA_Target distance X39_MS2_var_Internal_DialogCommunication_MA_Caller) < 4)} do
	{
		//Update BodyViewPort
		_bodyViewType = profileNamespace getVariable ["X39_MS2_var_MedicalUI_ViewType", 0];
		{
			_dmg = 0;
			_maxDmg = 1;
			if(_bodyViewType == 0) then
			{
				_dmg = [X39_MS2_var_Internal_DialogCommunication_MA_Target] call (missionNamespace getVariable format["X39_MS2_fnc_getDamageOf%1", _x select HITZONE_NAME]);
				_maxDmg = (missionNamespace getVariable format["X39_MS2_var_Damage_maxDamage%1", _x select HITZONE_NAME]);
			};
			if(_bodyViewType == 1) then
			{
				_dmg = [X39_MS2_var_Internal_DialogCommunication_MA_Target] call (missionNamespace getVariable format["X39_MS2_fnc_getBleedingOf%1",_x select HITZONE_NAME]);
				_maxDmg = (missionNamespace getVariable format["X39_MS2_var_Bleeding_maxBleeding%1", _x select HITZONE_NAME]);
			};
			displayCtrl_MedicalUi(_x select HITZONE_MedicalUiIdc) ctrlSetTextColor ([_dmg, _maxDmg] call X39_MS2_fnc_getColorArrayFromDamageValue);
		} count X39_MS2_var_Internal_HitZones;
		//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		//update Triage Card
		_triageCardEntries = [X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getTriageCard;
		_triageState = [X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getTriageState;
		if(_triageState == -1) then
		{
			if(count X39_MS2_var_Internal_Dialog_TriageCard_States > 0) then
			{
				[X39_MS2_var_Internal_DialogCommunication_MA_Target, 0] call X39_MS2_fnc_setTriageState
			}
			else
			{
				displayCtrl_MedicalUi(IDC_MEDICALUI_LBTN_TRIAGECARDBOTTOM) ctrlShow false;
				displayCtrl_MedicalUi(IDC_MEDICALUI_LBTN_TRIAGECARDTOP) ctrlShow false;
			};
		}
		else
		{
			if(count _triageCardEntries != lbSize IDC_MEDICALUI_LB_TRIAGECARDENTRIES) then
			{
				lbClear displayCtrl_MedicalUi(IDC_MEDICALUI_LB_TRIAGECARDENTRIES);
				{
					if(!isNil "_x") then
					{
						displayCtrl_MedicalUi(IDC_MEDICALUI_LB_TRIAGECARDENTRIES) lbSetColor[displayCtrl_MedicalUi(IDC_MEDICALUI_LB_TRIAGECARDENTRIES) lbAdd (_x select 0), _x select 1];
					};
					false
				} count _triageCardEntries;
			};
			_stateArray = X39_MS2_var_Internal_Dialog_TriageCard_States select _triageState;
			displayCtrl_MedicalUi(IDC_MEDICALUI_LBTN_TRIAGECARDBOTTOM) ctrlSetTextColor ((X39_MS2_var_Internal_Dialog_TriageCard_States select _triageState) select 4);
			displayCtrl_MedicalUi(IDC_MEDICALUI_LBTN_TRIAGECARDTOP) ctrlSetTextColor ((X39_MS2_var_Internal_Dialog_TriageCard_States select _triageState) select 4);
			displayCtrl_MedicalUi(IDC_MEDICALUI_LBTN_TRIAGECARDBOTTOM) ctrlSetBackgroundColor ((X39_MS2_var_Internal_Dialog_TriageCard_States select _triageState) select 2);
			displayCtrl_MedicalUi(IDC_MEDICALUI_LBTN_TRIAGECARDTOP) ctrlSetBackgroundColor ((X39_MS2_var_Internal_Dialog_TriageCard_States select _triageState) select 2);
			_txt = "";
			if(_stateArray select 3 >= 0) then
			{
				_txt = str (_stateArray select 3);
			};
			_txt = format[(if(_txt == "") then {"%1"} else {"%1 - %2"}), (X39_MS2_var_Internal_Dialog_TriageCard_States select _triageState) select 0, _txt];
			displayCtrl_MedicalUi(IDC_MEDICALUI_LBTN_TRIAGECARDBOTTOM) ctrlSetText _txt;
			displayCtrl_MedicalUi(IDC_MEDICALUI_LBTN_TRIAGECARDTOP) ctrlSetText _txt;
			displayCtrl_MedicalUi(IDC_MEDICALUI_LBTN_TRIAGECARDBOTTOM) ctrlSetToolTip ((X39_MS2_var_Internal_Dialog_TriageCard_States select _triageState) select 1);
			displayCtrl_MedicalUi(IDC_MEDICALUI_LBTN_TRIAGECARDTOP) ctrlSetToolTip ((X39_MS2_var_Internal_Dialog_TriageCard_States select _triageState) select 1);
		};
		
		//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		//update drugs list
		_arr = [];
		{
			if(([X39_MS2_var_Internal_DialogCommunication_MA_Caller, _x select 7] call X39_MS2_fnc_ls_isAllowedToUse) select 0) then
			{
				if([X39_MS2_var_Internal_DialogCommunication_MA_Caller, X39_MS2_var_Internal_DialogCommunication_MA_Target] call (_x select 3)) then
				{
					_arr pushBack _forEachIndex;
					//_index = displayCtrl_MedicalUi(IDC_MEDICALUI_LB_DRUGSLIST) lbAdd (localize (_x select 1));
					//displayCtrl_MedicalUi(IDC_MEDICALUI_LB_DRUGSLIST) lbSetValue [_index, _forEachIndex];
				};
			};
		}forEach X39_MS2_var_Internal_MedicalUi_RegisteredDrugs;
		if(str _arr != str _lastDrugList) then
		{
			lbClear displayCtrl_MedicalUi(IDC_MEDICALUI_LB_DRUGSLIST);
			{
				_index = displayCtrl_MedicalUi(IDC_MEDICALUI_LB_DRUGSLIST) lbAdd (localize ((X39_MS2_var_Internal_MedicalUi_RegisteredDrugs select _x) select 1));
				displayCtrl_MedicalUi(IDC_MEDICALUI_LB_DRUGSLIST) lbSetValue [_index, _x];
				false
			}count _arr;
			_lastDrugList = _arr;
		};
		
		//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		//update quick action list
		//TODO: Get an actual idea about how to implement those quick actions ...
	};
	if(dialog) then
	{
		closeDialog IDC_MEDICALUI_UIIDD;
	};
};