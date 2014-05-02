#include "\X39_MS2_Scripting\default.hpp"
/* 
 * Will blackOut the unit depending on the inputs (current blackOut stage needs to be higher then the current or 0)
 * Available stages:
 *	(-1) NA (use this to update the text only)
 *	(0) OK
 *	(1) Temporary black out
 *	(2) Perma black out
 *	(3) Dead without timer
 *	(4) Dead with timer
 *	
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - blackOut stage to set
 * @Param3 - SCALAR - time knockedOut (for stage 1)/time before dead (for stage 4)
 * @Param4 - STRING - some text to be displayed
 * @Return - BOOL - true when unit was blacked out, false when not
 */
private["_unit", "_stage", "_time", "_text", "_currentStageOfUnit"];
_unit =		[_this, 0, objNull, [objNull]]	call BIS_fnc_param;
_stage =	[_this, 1, 0, [0]]				call BIS_fnc_param;
_time =		[_this, 2, 0, [0]]				call BIS_fnc_param;
_text =		[_this, 3, "", [""]]			call BIS_fnc_param;
if(isNull _unit) exitWith {PRINT_ERROR("Provided unit is null!");};
if(_stage == -1) exitWith
{
	["BlackOutTextChanged", [_unit getVariable "X39_MS2_var_BlackOut_Text", _text], false, "XMS2", missionNamespace] call X39_XLib_EH_fnc_triggerEvent;
	_unit setVariable ["X39_MS2_var_BlackOut_Text", _text];
	_unit setVariable ["X39_MS2_var_BlackOut_currentStage", _stage];
};
if(_stage == 0) exitWith
{
	_unit setVariable ["X39_MS2_var_BlackOut_Text", _text];
	_unit setVariable ["X39_MS2_var_BlackOut_isBlackedOut", false];
	["unitBlackedOut", _this, false, "XMS2", missionNamespace] call X39_XLib_EH_fnc_triggerEvent;
	_unit setVariable ["X39_MS2_var_BlackOut_currentStage", _stage];
};


_currentStageOfUnit = _unit getVariable["X39_MS2_var_BlackOut_currentStage", 0];

if(_stage > _currentStageOfUnit && {_stage < 5}) then
{
	_unit setVariable ["X39_MS2_var_BlackOut_Text", _text];
	_unit setVariable ["X39_MS2_var_BlackOut_isBlackedOut", true];
	_unit setVariable ["X39_MS2_var_BlackOut_currentStage", _stage];
	["unitBlackedOut", _this, false, "XMS2", missionNamespace] call X39_XLib_EH_fnc_triggerEvent;
	[_unit] call X39_MS2_fnc_blackOutDialog_createDialog;
};