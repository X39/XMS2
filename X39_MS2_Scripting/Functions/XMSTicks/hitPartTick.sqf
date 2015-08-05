#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	XMSTick Handler
 *	Description will not be available as this is not intended to be callen by anyone but the XMSTicker
 *	Available parent variables:
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeDynamicBlur")				- range 0 - 1 | ammount of blur over entire screen
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeRadialBlur")				- range 0 - 1 | ammount of blur (needs (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFocus") to actually work)
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
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_blackOutStage")				- get variable! Contains blackOutStage at the begining of the tickCircle
 *	
 *	@Param1 - OBJECT - Unit
 *	@Param2 - SCALAR - HandleID
 *	@Return - NA
 */
MT_START
private["_unit"];
_unit = _this select 0;
{
	if(_x getVariable ["X39_MS2_var_EH_HitPart", -1] == -1) then
	{
		_x setVariable["X39_MS2_var_EH_HitPart", _x addEventHandler["HitPart", X39_MS2_fnc_cb_hitPart], false];
	};
	false
} count X39_MS2_var_Internal_HitPart_InitializedUnits;
MT_END
MT_DEBUG(_times pushBack [_fnc_scriptName COMMA MT_TIME])