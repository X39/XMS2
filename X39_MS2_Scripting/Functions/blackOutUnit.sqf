#include "\X39_MS2_Scripting\default.hpp"
/* 
 *	Will blackOut the unit depending on the inputs (current blackOut stage needs to be higher then the current or 0)
 *	!FUNCTION IS FORCED TO BE LOCAL!
 *	Available stages:
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
 *	@Param7 - BOOL		- Override protection mode (just for internal use!)
 *	@Return - BOOL - true when unit was blacked out, false when not
 */
private["_unit", "_stage", "_time", "_text", "_currentStageOfUnit", "_index", "_blackOutId", "_wakeUpCondition", "_override"];
_unit				=	[_this, 0, objNull, [objNull]]	call BIS_fnc_param;
_stage				=	[_this, 1, 0, [0]]				call BIS_fnc_param;
_time				=	[_this, 2, 0, [0]]				call BIS_fnc_param;
_text				=	[_this, 3, "", [""]]			call BIS_fnc_param;
_blackOutId			=	toUpper [_this, 4, "", [""]]	call BIS_fnc_param;
_wakeUpCondition	=	[_this, 5, {false}, [{}]]		call BIS_fnc_param;
_override			=	[_this, 6, false, [false]]		call BIS_fnc_param;
if(isNull _unit) exitWith {PRINT_ERROR("Provided unit is null!");};
FORCELOCAL(_unit);
if(_stage == 0) exitWith
{
	if({_x == -1} count X39_MS2_var_Internal_BlackOut_ConditionCode == count X39_MS2_var_Internal_BlackOut_ConditionCode) then
	{
		_unit setVariable ["X39_MS2_var_BlackOut_timeOfDeath", -1];
		_unit setVariable ["X39_MS2_var_BlackOut_timeOfUnconscious", -1];
		_unit setVariable ["X39_MS2_var_BlackOut_Text", _text];
		_unit setVariable ["X39_MS2_var_BlackOut_isBlackedOut", false];
		["consciousStateChanged", _this, false, "XMS2", missionNamespace] call X39_XLib_EH_fnc_triggerEvent;
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
	["BlackOutTextChanged", [_unit getVariable "X39_MS2_var_BlackOut_Text", _text], false, "XMS2", missionNamespace] call X39_XLib_EH_fnc_triggerEvent;
	_unit setVariable ["X39_MS2_var_BlackOut_Text", _text];
};


_currentStageOfUnit = _unit getVariable["X39_MS2_var_BlackOut_currentStage", 0];

if((_stage > _currentStageOfUnit || {_override}) && {_stage < 5}) then
{
	_unit setCaptive true;
	if(_stage > 3) then
	{
		_unit setVariable ["X39_MS2_var_BlackOut_timeOfDeath", time];
	};
	if(_stage == 1) then
	{
		_unit setVariable ["X39_MS2_var_BlackOut_timeOfUnconscious", time];
	};
	_unit setVariable ["X39_MS2_var_BlackOut_TimeValue", _time];
	_unit setVariable ["X39_MS2_var_BlackOut_Text", _text];
	_unit setVariable ["X39_MS2_var_BlackOut_isBlackedOut", true];
	_unit setVariable ["X39_MS2_var_BlackOut_currentStage", _stage];
	["consciousStateChanged", _this, false, "XMS2", missionNamespace] call X39_XLib_EH_fnc_triggerEvent;
	[_unit] call X39_MS2_fnc_blackOutDialog_createDialog;
};