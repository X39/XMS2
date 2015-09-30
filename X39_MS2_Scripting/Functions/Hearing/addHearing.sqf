#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Changes units hearing value
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to add
 * @Return - SCALAR - Current pain of the unit
 */
if(!X39_MS2_var_Feature_EnableHearing) exitWith {};
FORCELOCAL(_this select 0);
private["_hearing"];
_hearing = [(_this select 0), 0] call X39_MS2_fnc_getHearing;
_hearing = _hearing + ((_this select 1) * X39_MS2_var_Hearing_GlobalModificator);
if(_hearing > 1) then
{
	_hearing = 1;
}
else
{
	if(_hearing < 0) then
	{
		_hearing = 0;
	};
};
[_this select 0, _hearing] call X39_MS2_fnc_setHearing;
_hearing