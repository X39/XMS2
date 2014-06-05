#include "\X39_MS2_Scripting\default.hpp"
#include "\X39_MS2_UIs\MedicalUi\ui.defs"
/**
 *	UI function
 *
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
_this spawn {
	private["_index", "_triageCardEntries"];
	if(X39_MS2_var_Internal_DialogCommunication_MA_preventActions) exitWith {[] call X39_MS2_fnc_MedicalActionMenu_outputBlockedMessage;};
	_index = lbCurSel IDC_XMS2UI_LB_DIAGNOSIS_ENTRIES;
	if(_index == -1) exitWith {[] call X39_MS2_fnc_MedicalActionMenu_outputNothingSelectedMessage;};
	_triageCardEntries = X39_MS2_var_Internal_DialogCommunication_MA_Target getVariable["X39_MS2_var_triageCard", []];
	_triageCardEntries set [count _triageCardEntries, [lbText[IDC_XMS2UI_LB_DIAGNOSIS_ENTRIES, _index], lbColor[IDC_XMS2UI_LB_DIAGNOSIS_ENTRIES, _index]]];
	[X39_MS2_var_Internal_DialogCommunication_MA_Target, _triageCardEntries] call X39_MS2_fnc_setTriageCard;
};