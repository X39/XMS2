#include "\X39_MS2_Scripting\default.hpp"
#include "\X39_MS2_UIs\UnitSelectionUi\ui.defs"
/**
 *	!FUNCTION IS NOT CALLSAFE!
 *	UI function to create the unitSelection dialog in vehicles
 *
 *	@Param1 - OBJECT - targeted unit
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
_this spawn {
	DEBUG_CODE(_fnc_scriptName = "X39_MS2_fnc_unitSelection_openDialog";)
	createDialog "X39_MS2_UnitSelectionUi";
	_veh = [_this, 0, vehicle player, [objNull]] call BIS_fnc_param;
	_currentCrewList = [];
	//Does not works for whatever reason ... its "hard coded" inside of the UI now -.-*
	//displayCtrl_UnitSelectionUi(IDC_UNITSELECTIONUI_RSCBUTTONMENUOK_2600) buttonSetAction format["closeDialog 26385; if(!isNull X39_MS2_var_Internal_DialogCommunication_US_TargetedUnit) then {[X39_MS2_var_Internal_DialogCommunication_US_TargetedUnit] call X39_MS2_fnc_interactionMenu_openDialog; X39_MS2_var_Internal_DialogCommunication_US_TargetedUnit = objNull;};"];
	displayCtrl_UnitSelectionUi(IDC_UNITSELECTIONUI_MCLB_UNITSELECTION) ctrlSetEventHandler ["LBSelChanged", format["X39_MS2_var_Internal_DialogCommunication_US_TargetedUnit = _currentCrewList select (lnbValue [%1, [lnbCurSelRow %1, 0]]);", IDC_UNITSELECTIONUI_MCLB_UNITSELECTION]];
	
	while{(!isNull (uiNamespace getVariable "UnitSelectionUi")) && (vehicle player != player)} do
	{
		DEBUG_LOG_WFn_SC(format["_currentCrewList = %1" COMMA _currentCrewList])
		for "_i" from 0 to ((lnbSize IDC_UNITSELECTIONUI_MCLB_UNITSELECTION) select 0) do
		{
			_index = lnbValue [IDC_UNITSELECTIONUI_MCLB_UNITSELECTION, [_i, 0]];
			//Clear display on error
			if(_index >= count _currentCrewList) then
			{
				_i = ((lnbSize IDC_UNITSELECTIONUI_MCLB_UNITSELECTION) select 0) * 2;
				_currentCrewList = [];
				lnbClear IDC_UNITSELECTIONUI_MCLB_UNITSELECTION;
				DEBUG_LOG_WFn_SC("Clearing _currentCrewList & dialog")
			};
			//Remove crew members not in vehicle anymore
			_curObj = _currentCrewList select _index;
			if(vehicle _curObj != _veh) then
			{
				DEBUG_LOG_WFn_SC(format["Removing '%1' at index '%2' from _currentCrewList & dialog" COMMA _curObj COMMA _index])
				_currentCrewList set[_index, -1];
				_currentCrewList = _currentCrewList - [-1];
				displayCtrl_UnitSelectionUi(IDC_UNITSELECTIONUI_MCLB_UNITSELECTION) lnbDeleteRow _index;
				_i = _i - 1;
			};
		};
		{
			if(alive _x && _x != player) then
			{
				if(!(_x in _currentCrewList)) then
				{
					_triageState = [_x] call X39_MS2_fnc_getTriageState;
					
					_index = lnbAddRow [IDC_UNITSELECTIONUI_MCLB_UNITSELECTION, ["", IDC_XMS2UI_C_TRIAGECARD_TRIAGESTATESELECTION select _triageState select 0, name _x]];
					lnbSetPicture [IDC_UNITSELECTIONUI_MCLB_UNITSELECTION, [_index, 0], "\X39_MS2_Resources\UI\MedicalUI\TriageSymbol.paa"];
					lnbSetColor [IDC_UNITSELECTIONUI_MCLB_UNITSELECTION, [_index, 0], IDC_XMS2UI_C_TRIAGECARD_TRIAGESTATESELECTION select _triageState select 2];
					lnbSetValue [IDC_UNITSELECTIONUI_MCLB_UNITSELECTION, [_index, 0], count _currentCrewList];
					_currentCrewList set[count _currentCrewList, _x];
					DEBUG_LOG_WFn_SC(format["Added '%1' to lnb" COMMA _x])
				};
			};
			false
		}count crew _veh;
		sleep 0.1;
	};
	DEBUG_LOG_WFn_SC("Exiting dialog loop")
	if(!isNull (uiNamespace getVariable "UnitSelectionUi")) then
	{
		DEBUG_LOG_WFn_SC("Dialog still open! Closing")
		closeDialog 26385;
	};
};