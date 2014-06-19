#include "\X39_MS2_Scripting\default.hpp"
#include "\X39_MS2_UIs\MedicalUi\ui.defs"
/**
 *	UI function
 *	
 *	@Param1 - STRING - Message to add
 *	@Param2 - COLOR - color to use
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_msg", "_color", "_triageCardEntries"];
_msg = _this select 0;
_color = _this select 1;
if(_msg == "") exitWith {PRINT_WARNING("Something tried to add a zero char message to a triage card! Prevented.");};
_triageCardEntries = X39_MS2_var_Internal_DialogCommunication_MA_Target getVariable["X39_MS2_var_triageCard", []];
_triageCardEntries set [count _triageCardEntries, [_msg, _color]];
[X39_MS2_var_Internal_DialogCommunication_MA_Target, _triageCardEntries] call X39_MS2_fnc_setTriageCard;
