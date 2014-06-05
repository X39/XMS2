#include "\X39_MS2_Scripting\default.hpp"
#include "\X39_MS2_UIs\MedicalUi\ui.defs"

/**
 *	UI function to create the MedicalActionMenu dialog
 *
 *	@Param1 - OBJECT - targeted unit
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
_this spawn {
	if(dialog) exitWith {PRINT_ERROR("Another UI is already displayed!");};
	private["_triageCardEntries", "_isSelf", "_index", "_item", "_items", "_color", "_addItem", "_flag", "_itemArray", "_craftingLast", "_currentItemLast", "_cfgMarkerColors", "_x"];
	X39_MS2_var_Internal_DialogCommunication_MA_crafting = [-1, -1, -1];
	X39_MS2_var_Internal_DialogCommunication_MA_currentItem = -1;
	X39_MS2_var_Internal_DialogCommunication_MA_craftingResultItemIndex = -1;
	_craftingLast = "";
	_currentItemLast = X39_MS2_var_Internal_DialogCommunication_MA_currentItem;
	_cfgMarkerColors = (configfile >> "CfgMarkerColors");
	_addItemToItemList = {
		private["_index", "_x", "_lbIndex"];
		_x = X39_MS2_var_Internal_MedicalActions_actionArray select (_this select 0);
		_lbIndex = lbAdd[IDC_XMS2UI_LB_ITEMS_LIST, _x select 1];
		lbSetColor[IDC_XMS2UI_LB_ITEMS_LIST, _lbIndex, [1, 1, 1, 1]];
		lbSetPicture[IDC_XMS2UI_LB_ITEMS_LIST, _lbIndex, _x select 8];
		lbSetValue[IDC_XMS2UI_LB_ITEMS_LIST, _lbIndex, _this select 0];
	};
	
	createDialog "X39_MS2_MedicalUi";
	waitUntil{dialog};
	
	X39_MS2_var_Internal_DialogCommunication_MA_Caller = player;
	X39_MS2_var_Internal_DialogCommunication_MA_Target = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	if(isNull X39_MS2_var_Internal_DialogCommunication_MA_Target) then
	{
		X39_MS2_var_Internal_DialogCommunication_MA_Target = X39_MS2_var_Internal_DialogCommunication_MA_Caller;
	};
	_isSelf = (X39_MS2_var_Internal_DialogCommunication_MA_Caller == X39_MS2_var_Internal_DialogCommunication_MA_Target);
	//Set targetLabels text
	displayCtrl_MedicalUi(IDC_XMS2UI_LABEL_TARGET) ctrlSetText format[localize "STR_X39_MS2_Scripting_DialogControl_MedicalActionMenu_TargetLabel", name X39_MS2_var_Internal_DialogCommunication_MA_Target];
	//Clear selected item
	displayCtrl_MedicalUi(IDC_XMS2UI_SELECTEDITEM) ctrlSetText "";
	displayCtrl_MedicalUi(IDC_XMS2UI_SELECTEDITEMTEXT) ctrlSetText localize "STR_X39_MS2_Scripting_DialogControl_MedicalActionMenu_ItemSelectionStartText";
	DEBUG_CODE(systemChat format["MedicalMenu is currently targeting: %1" COMMA X39_MS2_var_Internal_DialogCommunication_MA_Target];)
	/*
		Set HitZone buttons
		format string
			%1 part
			%2 IMG IDC
			%3 BUTTON IDC
	*/
	_str = format["if(X39_MS2_var_Internal_DialogCommunication_MA_currentItem == -1) exitWith {[] call X39_MS2_fnc_MedicalActionMenu_outputNothingSelectedMessage;}; ['%1', %4] call X39_MS2_fnc_MedicalActionMenu_btnPerformAction; ctrlSetFocus (findDisplay 26485 displayCtrl %3);", "%1", IDC_XMS2UI_LB_ITEMS_LIST, IDC_XMS2UI_LABEL_TARGET, "%2"];
	buttonSetAction  [IDC_XMS2UI_BTN_TARGET_ARMS, format[_str, "hands", true]];
	buttonSetAction  [IDC_XMS2UI_BTN_TARGET_BODY, format[_str, "body", true]];
	buttonSetAction  [IDC_XMS2UI_BTN_TARGET_LEGS, format[_str, "legs", true]];
	buttonSetAction  [IDC_XMS2UI_BTN_TARGET_HEAD, format[_str, "head", true]];
	buttonSetAction  [IDC_XMS2UI_BTN_TARGET_GENERIC, format[_str, "generic", true]];
	buttonSetAction  [IDC_XMS2UI_BTN_TARGET_TEMPERATURE, format[_str, "temperature", false]];
	//Apply hitZone settings
	ctrlShow	[IDC_XMS2UI_IMG_CRAFTING_DECO1, false];
	ctrlShow	[IDC_XMS2UI_IMG_CRAFTING_DECO2, false];
	ctrlShow	[IDC_XMS2UI_IMG_CRAFTING_RESULT, false];
	
	ctrlShow	[IDC_XMS2UI_IMG_TARGET_HEAD, X39_MS2_var_Damage_EnableHitzoneHead];
	ctrlEnable	[IDC_XMS2UI_BTN_TARGET_HEAD, X39_MS2_var_Damage_EnableHitzoneHead];
	ctrlShow	[IDC_XMS2UI_IMG_TARGET_BODY, X39_MS2_var_Damage_EnableHitzoneBody];
	ctrlEnable	[IDC_XMS2UI_BTN_TARGET_BODY, X39_MS2_var_Damage_EnableHitzoneBody];
	ctrlShow	[IDC_XMS2UI_IMG_TARGET_ARMS, X39_MS2_var_Damage_EnableHitzoneHands];
	ctrlEnable	[IDC_XMS2UI_BTN_TARGET_ARMS, X39_MS2_var_Damage_EnableHitzoneHands];
	ctrlShow	[IDC_XMS2UI_IMG_TARGET_LEGS, X39_MS2_var_Damage_EnableHitzoneLegs];
	ctrlEnable	[IDC_XMS2UI_BTN_TARGET_LEGS, X39_MS2_var_Damage_EnableHitzoneLegs];
	ctrlShow	[IDC_XMS2UI_IMG_TARGET_GENERIC, X39_MS2_var_Damage_EnableHitzoneGeneric];
	ctrlEnable	[IDC_XMS2UI_BTN_TARGET_GENERIC, X39_MS2_var_Damage_EnableHitzoneGeneric];
	ctrlShow	[IDC_XMS2UI_IMG_TARGET_TEMPERATURE, X39_MS2_var_Feature_EnableTemperature];
	ctrlEnable	[IDC_XMS2UI_BTN_TARGET_TEMPERATURE, X39_MS2_var_Feature_EnableTemperature];
	
	
	buttonSetAction  [IDC_XMS2UI_BTN_DIAGNOSIS_PERFORMCHECKUNIT, format["[lbCurSel %1] call X39_MS2_fnc_MedicalActionMenu_btnDiagnosisPerformCheckUnit;", IDC_XMS2UI_C_DIAGNOSIS_CHECKUNITTYPESELECTION]];
	buttonSetAction  [IDC_XMS2UI_BTN_DIAGNOSIS_ADDSELECTEDENTRYTOTRIAGECARD, "[] call X39_MS2_fnc_MedicalActionMenu_btnDiagnosisAddSelectedEntryToTriageCard;"];
	buttonSetAction  [IDC_XMS2UI_BTN_TRIAGECARD_RESETTRIAGECARD, "[] call X39_MS2_fnc_MedicalActionMenu_btnTriageCardResetTriageCard;"];
	buttonSetAction  [IDC_XMS2UI_BTN_TRIAGECARD_REMOVESELECTEDENTRY, "[] call X39_MS2_fnc_MedicalActionMenu_btnTriageCardRemoveSelectedEntry;"];
	//Add colors to combo box
	for "_i" from 0 to ((count _cfgMarkerColors) - 1) do
	{
		_marker		= _cfgMarkerColors select _i;
		_color		= getArray (_marker >> "color");
		_name		= getText (_marker >> "name");
		if(count _color > 0) then
		{
			if(typeName (_color select 0) == "STRING" || typeName (_color select 0) == "TEXT") then
			{
				{
					_color set[_forEachIndex, call (compile _x)];
				}forEach _color;
			};
			_index = lbAdd[IDC_XMS2UI_C_TRIAGECARD_CUSTOMMESSAGESCOLORSELECTION, _name];
			lbSetValue[IDC_XMS2UI_C_TRIAGECARD_CUSTOMMESSAGESCOLORSELECTION, _index, _i];
			lbSetColor [IDC_XMS2UI_C_TRIAGECARD_CUSTOMMESSAGESCOLORSELECTION, _index, _color];
			lbSetPicture[IDC_XMS2UI_C_TRIAGECARD_CUSTOMMESSAGESCOLORSELECTION, _index, format["#(argb,8,8,3)color(%1,%2,%3,%4)", _color select 0, _color select 1, _color select 2, _color select 3]];
		};
	};
	lbSetCurSel [IDC_XMS2UI_C_TRIAGECARD_CUSTOMMESSAGESCOLORSELECTION, 0];
	buttonSetAction  [IDC_XMS2UI_BTN_TRIAGECARD_ADDPREDEFINEDMESSAGE, format["if(lbCurSel %1 == -1) exitWith {[] call X39_MS2_fnc_MedicalActionMenu_outputNothingSelectedMessage;}; [lbText [%1, lbCurSel %1], lbColor [%1, lbCurSel %1]] call X39_MS2_fnc_MedicalActionMenu_addGivenMessageToTriageCard;", IDC_XMS2UI_C_TRIAGECARD_PREDEFINEDMESSAGESSELECTION]];
	buttonSetAction  [IDC_XMS2UI_BTN_TRIAGECARD_ADDCUSTOMMESSAGE, format["[ctrlText %1, lbColor [%2, lbCurSel %2]] call X39_MS2_fnc_MedicalActionMenu_addGivenMessageToTriageCard;", IDC_XMS2UI_TB_TRIAGECARD_CUSTOMMESSAGEINPUT, IDC_XMS2UI_C_TRIAGECARD_CUSTOMMESSAGESCOLORSELECTION]];
	
	//Add Crafting related actions
	buttonSetAction  [IDC_XMS2UI_BTN_CRAFTING_ADDTOSLOT1, format["if(lbCurSel %1 == -1) exitWith {[] call X39_MS2_fnc_MedicalActionMenu_outputNothingSelectedMessage;}; X39_MS2_var_Internal_DialogCommunication_MA_crafting set [%2, lbValue[%1, lbCurSel %1]]; [] call X39_MS2_fnc_MedicalActionMenu_updateCraftingOutput;ctrlShow[true, %3];", IDC_XMS2UI_LB_ITEMS_LIST, 0, IDC_XMS2UI_IMG_CRAFTING_DECO1]];
	buttonSetAction  [IDC_XMS2UI_BTN_CRAFTING_ADDTOSLOT2, format["if(lbCurSel %1 == -1) exitWith {[] call X39_MS2_fnc_MedicalActionMenu_outputNothingSelectedMessage;}; X39_MS2_var_Internal_DialogCommunication_MA_crafting set [%2, lbValue[%1, lbCurSel %1]]; [] call X39_MS2_fnc_MedicalActionMenu_updateCraftingOutput;ctrlShow[true, %3];", IDC_XMS2UI_LB_ITEMS_LIST, 1, IDC_XMS2UI_IMG_CRAFTING_DECO1]];
	buttonSetAction  [IDC_XMS2UI_BTN_CRAFTING_ADDTOSLOT3, format["if(lbCurSel %1 == -1) exitWith {[] call X39_MS2_fnc_MedicalActionMenu_outputNothingSelectedMessage;}; X39_MS2_var_Internal_DialogCommunication_MA_crafting set [%2, lbValue[%1, lbCurSel %1]]; [] call X39_MS2_fnc_MedicalActionMenu_updateCraftingOutput;ctrlShow[true, %3];", IDC_XMS2UI_LB_ITEMS_LIST, 2, IDC_XMS2UI_IMG_CRAFTING_DECO2]];
	
	buttonSetAction  [IDC_XMS2UI_BTN_CRAFTING_SLOT1, format["X39_MS2_var_Internal_DialogCommunication_MA_crafting set [%1, -1]; [] call X39_MS2_fnc_MedicalActionMenu_updateCraftingOutput; ctrlShow[false, %2];",	0, IDC_XMS2UI_IMG_CRAFTING_DECO1]];
	buttonSetAction  [IDC_XMS2UI_BTN_CRAFTING_SLOT2, format["X39_MS2_var_Internal_DialogCommunication_MA_crafting set [%1, -1]; [] call X39_MS2_fnc_MedicalActionMenu_updateCraftingOutput; ctrlShow[false, %2];",	1, IDC_XMS2UI_IMG_CRAFTING_DECO1]];
	buttonSetAction  [IDC_XMS2UI_BTN_CRAFTING_SLOT3, format["X39_MS2_var_Internal_DialogCommunication_MA_crafting set [%1, -1]; [] call X39_MS2_fnc_MedicalActionMenu_updateCraftingOutput; ctrlShow[false, %2];",	2, IDC_XMS2UI_IMG_CRAFTING_DECO2]];
	buttonSetAction  [IDC_XMS2UI_IMG_CRAFTING_RESULT, format["if(X39_MS2_var_Internal_DialogCommunication_MA_craftingResultItemIndex == -1) exitWith {}; X39_MS2_var_Internal_DialogCommunication_MA_currentItem = X39_MS2_var_Internal_DialogCommunication_MA_craftingResultItemIndex;"]];
	
	//Set itemList LBSelChanged eventhandler to change the current active item on switch
	displayCtrl_MedicalUi(IDC_XMS2UI_LB_ITEMS_LIST) ctrlSetEventHandler ["LBSelChanged", format["X39_MS2_var_Internal_DialogCommunication_MA_currentItem = lbValue[%1, _this select 1];", IDC_XMS2UI_LB_ITEMS_LIST]];

	
	
	//Add preDefinedTriageCardMessages to UI
	{
		_index = lbAdd[IDC_XMS2UI_C_TRIAGECARD_PREDEFINEDMESSAGESSELECTION, _x select 0];
		lbSetPicture[IDC_XMS2UI_C_TRIAGECARD_PREDEFINEDMESSAGESSELECTION, _index, format["#(argb,8,8,3)color(%1,%2,%3,%4)", (_x select 2) select 0, (_x select 2) select 1, (_x select 2) select 2, (_x select 2) select 3]];
		false
	}count X39_MS2_var_Internal_Dialog_TriageCard_PreDefinedMessages;
	if(count X39_MS2_var_Internal_Dialog_TriageCard_PreDefinedMessages > 0) then
	{
		lbSetCurSel[IDC_XMS2UI_C_TRIAGECARD_PREDEFINEDMESSAGESSELECTION, 0];
	};
	
	
	//Add TriageCard states to UI
	{
		_index = lbAdd[IDC_XMS2UI_C_TRIAGECARD_TRIAGESTATESELECTION, _x select 0];
		lbSetPicture[IDC_XMS2UI_C_TRIAGECARD_TRIAGESTATESELECTION, _index, format["#(argb,8,8,3)color(%1,%2,%3,%4)", (_x select 2) select 0, (_x select 2) select 1, (_x select 2) select 2, (_x select 2) select 3]];
		false
	}count X39_MS2_var_Internal_Dialog_TriageCard_States;
	lbSetCurSel[IDC_XMS2UI_C_TRIAGECARD_TRIAGESTATESELECTION, X39_MS2_var_Internal_DialogCommunication_MA_Target getVariable ["X39_MS2_var_triageState", -1]];
	displayCtrl_MedicalUi(IDC_XMS2UI_C_TRIAGECARD_TRIAGESTATESELECTION) ctrlSetEventHandler ["LBSelChanged", "[X39_MS2_var_Internal_DialogCommunication_MA_Target, _this select 1] call X39_MS2_fnc_setTriageState;"];
	
	//Add checkUnitTypes
	_index = lbAdd[IDC_XMS2UI_C_DIAGNOSIS_CHECKUNITTYPESELECTION, localize "STR_X39_MS2_Scripting_DialogControl_MedicalActionMenu_CheckUnit_quick"];
	_index = lbAdd[IDC_XMS2UI_C_DIAGNOSIS_CHECKUNITTYPESELECTION, localize "STR_X39_MS2_Scripting_DialogControl_MedicalActionMenu_CheckUnit_normal"];
	_index = lbAdd[IDC_XMS2UI_C_DIAGNOSIS_CHECKUNITTYPESELECTION, localize "STR_X39_MS2_Scripting_DialogControl_MedicalActionMenu_CheckUnit_full"];
	lbSetCurSel[IDC_XMS2UI_C_DIAGNOSIS_CHECKUNITTYPESELECTION, profileNamespace getVariable["X39_MS2_var_MedicalUI_selectedCheckUnitIndex", 0]];
	displayCtrl_MedicalUi(IDC_XMS2UI_C_DIAGNOSIS_CHECKUNITTYPESELECTION) ctrlSetEventHandler ["LBSelChanged", "profileNamespace setVariable['X39_MS2_var_MedicalUI_selectedCheckUnitIndex', _this select 1]"];

	
	//Begin UI Loop
	while {!([X39_MS2_var_Internal_DialogCommunication_MA_Caller] call X39_MS2_fnc_isBlackedOut) && dialog} do
	{
		DEBUG_LOG("MedicalUI Loop is running a new tick");
		//Set current item
		if(_currentItemLast != X39_MS2_var_Internal_DialogCommunication_MA_currentItem) then
		{
			_currentItemLast = X39_MS2_var_Internal_DialogCommunication_MA_currentItem;
			_item = X39_MS2_var_Internal_MedicalActions_actionArray select X39_MS2_var_Internal_DialogCommunication_MA_currentItem;
			displayCtrl_MedicalUi(IDC_XMS2UI_SELECTEDITEM) ctrlSetText (_item select 8);
			displayCtrl_MedicalUi(IDC_XMS2UI_SELECTEDITEMTEXT) ctrlSetText format[localize "STR_X39_MS2_Scripting_DialogControl_MedicalActionMenu_ItemSelectionText", (_item select 1)];
		};
		//Handle crafting slots display
		if(_craftingLast != str X39_MS2_var_Internal_DialogCommunication_MA_crafting) then
		{
			_craftingLast = str X39_MS2_var_Internal_DialogCommunication_MA_crafting;
			//Slot 1
			if(X39_MS2_var_Internal_DialogCommunication_MA_crafting select 0 != -1) then
			{
				_image = (X39_MS2_var_Internal_MedicalActions_actionArray select (X39_MS2_var_Internal_DialogCommunication_MA_crafting select 0)) select 8;
				displayCtrl_MedicalUi(IDC_XMS2UI_IMG_CRAFTING_SLOT1) ctrlSetText _image;
			}
			else
			{
				displayCtrl_MedicalUi(IDC_XMS2UI_IMG_CRAFTING_SLOT1) ctrlSetText "";
			};
			//Slot 2
			if(X39_MS2_var_Internal_DialogCommunication_MA_crafting select 1 != -1) then
			{
				_image = (X39_MS2_var_Internal_MedicalActions_actionArray select (X39_MS2_var_Internal_DialogCommunication_MA_crafting select 1)) select 8;
				displayCtrl_MedicalUi(IDC_XMS2UI_IMG_CRAFTING_SLOT2) ctrlSetText _image;
			}
			else
			{
				displayCtrl_MedicalUi(IDC_XMS2UI_IMG_CRAFTING_SLOT2) ctrlSetText "";
			};
			//Slot 3
			if(X39_MS2_var_Internal_DialogCommunication_MA_crafting select 2 != -1) then
			{
				_image = (X39_MS2_var_Internal_MedicalActions_actionArray select (X39_MS2_var_Internal_DialogCommunication_MA_crafting select 2)) select 8;
				displayCtrl_MedicalUi(IDC_XMS2UI_IMG_CRAFTING_SLOT3) ctrlSetText _image;
			}
			else
			{
				displayCtrl_MedicalUi(IDC_XMS2UI_IMG_CRAFTING_SLOT3) ctrlSetText "";
			};
		};
		//Handle item list (remove entries when item is not present in inventory)
		_itemArray = [];
		for "_i" from 0 to (lbSize IDC_XMS2UI_LB_ITEMS_LIST) do
		{
			_index = lbValue [IDC_XMS2UI_LB_ITEMS_LIST, _i];
			if(_index != 0) then
			{
				_x = X39_MS2_var_Internal_MedicalActions_actionArray select _index;
				_flag = _x select 9 call {
					private["_x"];
					({
						((_x in items X39_MS2_var_Internal_DialogCommunication_MA_Caller) || {(_x in items X39_MS2_var_Internal_DialogCommunication_MA_Target)})
					}count _this) > 0
				};
				if(!_flag) then
				{
					lbDelete[IDC_XMS2UI_LB_ITEMS_LIST, _i];
					_i = _i - 1;
				}
				else
				{
					_itemArray set[count _itemArray, _index];
				};
			};
		};
		DEBUG_LOG("_itemArray");
		DEBUG_LOG(str _itemArray);
		{
			if(_forEachIndex != 0) then
			{
				DEBUG_LOG(str _x);
				if(!(_forEachIndex in _itemArray)) then
				{
					if(count (_x select 17) == 0) then
					{
						if((_x select 9) call {
							private["_x"];
							{
								((_x in items X39_MS2_var_Internal_DialogCommunication_MA_Caller) || {(_x in items X39_MS2_var_Internal_DialogCommunication_MA_Target)})
							}count _this > 0
						}) then
						{
							[_forEachIndex] call _addItemToItemList;
						};
					};
				};
			};
		}forEach X39_MS2_var_Internal_MedicalActions_actionArray;
		
		//update Triage Card
		_triageCardEntries = X39_MS2_var_Internal_DialogCommunication_MA_Target getVariable ["X39_MS2_var_triageCard", []];
		_triageState = X39_MS2_var_Internal_DialogCommunication_MA_Target getVariable ["X39_MS2_var_triageState", -1];
		if(count _triageCardEntries != lbSize IDC_XMS2UI_LB_TRIAGECARD_ENTRIES) then
		{
			lbClear displayCtrl_MedicalUi(IDC_XMS2UI_LB_TRIAGECARD_ENTRIES);
			{
				if(!isNil "_x") then
				{
					displayCtrl_MedicalUi(IDC_XMS2UI_LB_TRIAGECARD_ENTRIES) lbSetColor[displayCtrl_MedicalUi(IDC_XMS2UI_LB_TRIAGECARD_ENTRIES) lbAdd (_x select 0), _x select 1];
				};
				false
			}count _triageCardEntries;
		};
		if(_triageState >= 0) then
		{
			_stateArray = X39_MS2_var_Internal_Dialog_TriageCard_States select _triageState;
			displayCtrl_MedicalUi(IDC_XMS2UI_IMG_TRIAGECARD_TRIAGESYMBOL) ctrlSetTextColor (_stateArray select 2);
			displayCtrl_MedicalUi(IDC_XMS2UI_BTN_TRIAGECARD_TRIAGESYMBOL) ctrlSetTextColor (_stateArray select 2);
			if(_stateArray select 3 < 0) then
			{
				displayCtrl_MedicalUi(IDC_XMS2UI_BTN_TRIAGECARD_TRIAGESYMBOL) ctrlSetText "";
			}
			else
			{
				displayCtrl_MedicalUi(IDC_XMS2UI_BTN_TRIAGECARD_TRIAGESYMBOL) ctrlSetText str (_stateArray select 3);
			};
		}
		else
		{
			displayCtrl_MedicalUi(IDC_XMS2UI_IMG_TRIAGECARD_TRIAGESYMBOL) ctrlSetTextColor [0,0,0,0];
			displayCtrl_MedicalUi(IDC_XMS2UI_BTN_TRIAGECARD_TRIAGESYMBOL) ctrlSetTextColor [0,0,0,0];
			displayCtrl_MedicalUi(IDC_XMS2UI_BTN_TRIAGECARD_TRIAGESYMBOL) ctrlSetText "";
		};
		
		//update target display (body)
		_color = ([[X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getDamageOfHands,	X39_MS2_var_Damage_maxDamageHands]	call X39_MS2_fnc_getColorArrayFromDamageValue);
		displayCtrl_MedicalUi(IDC_XMS2UI_IMG_TARGET_ARMS) ctrlSetTextColor [_color select 0, _color select 1, [X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getBleedingOfHands, _color select 3];
		
		_color = ([[X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getDamageOfBody,	X39_MS2_var_Damage_maxDamageBody]	call X39_MS2_fnc_getColorArrayFromDamageValue);
		displayCtrl_MedicalUi(IDC_XMS2UI_IMG_TARGET_BODY) ctrlSetTextColor [_color select 0, _color select 1, [X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getBleedingOfBody, _color select 3];
		
		_color = ([[X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getDamageOfLegs,	X39_MS2_var_Damage_maxDamageLegs]	call X39_MS2_fnc_getColorArrayFromDamageValue);
		displayCtrl_MedicalUi(IDC_XMS2UI_IMG_TARGET_LEGS) ctrlSetTextColor [_color select 0, _color select 1, [X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getBleedingOfLegs, _color select 3];
		
		_color = ([[X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getDamageOfHead,	X39_MS2_var_Damage_maxDamageHead]	call X39_MS2_fnc_getColorArrayFromDamageValue);
		displayCtrl_MedicalUi(IDC_XMS2UI_IMG_TARGET_HEAD) ctrlSetTextColor [_color select 0, _color select 1, [X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getBleedingOfHead, _color select 3];
		
		_color = ([[X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getDamageOfGeneric, X39_MS2_var_Damage_maxDamageGeneric] call X39_MS2_fnc_getColorArrayFromDamageValue);
		displayCtrl_MedicalUi(IDC_XMS2UI_IMG_TARGET_GENERIC) ctrlSetTextColor [_color select 0, _color select 1, [X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getBleedingOfGeneric, _color select 3];
		
		_color = ([X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getTemperature) / X39_MS2_var_Temperature_max;
		displayCtrl_MedicalUi(IDC_XMS2UI_IMG_TARGET_TEMPERATURE) ctrlSetTextColor [_color, _color, _color, 1];
	};
	if(dialog) then
	{
		closeDialog 26485;
	};
};