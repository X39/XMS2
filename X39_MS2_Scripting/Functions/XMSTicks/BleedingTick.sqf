#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	XMSTick Handler
 *	Description will not be available as this is not intended to be callen by anyone but the XMSTicker
 *	Available parent variables:
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeDynamicBlur")			- range 0 - 1 | ammount of blur over entire screen
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeRadialBlur")			- range 0 - 1 | ammount of blur (needs (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFocus") to actually work)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFocus")				- range 0 - 1 | how focused the player will be (where 0 is not focused and 1 is full focus) (needs (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeRadialBlur") to actually work)
 *		X39_MS2_var_Internal_Ticker(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFilmGrain")			- range 0 - 1 | how strong the film grain effect will be (confusion)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeChromAberration")		- range 0 - 1 | how strong the chromAberration will be (see things twice>)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeGreyScreen")			- range 0 - 1 | 0 means normal 1 means totally grey
 *	
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_cfnDisableFatigue")		- range 0 - n | >0 will disable fatigue
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_cfnForceWalk")			- range 0 - n | >0 will force walk
 *	
 *	@Param1 - OBJECT - Unit
 *	@Param2 - SCALAR - HandleID
 *	@Return - NA
 */
if(!X39_MS2_var_Feature_EnableBlood) exitWith {};
private["_unit", "_handleID", "_bloodP", "_bloodPresure"];
_unit = _this select 0;
//_handleID = _this select 1;
//Perform autoBleedingCure if enabled & damage not aterial
if(X39_MS2_var_Bleeding_EnableBleedingCure) then
{
	{
		if(X39_MS2_var_Bleeding_AllowBleedingCureWhenAterieDamaged || {(if(_x select HITZONE_HasAterie && {[_unit, _x select HITZONE_NAME] call X39_MS2_fnc_getAterialDamage}) then {false} else {true})}) then
		{
			[_unit, -(missionNamespace getVariable format["X39_MS2_var_Bleeding_BleedingCurePerTick%1", _x select HITZONE_NAME])] call (missionNamespace getVariable format["X39_MS2_fnc_addBleedingTo%1", _x select HITZONE_NAME]);
		};
		false
	}count X39_MS2_var_Internal_HitZones;
};
//Let the body bleed out with current bleedOut rate
[_unit, -([_unit] call X39_MS2_fnc_getCurrentBleeding)] call X39_MS2_fnc_addBlood;
if(X39_MS2_var_Bleeding_LowBloodFeatures) then
{
	_bloodP = ([_unit] call X39_MS2_fnc_getBlood) / X39_MS2_var_Bleeding_maxBloodInEntireBody;
	if(_bloodP <= X39_MS2_var_Bleeding_knockOutAtPBlood) then
	{
		if(_bloodP <= X39_MS2_var_Bleeding_killAtPBlood) then
		{
			DEBUG_LOG_WFn_SC(format["Killing '%1' because ([_bloodP => %2] < [X39_MS2_var_Bleeding_killAtPBlood => %3])" COMMA _unit COMMA _bloodP COMMA X39_MS2_var_Bleeding_killAtPBlood])
			[_unit] call X39_MS2_fnc_killUnit;
		}
		else
		{
			[_unit, 2, -1, localize "STR_X39_MS2_Scripting_XMSTicks_BleedingTick_KnockOutDueLowBlood", "BleedingTick_BloodValue", {(([_this select 0] call X39_MS2_fnc_getBlood) / X39_MS2_var_Bleeding_maxBloodInEntireBody) <= X39_MS2_var_Bleeding_knockOutAtPBlood}] call X39_MS2_fnc_blackOutUnit;
		};
	};
};
if(X39_MS2_var_Bleeding_EnableBloodPresureForBleedingTick) then
{
	_bloodPresure = ([_unit] call X39_MS2_fnc_getBloodPresure) / X39_MS2_var_Bleeding_NaturalMaxOfBloodPresure;
	if(_bloodPresure <= X39_MS2_var_Bleeding_knockOutAtPBloodPresureLowerEnd || _bloodPresure >= X39_MS2_var_Bleeding_knockOutAtPBloodPresureUpperEnd) then
	{
		if(X39_MS2_var_Bleeding_BloodPresureCanKill && {_bloodPresure <= X39_MS2_var_Bleeding_killAtPBloodPresureLowerEnd || _bloodPresure >= X39_MS2_var_Bleeding_killAtPBloodPresureUpperEnd}) then
		{
			DEBUG_LOG_WFn_SC(format["Killing '%1' because ([X39_MS2_var_Bleeding_BloodPresureCanKill == %4] && {[_bloodPresure => %2] <= [X39_MS2_var_Bleeding_killAtPBloodPresureLowerEnd => %3] || [_bloodPresure => %2] >= [X39_MS2_var_Bleeding_killAtPBloodPresureUpperEnd => %5]})" COMMA _unit COMMA _bloodPresure COMMA X39_MS2_var_Bleeding_killAtPBloodPresureLowerEnd COMMA X39_MS2_var_Bleeding_BloodPresureCanKill COMMA X39_MS2_var_Bleeding_killAtPBloodPresureUpperEnd])
			[_unit] call X39_MS2_fnc_killUnit;
		}
		else
		{
			[_unit, 2, -1, localize (if(_bloodPresure <= X39_MS2_var_Bleeding_knockOutAtPBloodPresureLowerEnd) then {"STR_X39_MS2_Scripting_XMSTicks_BleedingTick_KnockOutDueBloodPresureLow"} else {"STR_X39_MS2_Scripting_XMSTicks_BleedingTick_KnockOutDueBloodPresureHigh"}), "BleedingTick_BloodPresure", {private["_bp"]; _bp = (([_this select 0] call X39_MS2_fnc_getBloodPresure) / X39_MS2_var_Bleeding_NaturalMaxOfBloodPresure); (_bp <= X39_MS2_var_Bleeding_knockOutAtPBloodPresureLowerEnd || _bp >= X39_MS2_var_Bleeding_knockOutAtPBloodPresureUpperEnd)}] call X39_MS2_fnc_blackOutUnit;
		};
	};
};