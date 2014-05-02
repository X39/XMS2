#include "\X39_MS2_Scripting\default.hpp"
/**
 *	UI function
 *
 *	@Param1 - SCALAR - index
 *	@Param2 - STRING - function suffix
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_index", "_triageCardEntries", "_triageCardEntry"];
if(X39_MS2_var_Internal_DialogCommunication_MA_preventActions) exitWith {[] call X39_MS2_fnc_MedicalActionMenu_outputBlockedMessage;};
_index = lbCurSel 2100;
_text = ctrlText 1400;
if(_index == -1 && _text == "") exitWith {[] call X39_MS2_fnc_MedicalActionMenu_outputNothingSelectedMessage;};
DEBUG_LOG_WFn(format["_text = %1; _index = %2" COMMA _text COMMA _index]);
_triageCardEntry = [];
if(_index == -1) then
{
	_triageCardEntry set [count _triageCardEntry, format[_text, name X39_MS2_var_Internal_DialogCommunication_MA_Target]];
	_triageCardEntry set [count _triageCardEntry, [1,1,1,1]];
}
else
{
	_triageCardEntry set [count _triageCardEntry, format[X39_MS2_var_Internal_Dialog_TriageCard_PreDefinedMessages select _index select 1, name X39_MS2_var_Internal_DialogCommunication_MA_Target]];
	_triageCardEntry set [count _triageCardEntry, X39_MS2_var_Internal_Dialog_TriageCard_PreDefinedMessages select _index select 2];
};
DEBUG_LOG_WFn(format["_triageCardEntry = %1" COMMA _triageCardEntry]);
_triageCardEntries = X39_MS2_var_Internal_DialogCommunication_MA_Target getVariable["X39_MS2_var_triageCard", []];
DEBUG_LOG_WFn(format["_triageCardEntries = %1 before merge" COMMA _triageCardEntries]);
_triageCardEntries set [count _triageCardEntries, _triageCardEntry];
DEBUG_LOG_WFn(format["_triageCardEntries = %1 after merge" COMMA _triageCardEntries]);
X39_MS2_var_Internal_DialogCommunication_MA_Target setVariable["X39_MS2_var_triageCard", _triageCardEntries];
