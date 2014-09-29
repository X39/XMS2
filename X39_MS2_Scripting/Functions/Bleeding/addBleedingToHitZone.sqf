#define ALTERNATIVEDEBUGOUTPUT
#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will add given value to given unit for the BODY hitzone
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to add
 * @Return - SCALAR - Current Bleeding of the unit
 */
if(!(missionNamespace getVariable "X39_MS2_var_Bleeding_EnableHitzone%1")) exitWith {};
FORCELOCAL(_this select 0);
private["_Bleeding"];
_Bleeding = [(_this select 0)] call (missionNamespace getVariable "X39_MS2_fnc_getBleedingOf%1");
_Bleeding = _Bleeding + (((_this select 1) * (missionNamespace getVariable "X39_MS2_var_Bleeding_%1Modificator")) * X39_MS2_var_Bleeding_GlobalModificator);
if(_Bleeding > (missionNamespace getVariable "X39_MS2_var_Bleeding_maxBleeding%1")) then
{
	_Bleeding = (missionNamespace getVariable "X39_MS2_var_Bleeding_maxBleeding%1");
}
else
{
	if(_Bleeding < 0) then
	{
		_Bleeding = 0;
	};
};
[_this select 0, _Bleeding] call (missionNamespace getVariable "X39_MS2_fnc_setBleedingOf%1");
_Bleeding