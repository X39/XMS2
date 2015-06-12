#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	XMSTick Handler
 *	Description will not be available as this is not intended to be callen by anyone but the XMSTicker
 *	Available parent variables:
 *		X39_MS2_var_Internal_Ticker_ppeDynamicBlur			- range 0 - 1 | ammount of blur over entire screen
 *		X39_MS2_var_Internal_Ticker_ppeRadialBlur			- range 0 - 1 | ammount of blur (needs (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFocus") to actually work)
 *		X39_MS2_var_Internal_Ticker_ppeFocus					- range 0 - 1 | how focused the player will be (where 0 is not focused and 1 is full focus) (needs (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeRadialBlur") to actually work)
 *		X39_MS2_var_Internal_Ticker_ppeFilmGrain				- range 0 - 1 | how strong the film grain effect will be (confusion)
 *		X39_MS2_var_Internal_Ticker_ppeChromAberration		- range 0 - 1 | how strong the chromAberration will be (see things twice>)
 *		X39_MS2_var_Internal_Ticker_ppeGreyScreen			- range 0 - 1 | 0 means normal 1 means totally grey
 *
 *		X39_MS2_var_Internal_Ticker_cfnDisableFatigue		- range 0 - n | >0 will disable fatigue
 *		X39_MS2_var_Internal_Ticker_cfnForceWalk				- range 0 - n | >0 will force walk
 *	
 *	@Param1 - OBJECT - Unit
 *	@Param2 - SCALAR - HandleID
 *	@Return - NA
 */
private["_unit", "_currentPain", "_maxPain", "_changePain"];
_unit = _this select 0;

_currentPain = [_unit] call X39_MS2_fnc_getPain;
_maxPain = [] call X39_MS2_fnc_getMaxPain;
_changePain = -X39_MS2_var_Pain_painReductionPerTick;

_unit setVariable["X39_MS2_var_Internal_Ticker_redScreenAlpha", (_unit getVariable "X39_MS2_var_Internal_Ticker_redScreenAlpha") + (_currentPain / _maxPain)];
_unit setVariable["X39_MS2_var_Internal_Ticker_ppeDynamicBlur", (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeDynamicBlur") + (_unit getVariable "X39_MS2_var_Internal_Ticker_redScreenAlpha")];

if(_changePain != 0) then
{
	[_unit, _changePain] call X39_MS2_fnc_addPain;
};
