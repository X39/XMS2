#include "\X39_MS2_Scripting\default.hpp"
#define TIMEOUT 15
/*
 *	Creates a new entry inside of the MedcialActionArray (MAA)
 *
 *	@Param1	- OBJECT - Executing unit
 *	@Param2 - OBJECT - Targeted unit
 *	@Return	- NA
 *	@Author - X39|Cpt. HM Murdock
 */
X39_MS2_var_Internal_Handles_DefibrillateHandle = _this spawn {
	private["_executer", "_unit"];
	_executer = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_unit = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

	if(isNull _unit) exitWith {PRINT_ERROR("no target")};

	X39_XLib_var_ActionDialog_preventMenuOpening = true;

	playSound3D ["\X39_MS2_Resources\sounds\XMS2_SoundFiles_LP12_full.ogg", _unit, false, position _unit, 1, 1, 0];
	_executer playAction "MedicStart";
	[TIMEOUT] call X39_MS2_fnc_setProgressBarTimeout;
	[
		X39_MS2_var_Internal_DialogCommunication_MA_Caller,
		["ainvpknlmstpsnonwrfldnon_medic", "ainvpknlmstpsnonwrfldnon_medic0s", "ainvpknlmstpsnonwrfldnon_ainvpknlmstpsnonwrfldnon_medic"],
		["ainvpknlmstpsnonwrfldnon_medicend"],
		{
			terminate X39_MS2_var_Internal_Handles_DefibrillateHandle;
			X39_XLib_var_ActionDialog_preventMenuOpening = false;
			[] call X39_MS2_fnc_clearProgressBarTimeout;
			[] call X39_MS2_fnc_clearAnimationLock;
		},
		{},
		[X39_MS2_var_Internal_DialogCommunication_MA_Caller, X39_MS2_var_Internal_DialogCommunication_MA_Target]
	] call X39_MS2_fnc_setAnimationLock;
	uiSleep TIMEOUT;
	if([_unit] call X39_MS2_fnc_hasFlatLine) then
	{
		if((([_unit] call X39_MS2_fnc_getAdrenaline) / X39_MS2_var_Drugs_Adrenaline_maxAdrenaline) > X39_MS2_var_InteractionMenu_Defibrillate_RequiredAdrenalineP || random 100 <= X39_MS2_var_InteractionMenu_Defibrillate_ChanceWithoutAdrenaline) then
		{
			if(X39_MS2_var_InteractionMenu_Defibrillate_DistractionAdded > 0) then
			{
				[_unit, X39_MS2_var_InteractionMenu_Defibrillate_DistractionAdded] call X39_MS2_fnc_addDistraction;
			};
			[_unit, -1] call X39_MS2_fnc_setFlatLine;
			[_unit, 0, -1, ""] call X39_MS2_fnc_blackOutUnit;
			[_executer, localize "STR_X39_MS2_Scripting_NotifyMessages_Defibrillate_succeeded"] call X39_MS2_fnc_notifyUnit;
		}
		else
		{
			[_executer, localize "STR_X39_MS2_Scripting_NotifyMessages_Defibrillate_failed"] call X39_MS2_fnc_notifyUnit;
		};
	}
	else
	{
		[_unit, time] call X39_MS2_fnc_setFlatLine;
	};
	_executer playAction "MedicStop";



	X39_XLib_var_ActionDialog_preventMenuOpening = false;
};