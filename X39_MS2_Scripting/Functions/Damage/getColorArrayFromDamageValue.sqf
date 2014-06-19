#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will return the correct color code for the given damage
 * 
 * @Param1 - SCALAR - Current damage
 * @Param2 - SCALAR - Max damage
 * @Return - ARRAY - RGBA Color array [R, G, B, A]
 */
private["_calcValue", "_red", "_green"];

_calcValue = (_this select 0) / (_this select 1);
if(_calcValue > 1) exitWith {[1, 0, 0, 1]};
_red = _calcValue;
_green = 1 - _calcValue;
if(_red < 0) then { _red = 0; }; if(_red > 1) then { _red = 1; };
if(_green < 0) then { _green = 0; }; if(_green > 1) then { _green = 1; };
[_red, _green, 0, 1]