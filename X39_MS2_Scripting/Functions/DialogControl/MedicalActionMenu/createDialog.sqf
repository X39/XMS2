#include "\X39_MS2_Scripting\default.hpp"
/**
 *	UI function to create the MedicalActionMenu dialog
 *
 *	@Param1 - OBJECT - targeted unit
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
_this spawn {
	if(dialog) exitWith {PRINT_ERROR("Another UI is already displayed!");};
	createDialog "X39_MS2_MedicalUi";
	_caller = player;
	X39_MS2_var_Internal_DialogCommunication_MA_Target = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	if(isNull X39_MS2_var_Internal_DialogCommunication_MA_Target) then
	{
		X39_MS2_var_Internal_DialogCommunication_MA_Target = player;
	};
	buttonSetAction  [1600, "X39_MS2_var_DialogControl_MedicalActionMenu_checkUnitTimeout call X39_MS2_fnc_MedicalActionMenu_btnCheckUnit"];
	
	buttonSetAction  [1601, "[lbCurSel 1500, 'Hands'] call X39_MS2_fnc_MedicalActionMenu_btnPerformAction; ctrlSetFocus (findDisplay 26485 displayCtrl 1600)"];
	buttonSetAction  [1602, "[lbCurSel 1500, 'Body'] call X39_MS2_fnc_MedicalActionMenu_btnPerformAction; ctrlSetFocus (findDisplay 26485 displayCtrl 1600)"];
	buttonSetAction  [1603, "[lbCurSel 1500, 'Legs'] call X39_MS2_fnc_MedicalActionMenu_btnPerformAction; ctrlSetFocus (findDisplay 26485 displayCtrl 1600)"];
	buttonSetAction  [1604, "[lbCurSel 1500, 'Head'] call X39_MS2_fnc_MedicalActionMenu_btnPerformAction; ctrlSetFocus (findDisplay 26485 displayCtrl 1600)"];
	
	(findDisplay 26485 displayCtrl 1200) ctrlSetTextColor ([[X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getDamageOfHands, X39_MS2_var_Damage_maxDamageHands] call X39_MS2_fnc_getColorArrayFromDamageValue);
	(findDisplay 26485 displayCtrl 1201) ctrlSetTextColor ([[X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getDamageOfBody, X39_MS2_var_Damage_maxDamageBody] call X39_MS2_fnc_getColorArrayFromDamageValue);
	(findDisplay 26485 displayCtrl 1202) ctrlSetTextColor ([[X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getDamageOfLegs, X39_MS2_var_Damage_maxDamageLegs] call X39_MS2_fnc_getColorArrayFromDamageValue);
	(findDisplay 26485 displayCtrl 1203) ctrlSetTextColor ([[X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getDamageOfHead, X39_MS2_var_Damage_maxDamageHead] call X39_MS2_fnc_getColorArrayFromDamageValue);
	
	{
		_index = lbAdd[1500, _x select 0];
		lbSetColor[1500, _index, if([_caller, X39_MS2_var_Internal_DialogCommunication_MA_Target] call (_x select 8)) then {[0, 1, 0, 1]} else {[1, 0, 0, 1]}];
		lbSetPicture[1500, _index, _x select 5];
		false
	}count X39_MS2_var_Internal_MedicalActions_actionArray;
};