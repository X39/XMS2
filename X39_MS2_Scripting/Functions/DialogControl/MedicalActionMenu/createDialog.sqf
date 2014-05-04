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
	private["_triageCardEntries", "_caller", "_isSelf", "_index", "_items", "_color", "_contrast"];
	createDialog "X39_MS2_MedicalUi";
	_caller = player;
	X39_MS2_var_Internal_DialogCommunication_MA_Target = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	if(isNull X39_MS2_var_Internal_DialogCommunication_MA_Target) then
	{
		X39_MS2_var_Internal_DialogCommunication_MA_Target = _caller;
	};
	_isSelf = (_caller == X39_MS2_var_Internal_DialogCommunication_MA_Target);
	buttonSetAction  [1601, "if(lbCurSel 1500 == -1) exitWith {[] call X39_MS2_fnc_MedicalActionMenu_outputNothingSelectedMessage;}; if(str lbColor[1500, lbValue[1500, lbCurSel 1500]] == str [0,1,0,1]) then {[lbValue[1500, lbCurSel 1500], 'Hands'] call X39_MS2_fnc_MedicalActionMenu_btnPerformAction;}; ctrlSetFocus (findDisplay 26485 displayCtrl 1601);"];
	buttonSetAction  [1602, "if(lbCurSel 1500 == -1) exitWith {[] call X39_MS2_fnc_MedicalActionMenu_outputNothingSelectedMessage;}; if(str lbColor[1500, lbValue[1500, lbCurSel 1500]] == str [0,1,0,1]) then {[lbValue[1500, lbCurSel 1500], 'Body'] call X39_MS2_fnc_MedicalActionMenu_btnPerformAction;}; ctrlSetFocus (findDisplay 26485 displayCtrl  1602);"];
	buttonSetAction  [1603, "if(lbCurSel 1500 == -1) exitWith {[] call X39_MS2_fnc_MedicalActionMenu_outputNothingSelectedMessage;}; if(str lbColor[1500, lbValue[1500, lbCurSel 1500]] == str [0,1,0,1]) then {[lbValue[1500, lbCurSel 1500], 'Legs'] call X39_MS2_fnc_MedicalActionMenu_btnPerformAction;}; ctrlSetFocus (findDisplay 26485 displayCtrl  1603);"];
	buttonSetAction  [1604, "if(lbCurSel 1500 == -1) exitWith {[] call X39_MS2_fnc_MedicalActionMenu_outputNothingSelectedMessage;}; if(str lbColor[1500, lbValue[1500, lbCurSel 1500]] == str [0,1,0,1]) then {[lbValue[1500, lbCurSel 1500], 'Head'] call X39_MS2_fnc_MedicalActionMenu_btnPerformAction;}; ctrlSetFocus (findDisplay 26485 displayCtrl  1604);"];

	buttonSetAction  [1605, "if(lbCurSel 1500 == -1) exitWith {[] call X39_MS2_fnc_MedicalActionMenu_outputNothingSelectedMessage;}; if(str lbColor[1500, lbValue[1500, lbCurSel 1500]] == str [0,1,0,1]) then {[lbValue[1500, lbCurSel 1500], 'Generic'] call X39_MS2_fnc_MedicalActionMenu_btnPerformAction;}; ctrlSetFocus (findDisplay 26485 displayCtrl 1605);"];
	buttonSetAction  [1607, "if(lbCurSel 1500 == -1) exitWith {[] call X39_MS2_fnc_MedicalActionMenu_outputNothingSelectedMessage;}; if(str lbColor[1500, lbValue[1500, lbCurSel 1500]] == str [0,1,0,1]) then {[lbValue[1500, lbCurSel 1500], 'Temperature', false] call X39_MS2_fnc_MedicalActionMenu_btnPerformAction;}; ctrlSetFocus (findDisplay 26485 displayCtrl 1607);"];

	buttonSetAction  [1610, "[X39_MS2_var_DialogControl_MedicalActionMenu_checkUnitTimeout] call X39_MS2_fnc_MedicalActionMenu_btnCheckUnit;"];
	buttonSetAction  [1611, "[] call X39_MS2_fnc_MedicalActionMenu_btnAddSelectedToTriageCard;"];
	buttonSetAction  [1612, "[] call X39_MS2_fnc_MedicalActionMenu_btnApplyTriageCardChanges;"];
	buttonSetAction  [1613, "[] call X39_MS2_fnc_MedicalActionMenu_btnAddToTriageCard;"];
	buttonSetAction  [1614, "[] call X39_MS2_fnc_MedicalActionMenu_btnRemoveSelectedFromTriageCard;"];
	buttonSetAction  [1615, "[] call X39_MS2_fnc_MedicalActionMenu_btnClearTriageCard;"];
	
	(findDisplay 26485 displayCtrl 2101) ctrlSetEventHandler ["LBSelChanged", "X39_MS2_var_Internal_DialogCommunication_MA_Target setVariable ['X39_MS2_var_triageState', _this select 1];"];


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
	{
		_index = lbAdd[2100, _x select 0];
		lbSetPicture[2100, _index, format["#(argb,8,8,3)color(%1,%2,%3,%4)", (_x select 2) select 0, (_x select 2) select 1, (_x select 2) select 2, (_x select 2) select 3]];
		false
	}count X39_MS2_var_Internal_Dialog_TriageCard_PreDefinedMessages;
	{
		_index = lbAdd[2101, _x select 0];
		lbSetPicture[2101, _index, format["#(argb,8,8,3)color(%1,%2,%3,%4)", (_x select 2) select 0, (_x select 2) select 1, (_x select 2) select 2, (_x select 2) select 3]];
		false
	}count X39_MS2_var_Internal_Dialog_TriageCard_States;
	lbSetCurSel[2101, 0];
	while {!([_caller] call X39_MS2_fnc_isBlackedOut) && dialog} do
	{
		_triageCardEntries = X39_MS2_var_Internal_DialogCommunication_MA_Target getVariable ["X39_MS2_var_triageCard", []];
		_triageState = X39_MS2_var_Internal_DialogCommunication_MA_Target getVariable ["X39_MS2_var_triageState", -1];
		if(count _triageCardEntries != lbSize 1502) then
		{
			lbClear (findDisplay 26485 displayCtrl 1502);
			{
				if(!isNil "_x") then
				{
					(findDisplay 26485 displayCtrl 1502) lbSetColor[(findDisplay 26485 displayCtrl 1502) lbAdd (_x select 0), _x select 1];
				};
				false
			}count _triageCardEntries;
		};
		if(_triageState >= 0) then
		{
			_stateArray = X39_MS2_var_Internal_Dialog_TriageCard_States select _triageState;
			(findDisplay 26485 displayCtrl 1200) ctrlSetTextColor (_stateArray select 2);
			(findDisplay 26485 displayCtrl 1600) ctrlSetTextColor (_stateArray select 2);
			if(_stateArray select 3 < 0) then
			{
				(findDisplay 26485 displayCtrl 1600) ctrlSetText "";
			}
			else
			{
				(findDisplay 26485 displayCtrl 1600) ctrlSetText str (_stateArray select 3);
			};
		}
		else
		{
			(findDisplay 26485 displayCtrl 1200) ctrlSetTextColor [0,0,0,0];
			(findDisplay 26485 displayCtrl 1600) ctrlSetTextColor [0,0,0,0];
			(findDisplay 26485 displayCtrl 1600) ctrlSetText "";
		};
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