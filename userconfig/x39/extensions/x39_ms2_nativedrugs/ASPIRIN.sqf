#include "\X39_MS2_Scripting\default.hpp"
[
	"ASPIRIN",
	"STR_X39_MS2_Scripting_Drugs_Aspirin_Name",
	"",
	{("x39_xms2_Aspirin" in items (_this select 0)) || ("x39_xms2_Aspirin" in items (_this select 1))},
	{if ("x39_xms2_Aspirin" in items (_this select 1)) then {[(_this select 1), '(_this select 0)  removeItem "x39_xms2_Aspirin"', [_this select 1]] call X39_XLib_fnc_executeLocalToUnit;} else {[(_this select 0), '(_this select 0)  removeItem "x39_xms2_Aspirin"', [_this select 0]] call X39_XLib_fnc_executeLocalToUnit;};},
	{[(_this select 1), X39_MS2_var_Drugs_Aspirin_ChangeOnConsume * (_this select 2)] call X39_MS2_fnc_addAspirin;},
	{(_this select 0) addItem "x39_xms2_Aspirin"},
	"ASPIRIN"
] call X39_MS2_fnc_registerDrug;
true
