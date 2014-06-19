#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will add given value to given unit for the LEGS hitzone
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to add
 * @Return - SCALAR - Current Bleeding of the unit
 */
if(!X39_MS2_var_Feature_EnableBlood) exitWith {};
FORCELOCAL(_this select 0);
private["_blood"];
_blood = [(_this select 0)] call X39_MS2_fnc_getBlood;
_blood = _blood + ((_this select 1) * X39_MS2_var_Bleeding_GlobalModificator);
if(_blood > X39_MS2_var_Bleeding_maxBloodInEntireBody) then
{
	_blood = X39_MS2_var_Bleeding_maxBloodInEntireBody;
}
else
{
	if(_blood < 0) then
	{
		_blood = 0;
	};
};
[_this select 0, _blood] call X39_MS2_fnc_setBlood;
_blood