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
private["_unit", "_pulseCurrent"];
_unit = _this select 0;

_pulseCurrent = [_unit] call X39_MS2_fnc_getHeartPulse;
_pulseVal = round (_pulseCurrent / (X39_MS2_var_Adrenaline_deadlyMaxHeartPulsePerSecond / 5));
if(_pulseCurrent >= X39_MS2_var_Adrenaline_normalMaxHeartPulsePerSecond) then
{
	playSound "XMS2_SoundFiles_breathing_1";
};
[] call 
{
	if(_pulseVal == 0) exitWith { playSound "XMS2_SoundFiles_heart_analog_80bpm"; };
	if(_pulseVal == 1) exitWith { playSound "XMS2_SoundFiles_heart_analog_95bpm"; };
	if(_pulseVal == 2) exitWith { playSound "XMS2_SoundFiles_heart_analog_110bpm"; };
	if(_pulseVal == 3) exitWith { playSound "XMS2_SoundFiles_heart_analog_140bpm"; };
	if(_pulseVal >= 4) exitWith { playSound "XMS2_SoundFiles_heart_analog_irregular"; };
};