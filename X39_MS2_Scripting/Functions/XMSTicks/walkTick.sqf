#include "\X39_MS2_Scripting\default.hpp"
/*
 *	XMSTick Handler
 *	Description will not be available as this is not intended to be callen by anyone but the XMSTicker
 *	Available parent variables:
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeDynamicBlur")				- range 0 - 1 | amount of blur over entire screen
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeRadialBlur")				- range 0 - 1 | amount of blur (needs X39_MS2_var_Internal_Ticker_ppeFocus to actually work)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFocus")						- range 0 - 1 | how focused the player will be (where 0 is not focused and 1 is full focus) (needs X39_MS2_var_Internal_Ticker_ppeRadialBlur to actually work)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFilmGrain")					- range 0 - 1 | how strong the film grain effect will be (confusion)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeChromAberration")			- range 0 - 1 | how strong the chromAberration will be (see things twice>)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeGreyScreen")				- range 0 - 1 | 0 means normal 1 means totally grey
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeWetDisort_LeftStrength")	- range ? - ? | something unknown magic
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeWetDisort_RightStrength")	- range ? - ? | something unknown magic
 *
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_cfnDisableFatigue")			- range 0 - n | >0 will disable fatigue
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_cfnForceWalk")					- range 0 - n | >0 will force walk
 *
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_blackOutStage")				- !get variable only! Contains blackOutStage at the beginning of the tickCircle
 *
 *	@Param1 - OBJECT - Unit
 *	@Param2 - SCALAR - HandleID
 *	@Return - NA
 */
private["_unit", "_handleID", '_speed', '_removeWaterMod', '_lastSpeedCheck', '_timeOfSpeedCheck', '_currentWater'];
_unit = _this select 0;
_handleID = _this select 1;

//Internal variables
_speed = speed player;
_removeWaterMod = 0;
_removeWaterMod = missionNamespace getVariable format["X39_MS2_var_food_removeWaterMod", 0];

//Check if the player is running
if(_speed > 10) then {
	//get the last speed check of the unit
	//So if her runs and runs and runs we will do a little punishment
	_lastSpeedCheck = _unit getVariable["X39_MS2_var_food_lastSpeed", 0];
	_timeOfSpeedCheck = _unit getVariable["X39_MS2_var_food_timeOfSpeedCheck", 0];

	//Check if we need to punish
	if((_timeOfSpeedCheck >= 10) && (_lastSpeedCheck == (round _speed))) then {
		_removeWaterMod = missionNamespace getVariable format["X39_MS2_var_food_removeWaterMod2", 0];
	};

	//FOR DEBUG
	_removeWaterMod = missionNamespace getVariable format["X39_MS2_var_food_removeWaterMod2", 0];
	//Remove now the water
	_currentWater = ([_unit] call X39_MS2_fnc_getWater) - _removeWaterMod;
	[_unit, _currentWater] call X39_MS2_fnc_setWater;

} else {
	//Remove water
	if(_speed > 5) then {
		_currentWater = ([_unit] call X39_MS2_fnc_getWater) - _removeWaterMod;
		[_unit, _currentWater] call X39_MS2_fnc_setWater;
	};
};
