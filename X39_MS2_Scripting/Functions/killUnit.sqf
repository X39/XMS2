#include "\X39_MS2_Scripting\default.hpp"
/**
 *	kills the given unit (same like "OBJECT setDamage 1" but with other things happening like correcting stats etc.)
 *
 *	@ParamsCount - 1
 *	@Param1 - OBJECT - Unit to kill
 *	@Param1 - BOOL - apply score change to last hitter (true => playerScore + 1 (to remove the selfkill) & killerScore + 1 (to add the kill), false => Skip those things)
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
params [
	["_unit", objNull, [objNull]],
	["_applyScoreChange", true, [true]]
];

if(isNull _unit) exitWith { PRINT_ERROR("No valid unit to kill provided"); };

sendMessageToServer(MSG_REMOVEXMS2UNITFROMUNITARRAY, _unit);

_unit setDamage 1;
if(_applyScoreChange) then
{
	private "_lastHitter";
	_lastHitter = _unit getVariable["X39_MS2_var_Damage_LastHitter", objNull];
	_unit addScore 1;
	if(!isNull _lastHitter) then
	{
		if ([_unit call BIS_fnc_objectSide, _lastHitter call BIS_fnc_objectSide] call BIS_fnc_areFriendly) then
		{
			_lastHitter addScore -1;//friendly kill
		}
		else
		{
			_lastHitter addScore 1;	//enemy kill
		};
	};
};
if(_unit getVariable ["X39_MS2_var_UnitInitialized", false]) then
{
	[] call X39_MS2_fnc_resetPPEffects;
};