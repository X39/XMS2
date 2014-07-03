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
private["_unit", "_handleID", "_fatigue", "_newPulse", "_stage", "_pulseChange", "_adrenalineChange", "_pulseCurrent", "_adrenalineCurrent", "_speed"];
_unit = _this select 0;
_handleID = _this select 1;
if(!X39_MS2_var_Feature_EnableAdrenaline) exitWith {};

_pulseChange = 0;
_adrenalineChange = 0;
_pulseCurrent = [_unit] call X39_MS2_fnc_getHeartPulse;
_adrenalineCurrent = [_unit] call X39_MS2_fnc_getAdrenaline;
_fatigue = getFatigue _unit;
_stage = speed _unit;
if(vehicle _unit != _unit) then
{
	_stage = 0;
};


//Simulate Heart
if(X39_MS2_var_Heart_enableHeartSimulation && {!([_unit] call X39_MS2_fnc_hasFlatLine)}) then
{
	if(_pulseCurrent <= 0) then
	{
		if(_blackOutStage < 3) then
		{
			[_unit, time] call X39_MS2_fnc_setFlatLine;
		};
	};
	if(_stage < X39_MS2_var_Heart_pulseSpeedStage0) then
	{
		_stage = 0;
	}
	else
	{
		if(_stage < X39_MS2_var_Heart_pulseSpeedStage1) then
		{
			_stage = 1;
		}
		else
		{
			if(_stage < X39_MS2_var_Heart_pulseSpeedStage2) then
			{
				_stage = 2;
			}
			else
			{
				if(_stage < X39_MS2_var_Heart_pulseSpeedStage3) then
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
		_pulseChange = _pulseChange + (-X39_MS2_var_Heart_basePulseChangePerTick * X39_MS2_var_Heart_pulseReductionMultiplicator);
	}
	else
	{
		_pulseChange = _pulseChange + (X39_MS2_var_Heart_basePulseChangePerTick * _stage);
	};
	if(X39_MS2_var_Heart_useFatigueForHeartCalculations) then
	{
		if(_pulseChange < 0) then
		{
			_pulseChange = (1 - _fatigue) * _pulseChange;
		}
		else
		{
			_pulseChange = _pulseChange + _fatigue;
		};
	};
	if(X39_MS2_var_Drugs_Adrenaline_useAdrenalineForHeartCalculations) then
	{
		_pulseChange = _pulseChange * ((1 + (_adrenalineCurrent / X39_MS2_var_Drugs_Adrenaline_maxAdrenaline)) * 2) * X39_MS2_var_Drugs_Adrenaline_AdrenalinePulseMultiplicator;
	};
	_newPulse = _pulseChange + _pulseCurrent;
	if(_pulseChange != 0) then
	{
		if(_newPulse >= X39_MS2_var_Heart_minHeartPulsePerSecond ||  {_blackOutStage >= 2}) then
		{
			if(_blackOutStage >= 2 && _newPulse < X39_MS2_var_Heart_minHeartPulsePerSecond) then
			{
				_pulseChange = _pulseChange * X39_MS2_var_Heart_knockOutSmallerMinPulseManipulator;
				_newPulse = _pulseChange + _pulseCurrent;
			};
			
			if(_stage != 0) then
			{
				if(_stage == 1) then
				{
					if(X39_MS2_var_Heart_pulseLimitStage1 != -1 && _newPulse > X39_MS2_var_Heart_pulseLimitStage1) then
					{
						_pulseChange = (-X39_MS2_var_Heart_basePulseChangePerTick * X39_MS2_var_Heart_pulseReductionMultiplicator);
						_newPulse = _pulseChange + _pulseCurrent;
					};
				}
				else
				{
					if(_stage == 2) then
					{
						if(X39_MS2_var_Heart_pulseLimitStage2 != -1 && _newPulse > X39_MS2_var_Heart_pulseLimitStage2) then
						{
							_pulseChange = (-X39_MS2_var_Heart_basePulseChangePerTick * X39_MS2_var_Heart_pulseReductionMultiplicator);
							_newPulse = _pulseChange + _pulseCurrent;
						};
					}
					else
					{
						if(_stage == 3) then
						{
							if(X39_MS2_var_Heart_pulseLimitStage3 != -1 && _newPulse > X39_MS2_var_Heart_pulseLimitStage3) then
							{
								_pulseChange = (-X39_MS2_var_Heart_basePulseChangePerTick * X39_MS2_var_Heart_pulseReductionMultiplicator);
								_newPulse = _pulseChange + _pulseCurrent;
							};
						}
						else
						{
							if(_stage == 4) then
							{
								if(X39_MS2_var_Heart_pulseLimitStage4 != -1 && _newPulse > X39_MS2_var_Heart_pulseLimitStage4) then
								{
									_pulseChange = (-X39_MS2_var_Heart_basePulseChangePerTick * X39_MS2_var_Heart_pulseReductionMultiplicator);
									_newPulse = _pulseChange + _pulseCurrent;
								};
							};
						};
					};
				};
			};
			
			if(_pulseChange != 0) then
			{
				[_unit, _pulseChange] call X39_MS2_fnc_addHeartPulse;
				[_unit] call X39_MS2_fnc_doHeartPulseDependingActions;
			};
		};
	};
		/*
		if(_pulseChange + _pulseCurrent >= X39_MS2_var_Heart_minHeartPulsePerSecond || {_blackOutStage > 2}) then
		{
			if(_pulseChange + _pulseCurrent < X39_MS2_var_Heart_normalMaxHeartPulsePerSecond && {_adrenalineCurrent / X39_MS2_var_Drugs_Adrenaline_maxAdrenaline < X39_MS2_var_Drugs_Adrenaline_AdrenalinePulseRagePointP}) then
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
	*/
	if(X39_MS2_var_Heart_pulseUseFilmGrainForHighPulseIndicator && _newPulse > X39_MS2_var_Heart_pulseFilmGrainKickIn) then
	{
		_val = ((_newPulse - X39_MS2_var_Heart_pulseFilmGrainKickIn) / (X39_MS2_var_Heart_deadlyMaxHeartPulsePerSecond - X39_MS2_var_Heart_pulseFilmGrainKickIn));
		if(_val > 0) then
		{
			_ppeFilmGrain = _ppeFilmGrain + _val;
		};
	};
	if(X39_MS2_var_Heart_allowForceWalkByPulse && {_newPulse > X39_MS2_var_Heart_pulseForceWalkAt}) then
	{
		_cfnForceWalk = _cfnForceWalk + 1;
	};
	if(X39_MS2_var_Heart_allowBlurryScreenByPulse && {_newPulse > X39_MS2_var_Heart_pulseBlurryAt}) then
	{
		_val = ((_newPulse - X39_MS2_var_Heart_pulseBlurryAt) / (X39_MS2_var_Heart_deadlyMaxHeartPulsePerSecond - X39_MS2_var_Heart_pulseBlurryAt));
		if(_val > 0) then
		{
			_ppeDynamicBlur = _ppeDynamicBlur + _val;
		};
	};
};