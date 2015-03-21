#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Changes units respiratory value by provided value
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to add
 * @Return - SCALAR - Current pain of the unit
 */
if(!X39_MS2_var_Respiratory_Enable) exitWith {};
FORCELOCAL(_this select 0);
private["_respiratory"];
_respiratory = [(_this select 0), 0] call X39_MS2_fnc_getRespiratory;
_respiratory = _respiratory + ((_this select 1) * X39_MS2_var_Respiratory_GlobalModificator);
if(_respiratory > X39_MS2_var_Respiratory_maxValue) then
{
	_respiratory = X39_MS2_var_Respiratory_maxValue;
}
else
{
	if(_respiratory < 0) then
	{
		_respiratory = 0;
	};
};
if(isNil("_isXms2TickCall")) then
{
	[_this select 0, _respiratory] call X39_MS2_fnc_setRespiratory;
}
else
{
	[_this select 0, _respiratory, _isXms2TickCall] call X39_MS2_fnc_setRespiratory;
};
_respiratory