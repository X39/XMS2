#include "\X39_MS2_Scripting\default.hpp"
/**
 *	UI function
 *
 *	@Param1 - SCALAR - index
 *	@Param2 - STRING - function suffix
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
if(X39_MS2_var_Internal_DialogCommunication_MA_preventActions) exitWith {[] call X39_MS2_fnc_MedicalActionMenu_outputBlockedMessage;};
X39_MS2_var_Internal_DialogCommunication_MA_Target setVariable["X39_MS2_var_triageCard", []];
X39_MS2_var_Internal_DialogCommunication_MA_Target setVariable["X39_MS2_var_triageState", -1];
lbSetCurSel[2101, -1];