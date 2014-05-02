#include "\X39_MS2_Scripting\default.hpp"
/**
 *	UI function
 *
 *	@Param1 - SCALAR - index
 *	@Param2 - STRING - function suffix
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_index", "_triageCardEntries"];
if(X39_MS2_var_Internal_DialogCommunication_MA_preventActions) exitWith {[] call X39_MS2_fnc_MedicalActionMenu_outputBlockedMessage;};
_index = lbCurSel 1502;
if(_index == -1) exitWith {[] call X39_MS2_fnc_MedicalActionMenu_outputNothingSelectedMessage;};
_triageCardEntries = X39_MS2_var_Internal_DialogCommunication_MA_Target getVariable["X39_MS2_var_triageCard", []];
_triageCardEntries set [_index, -1];
X39_MS2_var_Internal_DialogCommunication_MA_Target setVariable["X39_MS2_var_triageCard", _triageCardEntries - [-1]];