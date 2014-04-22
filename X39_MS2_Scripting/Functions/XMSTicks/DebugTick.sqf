#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	XMSTick Handler
 *	Special debug tick which will only be applied if XMS is in nonRelease mode
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
hint parseText format[
						"fatigue = %1<br />enableFatigue = %2<br />forceWalk = %3<br />pulse = %4<br />adrenaline = %5<br /><br />Damage<br />Head: %6<br />Body: %7<br />Hands: %8<br />Legs: %9",
						getFatigue _unit,
						_cfnDisableFatigue > 0,
						_cfnForceWalk > 0,
						[_unit] call X39_MS2_fnc_getHeartPulse,
						[_unit] call X39_MS2_fnc_getAdrenaline,
						[_unit] call X39_MS2_fnc_getDamageOfBody,
						[_unit] call X39_MS2_fnc_getDamageOfGeneric,
						[_unit] call X39_MS2_fnc_getDamageOfHands,
						[_unit] call X39_MS2_fnc_getDamageOfHead,
						[_unit] call X39_MS2_fnc_getDamageOfLegs
					];
if(X39_MS2_DEBUG_ppeDynamicBlur != -1)		then {_ppeDynamicBlur = X39_MS2_DEBUG_ppeDynamicBlur;			};
if(X39_MS2_DEBUG_ppeRadialBlur != -1)		then {_ppeRadialBlur = X39_MS2_DEBUG_ppeRadialBlur;				};
if(X39_MS2_DEBUG_ppeFocus != -1)			then {_ppeFocus = X39_MS2_DEBUG_ppeFocus;						};
if(X39_MS2_DEBUG_ppeFilmGrain != -1)		then {_ppeFilmGrain = X39_MS2_DEBUG_ppeFilmGrain;				};
if(X39_MS2_DEBUG_ppeChromAberration != -1)	then {_ppeChromAberration = X39_MS2_DEBUG_ppeChromAberration;	};
if(X39_MS2_DEBUG_ppeGreyScreen != -1)		then {_ppeGreyScreen = X39_MS2_DEBUG_ppeGreyScreen;				};
if(X39_MS2_DEBUG_cfnDisableFatigue != -1)	then {_cfnDisableFatigue = X39_MS2_DEBUG_cfnDisableFatigue;		};
if(X39_MS2_DEBUG_cfnForceWalk != -1)		then {_cfnForceWalk = X39_MS2_DEBUG_cfnForceWalk;				};