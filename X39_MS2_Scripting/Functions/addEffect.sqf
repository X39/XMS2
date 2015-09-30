#include "\X39_MS2_Scripting\default.hpp"
/*
 *	adds new XMS effect to given unit
 *	
 *	@Param1 - OBJECT - Unit to apply the effect to
 *	@Param2 - SCALAR - Lifetime (max is defined in X39_MS2_var_Internal_XMSEffects_MaxLifetime)
 *	@Param3 - CODE - Code which shall be executed each tick (_this = [_unit, _timeLeft (range: 1 - 0)])
 *					 Available parent variables:
 *					 	(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeDynamicBlur")			- range 0 - 1 | ammount of blur over entire screen
 *					 	_ppeRadialBlur			- range 0 - 1 | ammount of blur (needs _ppeFocus to actually work)
 *					 	_ppeFocus				- range 0 - 1 | how focused the player will be (where 0 is not focused and 1 is full focus) (needs _ppeRadialBlur to actually work)
 *					 	_ppeFilmGrain			- range 0 - 1 | how strong the film grain effect will be (confusion)
 *					 	_ppeChromAberration		- range 0 - 1 | how strong the chromAberration will be (see things twice>)
 *					 	_ppeGreyScreen			- range 0 - 1 | 0 means normal 1 means totally grey
 *					 
 *					 	_cfnDisableFatigue		- range 0 - n | >0 will disable fatigue
 *					 	_cfnForceWalk			- range 0 - n | >0 will force walk
 *	@Return - N/A
 *	@Author - X39
 */
private["_effectArray", "_index"];
params [
	["_units", objNull, [objNull]],
	["_lifetime", -1, [0]],
	["_code","", [{}, ""]]
];

if(isNull _unit) exitWith {PRINT_ERROR("Please provide a valid unit!");};
if(_lifetime < 1) exitWith {PRINT_ERROR("XMSEffect lifetime needs to be larger then 0!");};
if(_lifetime > X39_MS2_var_Internal_XMSEffects_MaxLifetime) exitWith {PRINT_ERROR("XMSEffect lifetime exceeds X39_MS2_var_Internal_XMSEffects_MaxLifetime!");};
if(ISCHARP(_code) && {_code == ""}) exitWith {PRINT_ERROR(""""" is no valid code!");};
if(ISCHARP(_code)) then {_code = compile _code;};

_effectArray = _unit getVariable ["X39_MS2_var_Internal_XMSEffects", []];
_index = _effectArray find -1;
if(_index == -1) then
{
	_index = count _effectArray;
};
_effectArray set[_index, [_lifetime, _lifetime, _code]];
_unit setVariable["X39_MS2_var_Internal_XMSEffects", _effectArray];