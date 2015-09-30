#include "\X39_MS2_Scripting\default.hpp"
/* 
 *	Will blackOut the unit depending on the inputs (current blackOut stage needs to be higher then the current or 0)
 *	!FUNCTION IS FORCED TO BE LOCAL!
 *	Available stages:
 *		(-2) NA (used to add another WakeUpCondition)
 *		(-1) NA (used to update the text)
 *		(0) OK
 *		(1) Temporary black out
 *		(2) Perma black out
 *		(3) Dead without timer
 *		(4) Dead with timer
 *	
 *	@Param1 - OBJECT	- XMS Unit to handle
 *	@Param2 - SCALAR	- blackOut stage to set
 *	@Param3 - SCALAR	- time knockedOut (for stage 1)/time before dead (for stage 4)
 *	@Param4 - STRING	- some text to be displayed
 *	@Param5 - STRING	- BlackOutID
 *	@Param6 - CODE		- WakeUp Condition code (needs to return false to let the unit wake up again) ONLY USED IN STAGE 2
 *							Parameters:
 *							0. _unit:OBJECT
 *	@Param7 - BOOL		- Override protected mode (just for internal use!) --> Makes it possible to move the unit in lower blackOutStages => (0;4]
 *	@Return - BOOL - true when unit was blacked out, false when not
 */
private "_flag";
params [
	["_unit", objNull, [objNull]],
	["_stage", 0, [0]],
	["_time", 0, [0]],
	["_text", "", [""]],
	["_blackOutId", "", [""]],
	["_wakeUpCondition", {false}, [{}]],
	["_override", false, [false]]
];
_blackOutId = toUpper _blackOutId;
_flag = true;

if(isNull _unit) exitWith {PRINT_ERROR("Provided unit is null!");};
FORCELOCAL(_unit);
if(_stage == 0) exitWith
{
	//Ensure ALL blackOutConditions are terminated
	if({ISSCALAR(_x)} count X39_MS2_var_Internal_BlackOut_ConditionCode == count X39_MS2_var_Internal_BlackOut_ConditionCode) then
	{
		_unit setVariable ["X39_MS2_var_BlackOut_timeOfDeath", -1];
		_unit setVariable ["X39_MS2_var_BlackOut_timeOfUnconscious", -1];
		_unit setVariable ["X39_MS2_var_BlackOut_Text", _text];
		_unit setVariable ["X39_MS2_var_BlackOut_isBlackedOut", false];
		_unit setVariable ["tf_unable_to_use_radio", false];
		_unit setVariable ["tf_voiceVolume", 1];
		_unit setVariable ["tf_globalVolume", 1];
		[_unit, false] call X39_MS2_fnc_setToungeBlocking;
		[_unit, false] call X39_MS2_fnc_setArrestPresent;
		if(X39_MS2_var_Events_EnableSetEvents) then
		{
			["consciousStateChanged", _this, false, "XMS2", missionNamespace] call X39_XLib_EH_fnc_triggerEvent;
		};
		_unit setVariable ["X39_MS2_var_BlackOut_currentStage", _stage];
		_unit setCaptive false;
		X39_MS2_var_Internal_BlackOut_ConditionIDs = [];
		X39_MS2_var_Internal_BlackOut_ConditionCode = [];
	}
	else
	{
		[_unit, 2, _time, _text, "", {}, true] call X39_MS2_fnc_blackOutUnit;
	};
};
if(_blackOutId != "") then
{
	if(!(_blackOutId in X39_MS2_var_Internal_BlackOut_ConditionIDs)) then
	{
		_index = X39_MS2_var_Internal_BlackOut_ConditionIDs find -1;
		if(_index == -1) then
		{
			_index = count X39_MS2_var_Internal_BlackOut_ConditionIDs;
		};
		X39_MS2_var_Internal_BlackOut_ConditionIDs	set [_index, _blackOutId];
		X39_MS2_var_Internal_BlackOut_ConditionCode	set [_index, _wakeUpCondition];
	};
};
if(_stage == -1) exitWith
{
	if(X39_MS2_var_Events_EnableSetEvents) then
	{
		["BlackOutTextChanged", [_unit getVariable "X39_MS2_var_BlackOut_Text", _text], false, "XMS2", missionNamespace] call X39_XLib_EH_fnc_triggerEvent;
	};
	_unit setVariable ["X39_MS2_var_BlackOut_Text", _text];
};


_currentStageOfUnit = _unit getVariable["X39_MS2_var_BlackOut_currentStage", 0];

if((_stage > _currentStageOfUnit || _override) && _stage < 5) then
{
	if(_stage == 1 && X39_MS2_var_Blackout_allowTurningTempBlackoutToPermaByChance && random 1 <= X39_MS2_var_Blackout_turnTempToPermaBlackoutChanceP) exitWith
	{
		[_unit, 2, _time, _text, "TempToPermaBlackout", {(([_this select 0] call X39_MS2_fnc_getAdrenaline) / X39_MS2_var_Drugs_Adrenaline_maxAdrenaline) < X39_MS2_var_Blackout_turnTempToPermaWakeUpAtAdrenalineP}, true] call X39_MS2_fnc_blackOutUnit;
	};
	_unit setCaptive true;
	if(_stage > 3) then
	{
		_unit setVariable ["X39_MS2_var_BlackOut_timeOfDeath", time];
	};
	if(_stage == 1) then
	{
		_unit setVariable ["X39_MS2_var_BlackOut_timeOfUnconscious", time];
	};
	if(_currentStageOfUnit <= 1) then
	{
		if(X39_MS2_var_Respiratory_Enable) then
		{
			if(X39_MS2_var_Respiratory_EnableToungeBlockingDuringBlackOut && random 1 <= X39_MS2_var_Respiratory_ChanceForToungeBlockingDuringBlackOutP) then
			{
				[_unit, true] call X39_MS2_fnc_setToungeBlocking;
				_flag = false;
				if(_stage < 2) then
				{
					[_unit, 2, 0, _text, "ToungeBlock", {
																([_this select 0] call X39_MS2_fnc_getToungeBlocking) ||
																( ( X39_MS2_var_Respiratory_RequiredRespirationValueForWakeupP * X39_MS2_var_Respiratory_maxValue ) >= ( [_this select 0] call X39_MS2_fnc_getRespiratory ) )
															}, false] call X39_MS2_fnc_blackOutUnit
				}
				else
				{
					[_unit, _stage, _time, _text, "ToungeBlock", {
																([_this select 0] call X39_MS2_fnc_getToungeBlocking) ||
																( ( X39_MS2_var_Respiratory_RequiredRespirationValueForWakeupP * X39_MS2_var_Respiratory_maxValue ) >= ( [_this select 0] call X39_MS2_fnc_getRespiratory ) )
															}, false] call X39_MS2_fnc_blackOutUnit
				};
			};
			if(X39_MS2_var_Respiratory_EnableRespiratoryArrestDuringBlackOut && random 1 <= X39_MS2_var_Respiratory_ChanceForDirectRespiratoryArrestDuringBlackOutP) then
			{
				[_unit, true] call X39_MS2_fnc_setArrestPresent;
				_flag = false;
				if(_stage < 2) then
				{
					[_unit, 2, 0, _text, "ArrestPresent", {
																([_this select 0] call X39_MS2_fnc_getArrestPresent) ||
																( ( X39_MS2_var_Respiratory_RequiredRespirationValueForWakeupP * X39_MS2_var_Respiratory_maxValue ) >= ( [_this select 0] call X39_MS2_fnc_getRespiratory ) )
															}, false] call X39_MS2_fnc_blackOutUnit
				}
				else
				{
					[_unit, _stage, _time, _text, "ArrestPresent", {
																([_this select 0] call X39_MS2_fnc_getArrestPresent) ||
																( ( X39_MS2_var_Respiratory_RequiredRespirationValueForWakeupP * X39_MS2_var_Respiratory_maxValue ) >= ( [_this select 0] call X39_MS2_fnc_getRespiratory ) )
															}, false] call X39_MS2_fnc_blackOutUnit
				};
			};
		};
	};
	if(_flag) then
	{
		_unit setVariable ["X39_MS2_var_BlackOut_TimeValue", _time];
		_unit setVariable ["X39_MS2_var_BlackOut_Text", _text];
		_unit setVariable ["X39_MS2_var_BlackOut_isBlackedOut", true];
		_unit setVariable ["X39_MS2_var_BlackOut_currentStage", _stage];
		if(X39_MS2_var_Events_EnableSetEvents) then
		{
			["consciousStateChanged", _this, false, "XMS2", missionNamespace] call X39_XLib_EH_fnc_triggerEvent;
		};
		[_unit] call X39_MS2_fnc_blackOutDialog_createDialog;
		_unit setVariable ["tf_unable_to_use_radio", true];
		_unit setVariable ["tf_voiceVolume", 0];
		_unit setVariable ["tf_globalVolume", 0];
	};
};