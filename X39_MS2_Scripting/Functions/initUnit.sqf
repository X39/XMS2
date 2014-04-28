#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	Initializes a unit
 *	!WARNING!
 *	Depending on if the unit is still in JIP or not this can and will lead in unexpected
 *	behaviour when other initialization methods are also used!
 *	Please only call this function if you KNOW what youre doing!
 *	
 *	Errors will use https://community.bistudio.com/wiki/throw
 *	
 *	Function supports tryCatch for errors (warnings will be ignored)
 *	
 *	@Param1 - OBJECT - Unit to initialize
 *	@Return - NA
 */
private["_unit", "_resetEffects"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_resetEffects = false;

if(!ISOBJECT(_unit)) exitWith
{
	PRINT_ERROR(EX_INV_ARG);
	throw EX_INF_ARG;
};
if(_unit getVariable ["X39_MS2_var_UnitInitialized", false]) then
{
	PRINT_WARNING(EX_INV_ARG);
}
else
{
	//initialize variables
	{
		_unit setVariable[_x select 0, [] call (_x select 1), true];
	}count X39_MS2_var_Internal_UnitVariables;
	//set triggers
	if((_unit getVariable ["X39_MS2_var_EH_HandleDamage", -1]) == -1)	then { _unit setVariable["X39_MS2_var_EH_HandleDamage", _unit addEventHandler["HandleDamage", {_this call X39_MS2_fnc_cb_HandleDamage}], true];	};
	if((_unit getVariable ["X39_MS2_var_EH_FiredNear", -1]) == -1)	then { _unit setVariable["X39_MS2_var_EH_FiredNear", _unit addEventHandler["FiredNear", {_this call X39_MS2_fnc_cb_FiredNear}], true];			};
	if((_unit getVariable ["X39_MS2_var_EH_Explosion", -1]) == -1)	then { _unit setVariable["X39_MS2_var_EH_Explosion", _unit addEventHandler["Explosion", {_this call X39_MS2_fnc_cb_Explosion}], true];			};
	_unit setVariable ["X39_MS2_var_UnitInitialized", true];
	[_unit, "X39_MS2_fnc_runTicker", _unit, false] spawn BIS_fnc_MP;
};
//Initialize ppEffects if current entity hasInterface and they are -1
if(hasInterface && {_unit == player}) then
{
	if(X39_MS2_var_Internal_ppe_radialBlur == -1) then
	{
		_resetEffects = true;
		X39_MS2_var_Internal_ppe_radialBlur = ppEffectCreate ["radialBlur", 470];
		X39_MS2_var_Internal_ppe_radialBlur ppEffectEnable true;
	};
	if(X39_MS2_var_Internal_ppe_chromAberration == -1) then
	{
		_resetEffects = true;
		X39_MS2_var_Internal_ppe_chromAberration = ppEffectCreate ["chromAberration", 5010];
		X39_MS2_var_Internal_ppe_chromAberration ppEffectEnable true;
	};
	if(X39_MS2_var_Internal_ppe_wetDistortion == -1) then
	{
		_resetEffects = true;
		X39_MS2_var_Internal_ppe_wetDistortion = ppEffectCreate ["wetDistortion", 1140];
		X39_MS2_var_Internal_ppe_wetDistortion ppEffectEnable true;
	};
	if(X39_MS2_var_Internal_ppe_colorCorrections == -1) then
	{
		_resetEffects = true;
		X39_MS2_var_Internal_ppe_colorCorrections = ppEffectCreate ["colorCorrections", 1160];
		X39_MS2_var_Internal_ppe_colorCorrections ppEffectEnable true;
	};
	if(X39_MS2_var_Internal_ppe_dynamicBlur == -1) then
	{
		_resetEffects = true;
		X39_MS2_var_Internal_ppe_dynamicBlur = ppEffectCreate ["dynamicBlur", 460];
		X39_MS2_var_Internal_ppe_dynamicBlur ppEffectEnable true;
	};
	if(X39_MS2_var_Internal_ppe_filmGrain == -1) then
	{
		_resetEffects = true;
		X39_MS2_var_Internal_ppe_filmGrain = ppEffectCreate ["filmGrain", 2060];
		X39_MS2_var_Internal_ppe_filmGrain ppEffectEnable true;
	};
	if(X39_MS2_var_Internal_ppe_colorInversion == -1) then
	{
		_resetEffects = true;
		X39_MS2_var_Internal_ppe_colorInversion = ppEffectCreate ["colorInversion", 2510];
		X39_MS2_var_Internal_ppe_colorInversion ppEffectEnable true;
	};
	if(_resetEffects) then
	{
		[] call X39_MS2_fnc_resetPPEffects;
	};
	[] call X39_MS2_fnc_overlay_createDisplay;
	
	if(X39_MS2_var_Internal_deh_keyDown == -1) then
	{
		X39_MS2_var_Internal_deh_keyDown = (findDisplay 46) displayAddEventHandler["KeyDown", "_this call X39_MS2_fnc_cb_KeyDown;"];
	};
};
