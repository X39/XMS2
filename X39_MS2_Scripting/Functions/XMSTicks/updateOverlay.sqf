#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	XMSTick Handler
 *	Description will not be available as this is not intended to be callen by anyone but the XMSTicker
 *	Available parent variables:
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeDynamicBlur")			- range 0 - 1 | ammount of blur over entire screen
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeRadialBlur")			- range 0 - 1 | ammount of blur (needs (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFocus") to actually work)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFocus")					- range 0 - 1 | how focused the player will be (where 0 is not focused and 1 is full focus) (needs (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeRadialBlur") to actually work)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFilmGrain")				- range 0 - 1 | how strong the film grain effect will be (confusion)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeChromAberration")		- range 0 - 1 | how strong the chromAberration will be (see things twice>)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeGreyScreen")			- range 0 - 1 | 0 means normal 1 means totally grey
 *	
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_cfnDisableFatigue")		- range 0 - n | >0 will disable fatigue
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_cfnForceWalk")				- range 0 - n | >0 will force walk
 *	
 *	@Param1 - OBJECT - Unit
 *	@Param2 - SCALAR - HandleID
 *	@Return - NA
 */
MT_START
if(!hasInterface) exitWith {};
private["_unit", "_handleID", "_currentHitMarkerValue", "_calcValue", "_currentTemperature"];
_unit = _this select 0;
_handleID = _this select 1;
DEBUG_CODE_SC(if(!isPlayer _unit) exitWith {})
if(isNull(uiNamespace getVariable['X39_MS2_var_UIs_XMS2_Overlay', displayNull])) then
{
	[] call X39_MS2_fnc_overlay_createDisplay;
};
//HitMarker
_currentHitMarkerValue = (_unit getVariable ["X39_MS2_var_hitMarkerValue", 0]);
if(_currentHitMarkerValue > 0) then
{
	_calcValue = ([_unit] call X39_MS2_fnc_getPain) / (0 call X39_MS2_fnc_getMaxPain);
	DEBUG_CODE(if(_calcValue > 1) then { PRINT_ERROR("updateOverlay: HitMarker painValue is > 1!"); };)
	displayCtrl_Overlay(1294) ctrlSetTextColor [1, 1, 1, _currentHitMarkerValue * _calcValue];
	_currentHitMarkerValue = _currentHitMarkerValue - X39_MS2_var_HitMarker_ReductionPerTick;
	if(_currentHitMarkerValue < 0) then 
	{
		_currentHitMarkerValue = 0;
	};
	_unit setVariable ["X39_MS2_var_hitMarkerValue", _currentHitMarkerValue, false];
};

_currentTemperature = [_unit] call X39_MS2_fnc_getTemperature;
if(_currentTemperature < X39_MS2_var_Temperature_minNatural) then
{
	_calcValue = 1 - (_currentTemperature / X39_MS2_var_Temperature_minNatural);
	DEBUG_CODE(if(_calcValue > 1) then { PRINT_ERROR("updateOverlay: Temperature calculation value is > 1!"); };)
	displayCtrl_Overlay(1293) ctrlSetTextColor [1, 1, 1, _calcValue];
}
else
{
	displayCtrl_Overlay(1293) ctrlSetTextColor [1, 1, 1, 0];
};
_currentWetness = [_unit] call X39_MS2_fnc_getWetness;
if(_currentWetness > 0) then
{
	displayCtrl_Overlay(1291) ctrlSetTextColor [1, 1, 1, _currentWetness];
	displayCtrl_Overlay(1291) ctrlShow true;
}
else
{
	displayCtrl_Overlay(1291) ctrlShow false;
};

if([_unit] call X39_MS2_fnc_isBleeding) then
{
	if(!ctrlShown displayCtrl_Overlay(1292)) then
	{
		displayCtrl_Overlay(1292) ctrlShow true;
	};
}
else
{
	if(ctrlShown displayCtrl_Overlay(1292)) then
	{
		displayCtrl_Overlay(1292) ctrlShow false;
	};
};
MT_END
MT_DEBUG(_times pushBack [_fnc_scriptName COMMA MT_TIME])