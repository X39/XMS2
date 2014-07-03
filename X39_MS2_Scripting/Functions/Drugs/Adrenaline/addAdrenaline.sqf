#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will add given value to given units adrenaline value
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to add
 * @Param3 - BOOL - use natural limit
 * @Return - SCALAR - Current adrenaline of the unit
 */
if(!X39_MS2_var_Feature_EnableAdrenaline) exitWith {};
FORCELOCAL(_this select 0);
private["_adrenaline", "_max"];
_adrenaline = [(_this select 0)] call X39_MS2_fnc_getAdrenaline;
_adrenaline = _adrenaline + ((_this select 1) * X39_MS2_var_Drugs_Adrenaline_AdrenalineGlobalMultiplicator);
_max = if(count _this >= 3 && {_this select 2}) then {X39_MS2_var_Drugs_Adrenaline_maxAdrenaline * X39_MS2_var_Drugs_Adrenaline_naturalAdrenalineP} else {X39_MS2_var_Drugs_Adrenaline_maxAdrenaline};
if(_adrenaline > _max) then
{
	_adrenaline = _max;
};
if(_adrenaline < 0) then
{
	_adrenaline = 0;
};
[_this select 0, _adrenaline] call X39_MS2_fnc_setAdrenaline;
_adrenaline