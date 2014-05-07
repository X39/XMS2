#include "\X39_MS2_Scripting\default.hpp"
/**
 *	UI function
 *
 *	@Param1 - SCALAR - timeout
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
_this spawn {
	private["_timeout"];
	_timeout = [_this, 0, 0, [0]] call BIS_fnc_param;
	if(isNull X39_MS2_var_Internal_DialogCommunication_MA_Target) exitWith {PRINT_ERROR("X39_MS2_var_Internal_DialogCommunication_MA_Target is null!");};
	if(X39_MS2_var_Internal_DialogCommunication_MA_preventActions) exitWith {[] call X39_MS2_fnc_MedicalActionMenu_outputBlockedMessage;};
	X39_MS2_var_Internal_DialogCommunication_MA_preventActions = true;

	if(_timeout > 0) then
	{
		player playAction "MedicStart";
		sleep _timeout;
	};
	if([player] call X39_MS2_fnc_isBlackedOut) exitWith {X39_MS2_var_Internal_DialogCommunication_MA_preventActions = false;};
	lbClear 1501;
	{
		if(X39_MS2_var_Internal_DialogCommunication_MA_Target call (_x select 2)) then
		{
			_index = lbAdd[1501, format[localize (_x select 0), name X39_MS2_var_Internal_DialogCommunication_MA_Target]];
			lbSetColor[1501, _index, _x select 1];
		};
		false
	}count X39_MS2_var_Internal_MedicalMessages;
	if(_timeout > 0) then
	{
		player playAction "MedicStop";
	};
	X39_MS2_var_Internal_DialogCommunication_MA_preventActions = false;
};