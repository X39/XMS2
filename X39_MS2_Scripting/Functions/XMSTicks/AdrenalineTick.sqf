#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	XMSTick Handler
 *	Description will not be available as this is not intended to be callen by anyone but the XMSTicker
 *	Available parent variables:
 *		_ppeDynamicBlur			- range 0 - 1 | ammount of blur over entire screen
 *		_ppeRadialBlur			- range 0 - 1 | ammount of blur (needs _ppeFocus to actually work)
 *		_ppeFocus				- range 0 - 1 | how focused the player will be (where 0 is not focused and 1 is full focus) (needs _ppeRadialBlur to actually work)
 *		_ppeFilmGrain			- range 0 - 1 | how strong the film grain effect will be (confusion)
 *		_ppeChromAberration		- range 0 - 1 | how strong the chromAberration will be (see things twice>)
 *		_ppeGreyScreen			- range 0 - 1 | 0 means normal 1 means totally grey
 *	
 *		_cfnDisableFatigue		- range 0 - n | >0 will disable fatigue
 *		_cfnForceWalk			- range 0 - n | >0 will force walk
 *	
 *	@Param1 - OBJECT - Unit
 *	@Param2 - SCALAR - HandleID
 *	@Return - NA
 */
private["_unit", "_handleID", "_fatigue", "_pulseChange", "_adrenalineChange", "_pulseCurrent", "_adrenalineCurrent"];
_unit = _this select 0;
_handleID = _this select 1;
if(!X39_MS2_var_Feature_EnableAdrenaline) exitWith {};

_pulseChange = 0;
_adrenalineChange = 0;
_pulseCurrent = [_unit] call X39_MS2_fnc_getHeartPulse;
_adrenalineCurrent = [_unit] call X39_MS2_fnc_getAdrenaline;

//Simulate Heart
if(X39_MS2_var_Adrenaline_enableHeartSimulation && {(_unit getVariable ["X39_MS2_var_Adrenaline_HasFlatLine", 0]) == 0}) then
{
	[] call {
		_fatigue = getFatigue _unit;
		if(X39_MS2_var_Adrenaline_useAdrenalineForHeartCalculations) then
		{
			if(_adrenalineCurrent != 0) then
			{
				_fatigue = _fatigue * (_adrenalineCurrent / X39_MS2_var_Adrenaline_maxAdrenaline);
			};
		};
		if(_fatigue < X39_MS2_var_Adrenaline_fatigueToReducePulse) exitWith
		{
			_pulseChange = (_fatigue - 1) * X39_MS2_var_Adrenaline_pulseReductionPerTickP * X39_MS2_var_Adrenaline_pulseMultiplicator;
			DEBUG_LOG_WFn("Reducing pulse (exit 1)");
		};
		if(_fatigue < X39_MS2_var_Adrenaline_fatigueToKeepPulse) exitWith
		{
			_pulseChange = 0;
			DEBUG_LOG_WFn("Pulse unchanged(exit 2)");
		};
		if(_fatigue < X39_MS2_var_Adrenaline_fatigueToRaisePulseNormal) exitWith
		{
			if(_pulseCurrent + (_fatigue * X39_MS2_var_Adrenaline_pulseMultiplicator) < X39_MS2_var_Adrenaline_normalMaxHeartPulsePerSecond) then
			{
				_pulseChange = _fatigue * X39_MS2_var_Adrenaline_pulseMultiplicator;
				DEBUG_LOG_WFn("Raising pulse (exit 3)");
			}DEBUG_CODE(else{DEBUG_LOG_WFn("leaving pulse (exit 3.2)");});
		};
		if(_fatigue >= X39_MS2_var_Adrenaline_fatigueToRaisePulseNormal) exitWith
		{
			_pulseChange = _fatigue * X39_MS2_var_Adrenaline_pulseMultiplicatorByDeadlyFatigue;
			DEBUG_LOG_WFn("Raising pulse (exit 4)");
		};
	};
	if(_pulseChange != 0) then
	{
		if(_pulseChange + _pulseCurrent >= X39_MS2_var_Adrenaline_minHeartPulsePerSecond) then
		{
			[_unit, _pulseChange] call X39_MS2_fnc_addHeartPulse;
			[_unit] call X39_MS2_fnc_doHeartPulseDependingActions;
			DEBUG_LOG_WFn("Pulse has been changed");
		}DEBUG_CODE(else{DEBUG_LOG_WFn("No pulse change required (lower min)");});
	}DEBUG_CODE(else{DEBUG_LOG_WFn("No pulse change has been made");});
	
	_ppeFilmGrain = ((_pulseCurrent + _pulseChange) / X39_MS2_var_Adrenaline_deadlyMaxHeartPulsePerSecond) - (X39_MS2_var_Adrenaline_deadlyMaxHeartPulsePerSecond / 2);
};
//Simulate Adrenaline
if(_adrenalineCurrent > 0) then
{
	_adrenalineChange = -X39_MS2_var_Adrenaline_adrenalineReductionPerTick;
};

_ppeRadialBlur = (_adrenalineCurrent + _adrenalineChange) / X39_MS2_var_Adrenaline_maxAdrenaline;
_ppeFocus = ((_adrenalineCurrent + _adrenalineChange) / X39_MS2_var_Adrenaline_maxAdrenaline) * 2;

if(_adrenalineChange > 0 && {_adrenalineCurrent + _adrenalineChange > X39_MS2_var_Adrenaline_maxAdrenaline * X39_MS2_var_Adrenaline_naturalAdrenalineP}) then
{
	_adrenalineChange = 0;
};
if(_adrenalineChange != 0) then
{
	[_unit, _adrenalineChange] call X39_MS2_fnc_addAdrenaline;
};