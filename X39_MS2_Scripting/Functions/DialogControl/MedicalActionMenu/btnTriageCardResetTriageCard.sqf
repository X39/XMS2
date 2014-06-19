#include "\X39_MS2_Scripting\default.hpp"
#include "\X39_MS2_UIs\MedicalUi\ui.defs"
/**
 *	UI function
 *
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
if(X39_MS2_var_Internal_DialogCommunication_MA_preventActions) exitWith {[] call X39_MS2_fnc_MedicalActionMenu_outputBlockedMessage;};
X39_MS2_var_Internal_DialogCommunication_MA_Target setVariable["X39_MS2_var_triageCard", []];
X39_MS2_var_Internal_DialogCommunication_MA_Target setVariable["X39_MS2_var_triageState", -1];
[X39_MS2_var_Internal_DialogCommunication_MA_Target, []] call X39_MS2_fnc_setTriageCard;
[X39_MS2_var_Internal_DialogCommunication_MA_Target, -1] call X39_MS2_fnc_setTriageState;
lbSetCurSel[IDC_XMS2UI_C_TRIAGECARD_TRIAGESTATESELECTION, -1];