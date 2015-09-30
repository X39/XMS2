#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	XMSTick Handler
 *	Description will not be available as this is not intended to be callen by anyone but the XMSTicker
 *	Available parent variables:
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeDynamicBlur")			- range 0 - 1 | ammount of blur over entire screen
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeRadialBlur")			- range 0 - 1 | ammount of blur (needs (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFocus") to actually work)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFocus")				- range 0 - 1 | how focused the player will be (where 0 is not focused and 1 is full focus) (needs (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeRadialBlur") to actually work)
 *		X39_MS2_var_Internal_Ticker(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFilmGrain")			- range 0 - 1 | how strong the film grain effect will be (confusion)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeChromAberration")		- range 0 - 1 | how strong the chromAberration will be (see things twice>)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeGreyScreen")			- range 0 - 1 | 0 means normal 1 means totally grey
 *	
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_cfnDisableFatigue")		- range 0 - n | >0 will disable fatigue
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_cfnForceWalk")			- range 0 - n | >0 will force walk
 *	
 *	@Param1 - OBJECT - Unit
 *	@Param2 - SCALAR - HandleID
 *	@Return - NA
 */
MT_START
if(!X39_MS2_var_Feature_EnableTemperature) exitWith {DEBUG_LOG("As X39_MS2_var_Feature_EnableTemperature is false the temperatureTick is skipped");};
private["_unit", "_handleID", "_currentTemperature", "_temperatureChange", "_calcValue", "_firePlaces"];
_unit = _this select 0;
_handleID = _this select 1;
_temperatureChange = X39_MS2_var_Temperature_valueRaisePerTick;
_currentTemperature = [_unit] call X39_MS2_fnc_getTemperature;
_calcValue = 0;
_firePlaces = count nearestObjects[player, X39_MS2_var_Temperature_fireplaceClasses, 5];

//Simulation
//Rain Freeze simulation
if(rain > X39_MS2_var_Temperature_startRainAffectionAt && _currentTemperature > X39_MS2_var_Temperature_maxReductionByRaining) then
{
	_temperatureChange = _temperatureChange + -(X39_MS2_var_Temperature_valueReductionWhileRainingPerTick * rain);
};
DEBUG_LOG_WFn_SC(format["_temperatureChange after rain part of simulation: %1" COMMA _temperatureChange])
//Water freeze simulation
if(surfaceIsWater position _unit && _currentTemperature > X39_MS2_var_Temperature_maxReductionByOcean) then
{
	_temperatureChange = _temperatureChange + -X39_MS2_var_Temperature_valueReductionWhileSwimmingPerTick;
	if(X39_MS2_var_Temperature_oceanSetsWetnessToFull) then
	{
		[_unit, 1] call X39_MS2_fnc_setWetness;
	};
};
DEBUG_LOG_WFn_SC(format["_temperatureChange after ocean part of simulation: %1" COMMA _temperatureChange])
if(!([_unit] call X39_XLib_fnc_isUnitInShelter)) then
{
	if(_unit getVariable ["X39_MS2_var_isUnitInOpenArea", false] || X39_MS2_var_special_DisableTimeIntensiveCallsTick) then
	{
		if(_temperatureChange < 0) then
		{
			_temperatureChange = _temperatureChange + _temperatureChange * windStr * X39_MS2_var_Temperature_windStrengthImpactModificator;
		}
		else
		{
			_temperatureChange = _temperatureChange - _temperatureChange * windStr * X39_MS2_var_Temperature_windStrengthImpactModificator;
		};
	};
}
else
{
	_temperatureChange = _temperatureChange + X39_MS2_var_Temperature_increaseInShelter;
};
DEBUG_LOG_WFn_SC(format["_temperatureChange after shelter part of simulation: %1" COMMA _temperatureChange])
//Environment temperature difference
if(_currentTemperature > X39_MS2_var_Temperature_environmentTemperatureP * X39_MS2_var_Temperature_max) then
{
	_temperatureChange = _temperatureChange - X39_MS2_var_Temperature_reductionByEnvironmentOnHighBodyTemperaturePerTick;
};
DEBUG_LOG_WFn_SC(format["_temperatureChange after environment part of simulation: %1" COMMA _temperatureChange])
//check if its day or night
if(((daytime + 24 + 4.5) mod 24) - 10 < 0) then
{//night
	if(_currentTemperature > X39_MS2_var_Temperature_maxTempChangeByEnvironmentP_night * X39_MS2_var_Temperature_max) then
	{
		_temperatureChange = _temperatureChange + X39_MS2_var_Temperature_environmentChangePerTick_night;
	};
}
else
{//day
	if(_currentTemperature < X39_MS2_var_Temperature_maxTempChangeByEnvironmentP_day * X39_MS2_var_Temperature_max) then
	{
		_temperatureChange = _temperatureChange + X39_MS2_var_Temperature_environmentChangePerTick_day;
	};
};
DEBUG_LOG_WFn_SC(format["_temperatureChange after daytime part of simulation: %1" COMMA _temperatureChange])
//height simulation
if((getPosASL player select 2) > X39_MS2_var_Temperature_aslHeightReductionStart && vehicle _unit == _unit) then
{
	private["_calcBase"];
	_calcBase = (getPosASL player select 2) / X39_MS2_var_Temperature_aslMaxReductionHit;
	_temperatureChange = _temperatureChange - _calcBase * X39_MS2_var_Temperature_aslImpactPerTick;
};
DEBUG_LOG_WFn_SC(format["_temperatureChange after height part of simulation: %1" COMMA _temperatureChange])
//body stress simulation (done by using speed)
if(X39_MS2_var_Temperature_allowUnitSpeedToAffectTemperatureIncrease && vehicle _unit == _unit) then
{
	_temperatureChange = _temperatureChange + X39_MS2_var_Temperature_speedIncreasePerTick * (speed _unit / X39_MS2_var_Temperature_speedIncreasePerTickCalculationBase);
};
DEBUG_LOG_WFn_SC(format["_temperatureChange after body stress part of simulation: %1" COMMA _temperatureChange])
//prone reduction
if(stance _unit == "PRONE") then
{
	_temperatureChange = _temperatureChange - X39_MS2_var_Temperature_reductionByBeingPronePerTick;
};
DEBUG_LOG_WFn_SC(format["_temperatureChange after prone reduction part of simulation: %1" COMMA _temperatureChange])
//fireplaces impact simulation
if(_firePlaces > 0) then
{
	_temperatureChange = _temperatureChange + X39_MS2_var_Temperature_fireplaceIncreasePerTick;
};
DEBUG_LOG_WFn_SC(format["_temperatureChange after fireplaces part of simulation: %1" COMMA _temperatureChange])
//Wetness stuff (!NEEDS TO BE LAST!)
if(X39_MS2_var_Temperature_enableWetness) then
{
	private["_currentWetness", "_wetnessChange"];
	_currentWetness = [_unit] call X39_MS2_fnc_getWetness;
	if(_temperatureChange < 0) then
	{
		_temperatureChange = _temperatureChange + _temperatureChange * (X39_MS2_var_Temperature_wetnessImpactOnTemperatureChangeModificator_Negative * _currentWetness);
	}
	else
	{
		_temperatureChange = _temperatureChange + _temperatureChange * (X39_MS2_var_Temperature_wetnessImpactOnTemperatureChangeModificator_Positive * _currentWetness);
	};
	_wetnessChange = (-X39_MS2_var_Temperature_wetnessValueReductionPerTick) + X39_MS2_var_Temperature_wetnessIncreaseModificator * rain;
	if(_firePlaces > 0) then
	{
		_wetnessChange = _wetnessChange + -X39_MS2_var_Temperature_wetnessValueReductionPerTick * X39_MS2_var_Temperature_wetnessReductionIncreaseByFireModificator;
	}
	else
	{
		if(_wetnessChange + _currentWetness < X39_MS2_var_Temperature_wetnessMaxReductionWithoutFire) then
		{
			_wetnessChange = 0;
		}
	};
	[_unit, _wetnessChange] call X39_MS2_fnc_addWetness;
};
DEBUG_LOG_WFn_SC(format["_temperatureChange after wetness part of simulation: %1" COMMA _temperatureChange])

//Apply simulation results
if(_temperatureChange != 0) then
{
	//stop increase if environment temperature is reached
	if(_temperatureChange + _currentTemperature < X39_MS2_var_Temperature_environmentTemperatureP * X39_MS2_var_Temperature_max) then
	{
		_currentTemperature = [_unit, _temperatureChange] call X39_MS2_fnc_addTemperature;
	};
};


if(_currentTemperature <= X39_MS2_var_Temperature_minDead) then
{
	[_unit, 4, X39_MS2_var_Temperature_DeathTimerTime, localize "STR_X39_MS2_Scripting_XMSTicks_temperatureTick_DeathThroughColdness"] call X39_MS2_fnc_blackOutUnit; 
};
if(_currentTemperature <= X39_MS2_var_Temperature_minNatural) then
{
	_calcValue = 1 - (_currentTemperature / X39_MS2_var_Temperature_minNatural);
	DEBUG_LOG_WFn(str ["_calcValue" COMMA _calcValue]);
	if(X39_MS2_var_Temperature_useFilmGrainForLowTemperature) then
	{
		_unit setVariable["X39_MS2_var_Internal_Ticker_ppeFilmGrain", (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFilmGrain") + _calcValue];
	};
	if(X39_MS2_var_Temperature_useFocusEffectForLowTemperature) then
	{
		_unit setVariable["X39_MS2_var_Internal_Ticker_ppeRadialBlur", (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeRadialBlur") + _calcValue];
		_unit setVariable["X39_MS2_var_Internal_Ticker_ppeFocus", (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFocus") + _calcValue];
	};
	if(X39_MS2_var_Temperature_useGreyScreenForLowTemperature) then
	{
		_unit setVariable["X39_MS2_var_Internal_Ticker_ppeGreyScreen", (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeGreyScreen") + _calcValue];
	};
};
if(_currentTemperature <= X39_MS2_var_Temperature_forceWalkAtTemperature) then
{
	_unit setVariable["X39_MS2_var_Internal_Ticker_cfnForceWalk", (_unit getVariable "X39_MS2_var_Internal_Ticker_cfnForceWalk") + 1];
};
MT_END
MT_DEBUG(_times pushBack [_fnc_scriptName COMMA MT_TIME])