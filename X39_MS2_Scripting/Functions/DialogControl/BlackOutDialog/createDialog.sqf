#include "\X39_MS2_Scripting\default.hpp"
/**
 *	!FUNCTION IS NOT CALLSAFE!
 *	UI function to create the BlackOut dialog
 *
 *	@Param1 - OBJECT - targeted unit
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
if(!local (_this select 0)) exitWith {[_this, _fnc_scriptName, (_this select 0), false] call BIS_fnc_MP;};
if(X39_MS2_var_Internal_DialogCommunication_BO_isActive && isPlayer (_this select 0)) exitWith {};
if(isPlayer (_this select 0)) then
{
	X39_MS2_var_Internal_DialogCommunication_BO_isActive = true;
};
_this spawn {
	_handle = scriptNull;
	_unit = (_this select 0);
	_unit playAction "die";
	_isPlayer = isPlayer _unit;
	if(_isPlayer && {dialog}) then {PRINT_INFO("Another UI is already displayed! Closed that."); closeDialog 0;};
	
	while {([_unit] call X39_MS2_fnc_isBlackedOut) && alive _unit} do
	{
		
		if(_isPlayer && {!dialog}) then
		{
			createDialog "X39_MS2_BlackOutUi";
			buttonSetAction[1600, "player call X39_MS2_fnc_killUnit;"];
			buttonSetAction[1601, "endMission 'end1';"];
		};
		_currentStage = _unit getVariable ["X39_MS2_var_BlackOut_currentStage", 0];
		if(_isPlayer) then
		{
			//Describing text
			displayCtrl_BlackoutUI(1100) ctrlSetStructuredText (parseText (_unit getVariable["X39_MS2_var_BlackOut_Text", ""]));
			//Blood left
			displayCtrl_BlackoutUI(1103) ctrlSetStructuredText (parseText format["%1<br/>%2&#37;", localize "STR_X39_MS2_Scripting_DialogControl_BlackOutDialog_BloodLeft", abs (100 * ((_unit getVariable["X39_MS2_var_Bleeding_Blood", -1]) / X39_MS2_var_Bleeding_maxBloodInEntireBody))]);
			
			//Body temperature
			displayCtrl_BlackoutUI(1102) ctrlSetStructuredText (parseText format["%1<br/>%2°", localize "STR_X39_MS2_Scripting_DialogControl_BlackOutDialog_Temperature", abs (37 * ((_unit getVariable["X39_MS2_var_Temperature_value", -1]) / X39_MS2_var_Temperature_max))]);
			
			//Current pulse
			displayCtrl_BlackoutUI(1101) ctrlSetStructuredText (parseText format["%1<br/>%2", localize "STR_X39_MS2_Scripting_DialogControl_BlackOutDialog_Pulse", floor (_unit getVariable["X39_MS2_var_Heart_heartPulse", -1])]);
			if(time % 20 < 1 && {scriptDone _handle}) then
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
		_timeLeft = -1;
		_timeValue = _unit getVariable["X39_MS2_var_BlackOut_TimeValue", -1];
		if(_currentStage == 1) then
		{
			_timeOfUnconscious = _unit getVariable["X39_MS2_var_BlackOut_timeOfUnconscious", -1];
			_timeLeft = time - _timeOfUnconscious;
			_timeLeft = floor( _timeValue - _timeLeft);
			if(_timeLeft < 0) then
			{
				_timeLeft = 0;
			};
			if(_isPlayer) then
			{
				displayCtrl_BlackoutUI(1104) ctrlSetStructuredText (parseText format["%1<br/>%2", localize "STR_X39_MS2_Scripting_DialogControl_MedicalActionMenu_TimeLeftAwake", ceil _timeLeft]);
			};
			if(_timeLeft == 0) then
			{
				[_unit, 0, -1, ""] call X39_MS2_fnc_blackOutUnit;
			};
		}
		else
		{
			_timeBlackOut = _unit getVariable["X39_MS2_var_BlackOut_timeOfDeath", -1];
			_timeFlatLine = _unit getVariable["X39_MS2_var_Heart_hasFlatLine", -1];
			if(_timeBlackOut != -1 || _timeFlatLine != -1) then
			{
				//
				//X39_MS2_var_Heart_timeBeforeFlatLineKills
				if(_timeBlackOut != -1) then
				{
					_timeLeft = time - (_timeBlackOut);
					_timeLeft = _timeValue - time;
				}
				else
				{
					_timeLeft = time - (_timeFlatLine);
					_timeLeft = X39_MS2_var_Heart_timeBeforeFlatLineKills - time;
				};
				if(_timeLeft < 0) then
				{
					_timeLeft = 0;
				};
			};
			if(_isPlayer) then
			{
				if(_timeLeft >= 0) then
				{
					displayCtrl_BlackoutUI(1104) ctrlSetStructuredText (parseText format["%1<br/>%2", localize "STR_X39_MS2_Scripting_DialogControl_MedicalActionMenu_TimeLeftDeath", ceil _timeLeft]);
				}
				else
				{
					displayCtrl_BlackoutUI(1104) ctrlSetStructuredText (parseText "");
				};
			};
			if(_timeLeft == 0) then
			{
				[_unit] call X39_MS2_fnc_killUnit;
			};
		};
	};
	if(_isPlayer && {dialog}) then
	{
		closeDialog 26484;
	};
	_unit switchMove "amovppnemstpsraswrfldnon";
	if(_isPlayer) then
	{
		X39_MS2_var_Internal_DialogCommunication_BO_isActive = false;
	};
};