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
displayCtrl_Overlay(1072) ctrlShow X39_MS2_DEBUG_enable;
if(X39_MS2_DEBUG_enable && _unit == player) then
{
	displayCtrl_Overlay(1072) ctrlSetStructuredText parseText format[
							"--General Info--<br />fatigue = %11<br />enableFatigue = %12<br />forceWalk = %13<br />pulse = %14<br />adrenaline = %15<br />temperature = %16<br />pain = %17<br />speed = %18<br />Current blood value = %19<br />Hearing ability = %20<br />Morphine = %21<br />Distraction = %22<br />bloodPresure = %23<br /><br />--Damage--<br />Head:<br />- %4<br />- %9<br />Body:<br />- %1<br />- %6<br />Hands:<br />- %3<br />- %8<br />Legs:<br />- %5<br />- %10<br />Generic:<br />- %2<br />- %7",
							[_unit] call X39_MS2_fnc_getDamageOfBody,		//1
							[_unit] call X39_MS2_fnc_getDamageOfGeneric,	//2
							[_unit] call X39_MS2_fnc_getDamageOfHands,		//3
							[_unit] call X39_MS2_fnc_getDamageOfHead,		//4
							[_unit] call X39_MS2_fnc_getDamageOfLegs,		//5
							[_unit] call X39_MS2_fnc_getBleedingOfBody,		//6
							[_unit] call X39_MS2_fnc_getBleedingOfGeneric,	//7
							[_unit] call X39_MS2_fnc_getBleedingOfHands,	//8
							[_unit] call X39_MS2_fnc_getBleedingOfHead,		//9
							[_unit] call X39_MS2_fnc_getBleedingOfLegs,		//10
							getFatigue _unit,								//11
							_cfnDisableFatigue > 0,							//12
							_cfnForceWalk > 0,								//13
							[_unit] call X39_MS2_fnc_getHeartPulse,			//14
							[_unit] call X39_MS2_fnc_getAdrenaline,			//15
							[_unit] call X39_MS2_fnc_getTemperature,		//16
							[_unit] call X39_MS2_fnc_getPain,				//17
							speed _unit,									//18
							[_unit] call X39_MS2_fnc_getBlood,				//19
							[_unit] call X39_MS2_fnc_getHearing,			//20
							[_unit] call X39_MS2_fnc_getMorphine,			//21
							[_unit] call X39_MS2_fnc_getDistraction,		//22
							[_unit] call X39_MS2_fnc_getBloodPresure		//23
						];
	if(X39_MS2_DEBUG_ppeDynamicBlur != -1)		then {_ppeDynamicBlur = X39_MS2_DEBUG_ppeDynamicBlur;			};
	if(X39_MS2_DEBUG_ppeRadialBlur != -1)		then {_ppeRadialBlur = X39_MS2_DEBUG_ppeRadialBlur;				};
	if(X39_MS2_DEBUG_ppeFocus != -1)			then {_ppeFocus = X39_MS2_DEBUG_ppeFocus;						};
	if(X39_MS2_DEBUG_ppeFilmGrain != -1)		then {_ppeFilmGrain = X39_MS2_DEBUG_ppeFilmGrain;				};
	if(X39_MS2_DEBUG_ppeChromAberration != -1)	then {_ppeChromAberration = X39_MS2_DEBUG_ppeChromAberration;	};
	if(X39_MS2_DEBUG_ppeGreyScreen != -1)		then {_ppeGreyScreen = X39_MS2_DEBUG_ppeGreyScreen;				};
	if(X39_MS2_DEBUG_redScreenAlpha != -1)		then {_redScreenAlpha = X39_MS2_DEBUG_redScreenAlpha;			};
	if(X39_MS2_DEBUG_cfnDisableFatigue != -1)	then {_cfnDisableFatigue = X39_MS2_DEBUG_cfnDisableFatigue;		};
	if(X39_MS2_DEBUG_cfnForceWalk != -1)		then {_cfnForceWalk = X39_MS2_DEBUG_cfnForceWalk;				};
};