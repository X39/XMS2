#include "\X39_MS2_Scripting\default.hpp"
/**
 *	!FUNCTION IS NOT CALLSAFE!
 *	UI function to create the BlackOut dialog
 *
 *	@Param1 - OBJECT - targeted unit
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
if(!hasInterface) exitWith {};
if(!isPlayer (_this select 0) || !local (_this select 0)) exitWith {};
if(X39_MS2_var_Internal_DialogCommunication_BO_isActive) exitWith {};
X39_MS2_var_Internal_DialogCommunication_BO_isActive = true;
_this spawn {
	if(dialog) exitWith {PRINT_INFO("Another UI is already displayed! Closed that."); closeDialog 0;};
	_handle = scriptNull;
	(_this select 0) playAction "die";
	
	while {([player] call X39_MS2_fnc_isBlackedOut) && alive player} do
	{
		
		if(!dialog) then
		{
			createDialog "X39_MS2_BlackOutUi";
			buttonSetAction[1600, "player call X39_MedSys_fnc_killUnit; call X39_MedSys_fnc_closeBlackOutDisplay;"];
			buttonSetAction[1601, "endMission 'end1';"];
		};
		_currentStage = player getVariable ["X39_MS2_var_BlackOut_currentStage", 0];
		
		//Describing text
		displayCtrl_BlackoutUI(1100) ctrlSetStructuredText (parseText (player getVariable["X39_MS2_var_BlackOut_Text", ""]));
		if(_currentStage > 4) then
		{
			//Time left
			displayCtrl_BlackoutUI(1104) ctrlSetStructuredText (parseText format["%1<br/>%2", localize "STR_X39_MS2_Scripting_DialogControl_BlackOutDialog_TimeLeft", player getVariable["", -1]]);
		};
		//Blood left
		displayCtrl_BlackoutUI(1103) ctrlSetStructuredText (parseText format["%1<br/>%2&#37;", localize "STR_X39_MS2_Scripting_DialogControl_BlackOutDialog_BloodLeft", abs (100 * ((player getVariable["X39_MS2_var_Bleeding_Blood", -1]) / X39_MS2_var_Bleeding_maxBloodInEntireBody))]);
		
		//Body temperature
		displayCtrl_BlackoutUI(1102) ctrlSetStructuredText (parseText format["%1<br/>%2°", localize "STR_X39_MS2_Scripting_DialogControl_BlackOutDialog_Temperature", abs (37 * ((player getVariable["X39_MS2_var_Temperature_value", -1]) / X39_MS2_var_Temperature_max))]);
		
		//Current pulse
		displayCtrl_BlackoutUI(1101) ctrlSetStructuredText (parseText format["%1<br/>%2", localize "STR_X39_MS2_Scripting_DialogControl_BlackOutDialog_Pulse", floor (player getVariable["X39_MS2_var_Adrenaline_heartPulse", -1])]);
		
		if(time % 20 == 0 && {scriptDone _handle}) then
		{
			_handle = [] spawn {
				private["_i"];
				_i = 0.4;
				while{_i < 1 && dialog} do {
					displayCtrl_BlackoutUI(2200) ctrlSetBackgroundColor  [0, 0, 0, _i];
					_i = _i + 0.02;
					sleep 0.01;
				};
				sleep 1 + ((random 4) / 2);
				_i = 1;
				while{_i < 1 && dialog} do {
					displayCtrl_BlackoutUI(2200) ctrlSetBackgroundColor  [0, 0, 0, _i];
					_i = _i - 0.02;
					sleep 0.01;
				};
				sleep 1 + ((random 4) / 2);
			};
		};
	};
	if(dialog) then
	{
		closeDialog 26484;
	};
	(_this select 0) switchMove "amovppnemstpsraswrfldnon";
	X39_MS2_var_Internal_DialogCommunication_BO_isActive = false;
};