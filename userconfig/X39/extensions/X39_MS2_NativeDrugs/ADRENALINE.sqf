#include "\X39_MS2_Scripting\default.hpp"
[
	"ADRENALINE",
	"STR_X39_MS2_Scripting_Drugs_Adrenaline_Name",
	"\X39_MS2_Resources\Items\Injector\Injector_thumb.paa",
	{("x39_xms2_adrenaline" in items (_this select 0)) || ("x39_xms2_adrenaline" in items (_this select 1))},
	{if ("x39_xms2_adrenaline" in items (_this select 1)) then {[(_this select 1), '(_this select 0)  removeItem "x39_xms2_adrenaline"', [_this select 1]] call X39_XLib_fnc_executeLocalToUnit;} else {[(_this select 0), '(_this select 0)  removeItem "x39_xms2_adrenaline"', [_this select 0]] call X39_XLib_fnc_executeLocalToUnit;};},
	{[(_this select 1), X39_MS2_var_Drugs_Adrenaline_AdrenalineChangeOnConsume * (_this select 2)] call X39_MS2_fnc_addAdrenaline;},
	{(_this select 0) addItem "x39_xms2_adrenaline"},
	"ADRENALINE"
] call X39_MS2_fnc_registerDrug;
true
