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
if(X39_MS2_DEBUG_enable && _unit == player) then
{
	displayCtrl_Overlay(1072) ctrlShow X39_MS2_DEBUG_enable;
	displayCtrl_Overlay(1073) ctrlShow (X39_MS2_DEBUG_enable && !isNull cursorTarget && {[cursorTarget] call X39_MS2_fnc_isUnitXMS2Unit});
	{
		private["_txt", "_i"];
		_txt = name (_x select 0);
		for "_i" from 0 to ((count X39_MS2_var_Internal_HitZones) - 1) do
		{
			_txt = format["%1<br />--%2--", _txt, X39_MS2_var_Internal_HitZones select _i select HITZONE_NAME];
			_txt = format["%1<br />%2 DMG", _txt, str ([_this select 0] call (missionNamespace getVariable format["X39_MS2_fnc_getDamageOf%1", X39_MS2_var_Internal_HitZones select _i select HITZONE_NAME]))];
			_txt = format["%1<br />%2 BLD", _txt, str ([_this select 0] call (missionNamespace getVariable format["X39_MS2_fnc_getBleedingOf%1", X39_MS2_var_Internal_HitZones select _i select HITZONE_NAME]))];
		};
		_txt = format["%1<br /><br />%2 Fatigue", _txt, str (getFatigue (_this select 0))];
		_txt = format["%1<br />%2 enableFatigue", _txt, str (_cfnDisableFatigue > 0)];
		_txt = format["%1<br />%2 forceWalk", _txt, str (_cfnForceWalk > 0)];
		_txt = format["%1<br />%2 Pulse", _txt, str ([_this select 0] call X39_MS2_fnc_getHeartPulse)];
		_txt = format["%1<br />%2 Temperature", _txt, str ([_this select 0] call X39_MS2_fnc_getTemperature)];
		_txt = format["%1<br />%2 Pain", _txt, str ([_this select 0] call X39_MS2_fnc_getPain)];
		_txt = format["%1<br />%2 Blood", _txt, str ([_this select 0] call X39_MS2_fnc_getBlood)];
		_txt = format["%1<br />%2 BloodPresure", _txt, str ([_this select 0] call X39_MS2_fnc_getBloodPresure)];
		_txt = format["%1<br />%2 Hearing", _txt, str ([_this select 0] call X39_MS2_fnc_getHearing)];
		_txt = format["%1<br />%2 Distraction", _txt, str ([_this select 0] call X39_MS2_fnc_getDistraction)];
		_txt = format["%1<br />%2 Adrenaline", _txt, str ([_this select 0] call X39_MS2_fnc_getAdrenaline)];
		_txt = format["%1<br />%2 Morphine", _txt, str ([_this select 0] call X39_MS2_fnc_getMorphine)];
		_txt = format["%1<br />%2 Naloxone", _txt, str ([_this select 0] call X39_MS2_fnc_getNaloxone)];
		displayCtrl_Overlay(_x select 1) ctrlSetStructuredText parseText _txt;
		false
	}count [[_unit, 1072], [cursorTarget, 1073]];
	
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