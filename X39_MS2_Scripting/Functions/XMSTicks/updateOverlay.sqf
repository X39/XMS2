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
private["_unit", "_handleID"];
_unit = _this select 0;
_handleID = _this select 1;

//HitMarker
_currentHitMarkerValue = (_unit getVariable ["X39_MS2_var_hitMarkerValue", 0]);
if(_currentHitMarkerValue != 0) then
{
	_painValue = ([_unit] call X39_MS2_fnc_getPain) / (0 call X39_MS2_fnc_getMaxPain);
	DEBUG_CODE(if(_painValue > 1) then { PRINT_ERROR("updateOverlay: HitMarker_painValue is > 1!"); };)
	displayCtrl_Overlay(1294) ctrlSetTextColor [1, 1, 1, _currentHitMarkerValue * _painValue];
	_currentHitMarkerValue = _currentHitMarkerValue - X39_MS2_var_HitMarker_ReductionPerTick;
	if(_currentHitMarkerValue < 0) then 
	{
		_currentHitMarkerValue = 0;
	};
	_unit setVariable ["X39_MS2_var_hitMarkerValue", _currentHitMarkerValue, false];
};