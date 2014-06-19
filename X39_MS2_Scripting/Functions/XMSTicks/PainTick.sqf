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
private["_unit", "_currentPain", "_maxPain", "_changePain"];
_unit = _this select 0;

_currentPain = [_unit] call X39_MS2_fnc_getPain;
_maxPain = [] call X39_MS2_fnc_getMaxPain;
_changePain = -X39_MS2_var_Pain_painReductionPerTick;

_redScreenAlpha = _currentPain / _maxPain;
_ppeDynamicBlur = _redScreenAlpha;

if(X39_MS2_var_Sound_playExtremePainSounds && {_redScreenAlpha > X39_MS2_var_Sound_playExtremePainSounds_startPointP}) then
{
	if(_blackOutStage == 0) then
	{
		playSound3D [format["\X39_MS2_Resources\sounds\XMS2_SoundFiles_pain_short_%1.ogg", floor (random 6)], _unit];
	};
};

if(_changePain != 0) then
{
	[_unit, _changePain] call X39_MS2_fnc_addPain;
};
