#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	XMSTick Handler
 *	Description will not be available as this is not intended to be callen by anyone but the XMSTicker
 *	Available parent variables:
 *		_ppeDynamicBlur				- range 0 - 1 | amount of blur over entire screen
 *		_ppeRadialBlur				- range 0 - 1 | amount of blur (needs _ppeFocus to actually work)
 *		_ppeFocus						- range 0 - 1 | how focused the player will be (where 0 is not focused and 1 is full focus) (needs _ppeRadialBlur to actually work)
 *		_ppeFilmGrain					- range 0 - 1 | how strong the film grain effect will be (confusion)
 *		_ppeChromAberration			- range 0 - 1 | how strong the chromAberration will be (see things twice>)
 *		_ppeGreyScreen				- range 0 - 1 | 0 means normal 1 means totally grey
 *		_ppeWetDisort_LeftStrength	- range ? - ? | something unknown magic
 *		_ppeWetDisort_RightStrength	- range ? - ? | something unknown magic
 *	
 *		_cfnDisableFatigue			- range 0 - n | >0 will disable fatigue
 *		_cfnForceWalk					- range 0 - n | >0 will force walk
 *
 *		_blackOutStage				- !get variable only! Contains blackOutStage at the beginning of the tickCircle
 *	
 *	@Param1 - OBJECT - Unit
 *	@Param2 - SCALAR - HandleID
 *	@Return - NA
 */
if(X39_MS2_var_special_DisableTimeIntensiveCallsTick) exitWith {};
private["_unit", "_handleID"];
_unit = _this select 0;

_unit spawn {_this setVariable["X39_MS2_var_isUnitInOpenArea", [_this, 15, 2.5] call X39_XLib_fnc_isUnitInOpenArea]};