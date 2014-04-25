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
private["_unit", "_handleID", "_fatigue", "_stage", "_pulseChange", "_adrenalineChange", "_pulseCurrent", "_adrenalineCurrent", "_speed"];
_unit = _this select 0;
_handleID = _this select 1;
if(!X39_MS2_var_Feature_EnableAdrenaline) exitWith {};

_pulseChange = 0;
_adrenalineChange = 0;
_pulseCurrent = [_unit] call X39_MS2_fnc_getHeartPulse;
_adrenalineCurrent = [_unit] call X39_MS2_fnc_getAdrenaline;
_fatigue = getFatigue _unit;
_stage = speed _unit;

//Simulate Heart
if(X39_MS2_var_Adrenaline_enableHeartSimulation && {(_unit getVariable ["X39_MS2_var_Adrenaline_HasFlatLine", 0]) == 0}) then
{
	[] call {
		if(_stage < X39_MS2_var_Adrenaline_PulseSpeedStage0) then
		{
			_stage = 0;
		}
		else
		{
			if(_stage < X39_MS2_var_Adrenaline_PulseSpeedStage1) then
			{
				_stage = 1;
			}
			else
			{
				if(_stage < X39_MS2_var_Adrenaline_PulseSpeedStage2) then
				{
					_stage = 2;
				}
				else
				{
					if(_stage < X39_MS2_var_Adrenaline_PulseSpeedStage3) then
					{
						_stage = 3;
					}
					else
					{
						_stage = 4;
					};
				};
			};
		};
		
		if(_stage == 0) then
		{
			_pulseChange = _pulseChange + (-X39_MS2_var_Adrenaline_basePulseChangePerTick * X39_MS2_var_Adrenaline_pulseReductionMultiplicator);
		}
		else
		{
			_pulseChange = _pulseChange + (X39_MS2_var_Adrenaline_basePulseChangePerTick * _stage);
		};
		
		_pulseChange = _pulseChange + _fatigue;
		if(X39_MS2_var_Adrenaline_useAdrenalineForHeartCalculations) then
		{
			_pulseChange = _pulseChange * ((0.5 - (_adrenalineCurrent / X39_MS2_var_Adrenaline_maxAdrenaline)) * 2);
		};
	};
	if(_pulseChange != 0) then
	{
		if(_pulseChange + _pulseCurrent >= X39_MS2_var_Adrenaline_minHeartPulsePerSecond) then
		{
			if(_pulseChange + _pulseCurrent < X39_MS2_var_Adrenaline_normalMaxHeartPulsePerSecond) then
			{
				[_unit, _pulseChange] call X39_MS2_fnc_addHeartPulse;
			}
			else
			{
				_cfnForceWalk = _cfnForceWalk + 1;
			};
			[_unit] call X39_MS2_fnc_doHeartPulseDependingActions;
			DEBUG_LOG_WFn("Pulse has been changed");
		}DEBUG_CODE(else{DEBUG_LOG_WFn("No pulse change required (lower min)");});
	}DEBUG_CODE(else{DEBUG_LOG_WFn("No pulse change has been made");});
	
	_ppeFilmGrain = _ppeFilmGrain + ((_pulseCurrent + _pulseChange) / X39_MS2_var_Adrenaline_deadlyMaxHeartPulsePerSecond) - (X39_MS2_var_Adrenaline_deadlyMaxHeartPulsePerSecond / 2);
};
//Simulate Adrenaline
if(_adrenalineCurrent > 0) then
{
	_adrenalineChange = -X39_MS2_var_Adrenaline_adrenalineReductionPerTick;
};

_ppeRadialBlur = _ppeRadialBlur+ (_adrenalineCurrent + _adrenalineChange) / X39_MS2_var_Adrenaline_maxAdrenaline;
_ppeFocus = _ppeFocus + ((_adrenalineCurrent + _adrenalineChange) / X39_MS2_var_Adrenaline_maxAdrenaline) * 2;

if(_adrenalineChange > 0 && {_adrenalineCurrent + _adrenalineChange > X39_MS2_var_Adrenaline_maxAdrenaline * X39_MS2_var_Adrenaline_naturalAdrenalineP}) then
{
	_adrenalineChange = 0;
};
if(_adrenalineChange != 0) then
{
	[_unit, _adrenalineChange] call X39_MS2_fnc_addAdrenaline;
};