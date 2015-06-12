#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will add given value to given units CprCount value
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to add
 * @Return - SCALAR - Current CprCount of the unit
 */
if(!X39_MS2_var_Feature_EnableAdrenaline) exitWith {};
FORCELOCAL(_this select 0);
private["_count"];
_count = ([(_this select 0)] call X39_MS2_fnc_getCprCount) + (_this select 1);
if(_count > 5 / (_unit getVariable "X39_MS2_var_Internal_ticker_minTickRate")) then
{
	_count = 5 / (_unit getVariable "X39_MS2_var_Internal_ticker_minTickRate");
};
if(_count < 0) then
{
	_count = 0;
};
[_this select 0, _count] call X39_MS2_fnc_setCprCount;
_count