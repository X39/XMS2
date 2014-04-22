#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will add given value to given units adrenaline value
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to add
 * @Return - SCALAR - Current adrenaline of the unit
 */
if(!X39_MS2_var_Feature_EnableAdrenaline) exitWith {};
private["_adrenaline"];
_adrenaline = [(_this select 0)] call X39_MS2_fnc_getAdrenaline;
_adrenaline = _adrenaline + ((_this select 1) * X39_MS2_var_Adrenaline_AdrenalineGlobalMultiplicator);
if(_adrenaline > X39_MS2_var_Adrenaline_maxAdrenaline) then
{
	_adrenaline = X39_MS2_var_Adrenaline_maxAdrenaline;
};
if(_adrenaline < 0) then
{
	_adrenaline = 0;
};
[_this select 0, _adrenaline] call X39_MS2_fnc_setAdrenaline;
_adrenaline