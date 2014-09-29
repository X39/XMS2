#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will return the correct color code for the given damage
 * 
 * @Param1 - SCALAR - Current damage
 * @Param2 - SCALAR - Max damage
 * @Return - ARRAY - RGBA Color array [R, G, B, A]
 */
private["_calcValue", "_red", "_green", "_blue", "_type"];
_type = profileNamespace getVariable ["X39_MS2_options_medicalUi_HitMenuColorType", 1];
if(_type == 1) exitWith
{	//GreenToRed
	_calcValue = (_this select 0) / (_this select 1);
	if(_calcValue > 1) exitWith {[1, 0, 0, 1]};
	_red = _calcValue;
	_green = 1 - _calcValue;
	_blue = 0;
	if(_red < 0) then { _red = 0; }; if(_red > 1) then { _red = 1; };
	if(_green < 0) then { _green = 0; }; if(_green > 1) then { _green = 1; };
	[_red, _green, 0, 1]
};
if(_type == 2) exitWith
{	//WhiteToRed
	_calcValue = 1 - ((_this select 0) / (_this select 1));
	if(_calcValue > 1) exitWith {[1, 0, 0, 1]};
	_red = 1;
	_green = _calcValue;
	_blue = _calcValue;
	[_red, _green, _blue, 1]
};
if(_type == 3) exitWith
{	//WhiteToBlack
	_calcValue = 1 - ((_this select 0) / (_this select 1));
	if(_calcValue > 1) exitWith {[0, 0, 0, 1]};
	_red = _calcValue;
	_green = _calcValue;
	_blue = _calcValue;
	[_red, _green, _blue, 1]
};