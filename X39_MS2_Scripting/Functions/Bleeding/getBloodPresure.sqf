#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * returns the blood presure value
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - SCALAR - Calculated blood presure
 */
if(!X39_MS2_var_Feature_EnableBlood) exitWith {false};
private["_unit", "_returnValue"];
_unit = (_this select 0);
_returnValue = ((([_unit] call X39_MS2_fnc_getBlood) / X39_MS2_var_Bleeding_maxBloodInEntireBody) * ([_unit] call X39_MS2_fnc_getClotting)) * X39_MS2_var_Bleeding_NaturalMaxOfBloodPresure;
_returnValue