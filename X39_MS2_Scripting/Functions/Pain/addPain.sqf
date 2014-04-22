#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will add given value to given units pain value
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to add
 * @Return - SCALAR - Current pain of the unit
 */
if(!X39_MS2_var_Feature_EnablePain) exitWith {};
private["_pain"];
_pain = [(_this select 0)] call X39_MS2_fnc_getPain;
_pain = _pain + ((_this select 1) * X39_MS2_var_Pain_GlobalModificator);
[_this select 0, _pain] call X39_MS2_fnc_setPain;
_pain