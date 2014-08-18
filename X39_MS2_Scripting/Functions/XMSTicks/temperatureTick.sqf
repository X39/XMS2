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
if(!X39_MS2_var_Feature_EnableTemperature) exitWith {DEBUG_LOG("As X39_MS2_var_Feature_EnableTemperature is false the temperatureTick is skipped");};
private["_unit", "_handleID", "_currentTemperature", "_temperatureChange", "_calcValue"];
_unit = _this select 0;
_handleID = _this select 1;
_temperatureChange = X39_MS2_var_Temperature_valueRaisePerTick;
_currentTemperature = [_unit] call X39_MS2_fnc_getTemperature;
_calcValue = 0;

if(rain > 0.5 && _currentTemperature > X39_MS2_var_Temperature_maxReductionWhileRaining) then
{
	_temperatureChange = _temperatureChange + -(X39_MS2_var_Temperature_valueReductionWhileRainingPerTick * rain);
};
if(surfaceIsWater position _unit) then
{
	_temperatureChange = _temperatureChange + -X39_MS2_var_Temperature_valueReductionWhileSwimmingPerTick;
};

if(_temperatureChange != 0) then
{
	_currentTemperature = [_unit, _temperatureChange] call X39_MS2_fnc_addTemperature;
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
		_ppeFilmGrain = _ppeFilmGrain + _calcValue;
	};
	if(X39_MS2_var_Temperature_useFocusEffectForLowTemperature) then
	{
		_ppeRadialBlur = _ppeRadialBlur + _calcValue;
		_ppeFocus = _ppeFocus + _calcValue;
	};
	if(X39_MS2_var_Temperature_useGreyScreenForLowTemperature) then
	{
		_ppeGreyScreen = _ppeGreyScreen + _calcValue;
	};
};
if(_currentTemperature <= X39_MS2_var_Temperature_forceWalkAtTemperature) then
{
	_cfnForceWalk = _cfnForceWalk + 1;
};