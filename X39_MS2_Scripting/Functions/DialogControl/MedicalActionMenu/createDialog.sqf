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
		X39_MS2_var_Internal_DialogCommunication_MA_Target = _caller;
	};
	_isSelf = (_caller == X39_MS2_var_Internal_DialogCommunication_MA_Target);
	buttonSetAction  [1600, "X39_MS2_var_DialogControl_MedicalActionMenu_checkUnitTimeout call X39_MS2_fnc_MedicalActionMenu_btnCheckUnit"];

	buttonSetAction  [1601, "if(str lbColor[1500, lbValue[1500, lbCurSel 1500]] == str [0,1,0,1]) then {[lbValue[1500, lbCurSel 1500], 'Hands'] call X39_MS2_fnc_MedicalActionMenu_btnPerformAction;}; ctrlSetFocus (findDisplay 26485 displayCtrl 1600)"];
	buttonSetAction  [1602, "if(str lbColor[1500, lbValue[1500, lbCurSel 1500]] == str [0,1,0,1]) then {[lbValue[1500, lbCurSel 1500], 'Body'] call X39_MS2_fnc_MedicalActionMenu_btnPerformAction;}; ctrlSetFocus (findDisplay 26485 displayCtrl 1600)"];
	buttonSetAction  [1603, "if(str lbColor[1500, lbValue[1500, lbCurSel 1500]] == str [0,1,0,1]) then {[lbValue[1500, lbCurSel 1500], 'Legs'] call X39_MS2_fnc_MedicalActionMenu_btnPerformAction;}; ctrlSetFocus (findDisplay 26485 displayCtrl 1600)"];
	buttonSetAction  [1604, "if(str lbColor[1500, lbValue[1500, lbCurSel 1500]] == str [0,1,0,1]) then {[lbValue[1500, lbCurSel 1500], 'Head'] call X39_MS2_fnc_MedicalActionMenu_btnPerformAction;}; ctrlSetFocus (findDisplay 26485 displayCtrl 1600)"];

	buttonSetAction  [1605, "if(str lbColor[1500, lbValue[1500, lbCurSel 1500]] == str [0,1,0,1]) then {[lbValue[1500, lbCurSel 1500], 'Generic'] call X39_MS2_fnc_MedicalActionMenu_btnPerformAction;}; ctrlSetFocus (findDisplay 26485 displayCtrl 1600)"];
	buttonSetAction  [1607, "if(str lbColor[1500, lbValue[1500, lbCurSel 1500]] == str [0,1,0,1]) then {[lbValue[1500, lbCurSel 1500], 'Temperature', false] call X39_MS2_fnc_MedicalActionMenu_btnPerformAction;}; ctrlSetFocus (findDisplay 26485 displayCtrl 1600)"];

	ctrlShow	[1201, X39_MS2_var_Damage_EnableHitzoneHead];
	ctrlEnable	[1601, X39_MS2_var_Damage_EnableHitzoneHead];
	ctrlShow	[1202, X39_MS2_var_Damage_EnableHitzoneBody];
	ctrlEnable	[1602, X39_MS2_var_Damage_EnableHitzoneBody];
	ctrlShow	[1203, X39_MS2_var_Damage_EnableHitzoneHands];
	ctrlEnable	[1603, X39_MS2_var_Damage_EnableHitzoneHands];
	ctrlShow	[1204, X39_MS2_var_Damage_EnableHitzoneLegs];
	ctrlEnable	[1604, X39_MS2_var_Damage_EnableHitzoneLegs];
	ctrlShow	[1205, X39_MS2_var_Damage_EnableHitzoneGeneric];
	ctrlEnable	[1605, X39_MS2_var_Damage_EnableHitzoneGeneric];

	ctrlShow	[1207, X39_MS2_var_Feature_EnableTemperature];
	ctrlEnable	[1607, X39_MS2_var_Feature_EnableTemperature];

	{
		_index = lbAdd[1500, _x select 0];
		_items = (_x select 8);
		_color = [0, 1, 0, 1];
		if(
			!([_caller, X39_MS2_var_Internal_DialogCommunication_MA_Target] call (_x select 9)) || {
			((_isSelf && (_x select 10) == 2) || (!_isSelf && (_x select 10) == 1))  || {
			(_x select 13) && {count _items > 0 && {{_caller find _x != -1} count _items <= 0 && {X39_MS2_var_Internal_DialogCommunication_MA_Target find _x != -1} count _items <= 0}}
		}}) then
		{
			_color = [1, 0, 0, 1];
		};
		lbSetColor[1500, _index, _color];
		lbSetPicture[1500, _index, _x select 7];
		lbSetValue[1500, _index, _forEachIndex];
		false
	}forEach X39_MS2_var_Internal_MedicalActions_actionArray;
	while {!([_caller] call X39_MS2_fnc_isBlackedOut) && dialog} do
	{
		(findDisplay 26485 displayCtrl 1201) ctrlSetTextColor ([[X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getDamageOfHands, X39_MS2_var_Damage_maxDamageHands] call X39_MS2_fnc_getColorArrayFromDamageValue);
		(findDisplay 26485 displayCtrl 1202) ctrlSetTextColor ([[X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getDamageOfBody, X39_MS2_var_Damage_maxDamageBody] call X39_MS2_fnc_getColorArrayFromDamageValue);
		(findDisplay 26485 displayCtrl 1203) ctrlSetTextColor ([[X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getDamageOfLegs, X39_MS2_var_Damage_maxDamageLegs] call X39_MS2_fnc_getColorArrayFromDamageValue);
		(findDisplay 26485 displayCtrl 1204) ctrlSetTextColor ([[X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getDamageOfHead, X39_MS2_var_Damage_maxDamageHead] call X39_MS2_fnc_getColorArrayFromDamageValue);

		(findDisplay 26485 displayCtrl 1205) ctrlSetTextColor ([[X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getDamageOfGeneric, X39_MS2_var_Damage_maxDamageGeneric] call X39_MS2_fnc_getColorArrayFromDamageValue);
		_contrast = ([X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getTemperature) / X39_MS2_var_Temperature_max;
		(findDisplay 26485 displayCtrl 1207) ctrlSetTextColor [_contrast, _contrast, _contrast, 1];
	};
	if(dialog) then
	{
		closeDialog 26485;
	};
};