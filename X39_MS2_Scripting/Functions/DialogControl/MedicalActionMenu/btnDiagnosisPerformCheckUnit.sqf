#include "\X39_MS2_Scripting\default.hpp"
#include "\X39_MS2_UIs\MedicalUi\ui.defs"
/**
 *	UI function
 *
 *	@Param1 - SCALAR - timeout
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
if(X39_MS2_var_Internal_DialogCommunication_MA_preventActions) exitWith {[] call X39_MS2_fnc_MedicalActionMenu_outputBlockedMessage;};
X39_MS2_var_Internal_DialogCommunication_MA_preventActions = true;
_this spawn {
	private["_checkUnitType", "_timeout", "_index"];
	_checkUnitType = [_this, 0, 0, [0]] call BIS_fnc_param;
	_timeout = X39_MS2_var_DialogControl_MedicalActionMenu_checkUnitTimeout select _checkUnitType;
	if(_timeout > 0) then
	{
		player playAction "MedicStart";
		//systemChat format["sleeping %1s", _timeout];
		sleep _timeout;
	};
	if([player] call X39_MS2_fnc_isBlackedOut) exitWith {X39_MS2_var_Internal_DialogCommunication_MA_preventActions = false;};
	if(_timeout > 0) then
	{
		player playAction "MedicStop";
	};
	if(!dialog) exitWith {X39_MS2_var_Internal_DialogCommunication_MA_preventActions = false;};
	lbClear IDC_XMS2UI_LB_DIAGNOSIS_ENTRIES;
	{
		if(_checkUnitType >= _x select 3) then
		{
			if(X39_MS2_var_Internal_DialogCommunication_MA_Target call (_x select 2)) then
			{
				_index = lbAdd[IDC_XMS2UI_LB_DIAGNOSIS_ENTRIES, format[localize (_x select 0), name X39_MS2_var_Internal_DialogCommunication_MA_Target, name X39_MS2_var_Internal_DialogCommunication_MA_Caller]];
				lbSetColor[IDC_XMS2UI_LB_DIAGNOSIS_ENTRIES, _index, _x select 1];
			};
		};
		false
	}count X39_MS2_var_Internal_MedicalMessages;
	X39_MS2_var_Internal_DialogCommunication_MA_preventActions = false;

};