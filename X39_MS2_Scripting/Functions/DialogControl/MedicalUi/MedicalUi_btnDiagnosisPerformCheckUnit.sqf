#include "\X39_MS2_Scripting\default.hpp"
#include "\X39_MS2_UIs\MedicalUi\ui.defs"
/**
 *	UI function
 *
 *	@Param1 - SCALAR - CheckUnitType
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
if(X39_MS2_var_Internal_DialogCommunication_MA_preventActions) exitWith {[] call X39_MS2_fnc_MedicalActionMenu_outputBlockedMessage;};
X39_MS2_var_Internal_DialogCommunication_MA_preventActions = true;
_this spawn {
	DEBUG_CODE(_fnc_scriptName = "X39_MS2_fnc_MedicalActionMenu_btnDiagnosisPerformCheckUnit";)
	private["_checkUnitType", "_timeout", "_index"];
	_checkUnitType = [_this, 0, 0, [0]] call BIS_fnc_param;
	_timeout = X39_MS2_var_DialogControl_MedicalActionMenu_checkUnitTimeout select _checkUnitType;
	if(_timeout > 0) then
	{
		if(vehicle player == player) then
		{
			DEBUG_LOG_WFn_SC(format["Starting animation"])
			player playAction "MedicStart";
		};
		//systemChat format["sleeping %1s", _timeout];
		DEBUG_LOG_WFn_SC(format["Will sleep for %1 seconds" COMMA _timeout])
		[_timeout] call X39_MS2_fnc_setProgressBarTimeout;
		sleep _timeout;
	};
	if([player] call X39_MS2_fnc_isBlackedOut) exitWith {
		DEBUG_LOG_WFn_SC(format["As %1 is BlackedOut the checkUnit is canceled" COMMA name player])
		X39_MS2_var_Internal_DialogCommunication_MA_preventActions = false;
	};
	if(_timeout > 0) then
	{
		if(vehicle player == player) then
		{
			DEBUG_LOG_WFn_SC(format["Stopping animation"])
			player playAction "MedicStop";
		};
	};
	if(!dialog) exitWith {X39_MS2_var_Internal_DialogCommunication_MA_preventActions = false;};
	DEBUG_LOG_WFn_SC(format["Clearing current entries"])
	lbClear IDC_MEDICALUI_LB_DIAGNOSTICSLIST;
	{
		DEBUG_LOG_WFn_SC(format["Checking %1" COMMA _x])
		if(_checkUnitType >= _x select 3) then
		{
			if(X39_MS2_var_Internal_DialogCommunication_MA_Target call (_x select 2)) then
			{
				DEBUG_LOG_WFn_SC(format["%1 is valid, Adding ..." COMMA _x])
				_index = lbAdd[IDC_MEDICALUI_LB_DIAGNOSTICSLIST, format[(if(ISCODE(_x select 0)) then {X39_MS2_var_Internal_DialogCommunication_MA_Target call (_x select 0)} else {localize (_x select 0)}), name X39_MS2_var_Internal_DialogCommunication_MA_Target, name X39_MS2_var_Internal_DialogCommunication_MA_Caller]];
				lbSetColor[IDC_MEDICALUI_LB_DIAGNOSTICSLIST, _index, _x select 1];
			};
		};
		false
	}count X39_MS2_var_Internal_MedicalMessages;
	X39_MS2_var_Internal_DialogCommunication_MA_preventActions = false;
	DEBUG_LOG_WFn_SC(format["exiting script normally"])
};