#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	XMSTick Handler
 *	Special debug tick which will only be applied if XMS is in nonRelease mode
 *	Available parent variables:
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeDynamicBlur")		- range 0 - 1 | ammount of blur over entire screen
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeRadialBlur")			- range 0 - 1 | ammount of blur (needs (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFocus") to actually work)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFocus")				- range 0 - 1 | how focused the player will be (where 0 is not focused and 1 is full focus) (needs (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeRadialBlur") to actually work)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFilmGrain")			- range 0 - 1 | how strong the film grain effect will be (confusion)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeChromAberration")	- range 0 - 1 | how strong the chromAberration will be (see things twice>)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeGreyScreen")			- range 0 - 1 | 0 means normal 1 means totally grey
 *	
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_cfnDisableFatigue")		- range 0 - n | >0 will disable fatigue
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_cfnForceWalk")			- range 0 - n | >0 will force walk
 *	
 *	@Param1 - OBJECT - Unit
 *	@Param2 - SCALAR - HandleID
 *	@Return - NA
 */
MT_START
private["_unit", "_handleID"];
_unit = _this select 0;
_handleID = _this select 1;
if(X39_MS2_DEBUG_enable && isPlayer _unit) then
{
	displayCtrl_Overlay(1072) ctrlShow X39_MS2_DEBUG_enable;
	displayCtrl_Overlay(1073) ctrlShow (X39_MS2_DEBUG_enable && !isNull cursorTarget && {[cursorTarget] call X39_MS2_fnc_isUnitXMS2Unit});
	{
		private["_txt", "_i"];
		_txt = name (_x select 0);
		for "_i" from 0 to ((count X39_MS2_var_Internal_HitZones) - 1) do
		{
			_txt = format["%1<br />--%2--", _txt, X39_MS2_var_Internal_HitZones select _i select HITZONE_NAME];
			_txt = format["%1<br />%2 DMG", _txt, ([_x select 0] call (missionNamespace getVariable format["X39_MS2_fnc_getDamageOf%1", X39_MS2_var_Internal_HitZones select _i select HITZONE_NAME]))];
			_txt = format["%1<br />%2 BLD", _txt, ([_x select 0] call (missionNamespace getVariable format["X39_MS2_fnc_getBleedingOf%1", X39_MS2_var_Internal_HitZones select _i select HITZONE_NAME]))];
		};
		_txt = format["%1<br /><br />%2 Fatigue", _txt, (getFatigue (_x select 0))];
		_txt = format["%1<br />%2 enableFatigue", _txt, ((_unit getVariable "X39_MS2_var_Internal_Ticker_cfnDisableFatigue") > 0)];
		_txt = format["%1<br />%2 forceWalk", _txt, ((_unit getVariable "X39_MS2_var_Internal_Ticker_cfnForceWalk") > 0)];
		_txt = format["%1<br />%2 Pulse", _txt, ([_x select 0] call X39_MS2_fnc_getHeartPulse)];
		_txt = format["%1<br />%2 Temperature", _txt, ([_x select 0] call X39_MS2_fnc_getTemperature)];
		_txt = format["%1<br />%2 Pain", _txt, ([_x select 0] call X39_MS2_fnc_getPain)];
		_txt = format["%1<br />%2 Blood", _txt, ([_x select 0] call X39_MS2_fnc_getBlood)];
		_txt = format["%1<br />%2 BloodPresure", _txt, ([_x select 0] call X39_MS2_fnc_getBloodPresure)];
		_txt = format["%1<br />%2 (%3) BloodClotting", _txt, ([_x select 0, true] call X39_MS2_fnc_getClotting), ([_x select 0] call X39_MS2_fnc_getClotting)];
		_txt = format["%1<br />%2 Hearing", _txt, ([_x select 0] call X39_MS2_fnc_getHearing)];
		_txt = format["%1<br />%2 Distraction", _txt, ([_x select 0] call X39_MS2_fnc_getDistraction)];
		_txt = format["%1<br />%2 (%3) Adrenaline", _txt, ([_x select 0, true] call X39_MS2_fnc_getAdrenaline), ([_x select 0] call X39_MS2_fnc_getAdrenaline)];
		_txt = format["%1<br />%2 (%3) Morphine", _txt, ([_x select 0, true] call X39_MS2_fnc_getMorphine), ([_x select 0] call X39_MS2_fnc_getMorphine)];
		_txt = format["%1<br />%2 (%3) Naloxone", _txt, ([_x select 0, true] call X39_MS2_fnc_getNaloxone), ([_x select 0] call X39_MS2_fnc_getNaloxone)];
		_txt = format["%1<br />%2 Wetness", _txt, [_x select 0] call X39_MS2_fnc_getWetness];
		displayCtrl_Overlay(_x select 1) ctrlSetStructuredText parseText _txt;
		false
	}count [[_unit, 1072], [cursorTarget, 1073]];
	
	if(X39_MS2_DEBUG_ppeDynamicBlur != -1)		then {_unit setVariable["X39_MS2_var_Internal_Ticker_ppeDynamicBlur", X39_MS2_DEBUG_ppeDynamicBlur];				};
	if(X39_MS2_DEBUG_ppeRadialBlur != -1)			then {_unit setVariable["X39_MS2_var_Internal_Ticker_ppeRadialBlur", X39_MS2_DEBUG_ppeRadialBlur];				};
	if(X39_MS2_DEBUG_ppeFocus != -1)				then {_unit setVariable["X39_MS2_var_Internal_Ticker_ppeFocus", X39_MS2_DEBUG_ppeFocus];							};
	if(X39_MS2_DEBUG_ppeFilmGrain != -1)			then {_unit setVariable["X39_MS2_var_Internal_Ticker_ppeFilmGrain", X39_MS2_DEBUG_ppeFilmGrain];					};
	if(X39_MS2_DEBUG_ppeChromAberration != -1)	then {_unit setVariable["X39_MS2_var_Internal_Ticker_ppeChromAberration", X39_MS2_DEBUG_ppeChromAberration];	};
	if(X39_MS2_DEBUG_ppeGreyScreen != -1)			then {_unit setVariable["X39_MS2_var_Internal_Ticker_ppeGreyScreen", X39_MS2_DEBUG_ppeGreyScreen];				};
	if(X39_MS2_DEBUG_redScreenAlpha != -1)		then {_unit setVariable["X39_MS2_var_Internal_Ticker_redScreenAlpha", X39_MS2_DEBUGredScreenAlpha];				};
	if(X39_MS2_DEBUG_cfnDisableFatigue != -1)		then {_unit setVariable["X39_MS2_var_Internal_Ticker_cfnDisableFatigue", X39_MS2_DEBUGcfnDisableFatigue];		};
	if(X39_MS2_DEBUG_cfnForceWalk != -1)			then {_unit setVariable["X39_MS2_var_Internal_Ticker_cfnForceWalk", X39_MS2_DEBUGcfnForceWalk]	;					};
};
MT_END
MT_DEBUG(_times pushBack [_fnc_scriptName COMMA MT_TIME])