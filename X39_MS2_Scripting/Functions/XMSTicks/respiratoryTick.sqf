#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	XMSTick Handler
 *	Description will not be available as this is not intended to be callen by anyone but the XMSTicker
 *	Available parent variables:
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeDynamicBlur")				- range 0 - 1 | amount of blur over entire screen
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeRadialBlur")				- range 0 - 1 | amount of blur (needs (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFocus") to actually work)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFocus")						- range 0 - 1 | how focused the player will be (where 0 is not focused and 1 is full focus) (needs (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeRadialBlur") to actually work)
 *		X39_MS2_var_Internal_Ticker(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFilmGrain")					- range 0 - 1 | how strong the film grain effect will be (confusion)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeChromAberration")			- range 0 - 1 | how strong the chromAberration will be (see things twice>)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeGreyScreen")				- range 0 - 1 | 0 means normal 1 means totally grey
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeWetDisort_LeftStrength")	- range ? - ? | something unknown magic
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeWetDisort_RightStrength")	- range ? - ? | something unknown magic
 *	
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_cfnDisableFatigue")			- range 0 - n | >0 will disable fatigue
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_cfnForceWalk")					- range 0 - n | >0 will force walk
 *
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_blackOutStage")				- get variable! Contains blackOutStage at the beginning of the tickCircle
 *	
 *	@Param1 - OBJECT - Unit
 *	@Param2 - SCALAR - HandleID
 *	@Return - NA
 */
MT_START
private["_unit", "_currentRespiratory", "_changeRespiratory"];
_unit = _this select 0;
_currentRespiratory = [_unit] call X39_MS2_fnc_getRespiratory;

_changeRespiratory = X39_MS2_var_Respiratory_NormalChangePerTick;
if((_unit getVariable "X39_MS2_var_Internal_Ticker_blackOutStage") >= 1 && {!([_unit] call X39_MS2_fnc_getBagvalveMask) || ([_unit] call X39_MS2_fnc_getArrestPresent) || ([_unit] call X39_MS2_fnc_getToungeBlocking)}) then
{
	_changeRespiratory = X39_MS2_var_Respiratory_NoBeathingChangePerTick;
};


if(_currentRespiratory <= X39_MS2_var_Respiratory_RespiratoryArrestPointP * X39_MS2_var_Respiratory_maxValue) then
{
	if(_currentRespiratory <= X39_MS2_var_Respiratory_FlatLinePointP * X39_MS2_var_Respiratory_maxValue) then
	{
		[_unit, time] call X39_MS2_fnc_setFlatLine;
	}
	else
	{
		[_unit, true] call X39_MS2_fnc_setArrestPresent;
	};
};

if(_changeRespiratory != 0) then
{
	[_unit, _changeRespiratory] call X39_MS2_fnc_addRespiratory;
};
MT_END
MT_DEBUG(_times pushBack [_fnc_scriptName COMMA MT_TIME])