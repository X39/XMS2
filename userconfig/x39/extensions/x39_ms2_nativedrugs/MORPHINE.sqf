#include "\X39_MS2_Scripting\default.hpp"
[
	"MORPHINE",
	"STR_X39_MS2_Scripting_Drugs_Morphine_Name",
	"\X39_MS2_Resources\Items\Injector\InjectorInv_thumb.paa",
	{("x39_xms2_morphine" in items (_this select 0)) || ("x39_xms2_morphine" in items (_this select 1))},
	{if ("x39_xms2_morphine" in items (_this select 1)) then {[(_this select 1), '(_this select 0)  removeItem "x39_xms2_morphine"', [_this select 1]] call X39_XLib_fnc_executeLocalToUnit;} else {[(_this select 0), '(_this select 0)  removeItem "x39_xms2_morphine"', [_this select 0]] call X39_XLib_fnc_executeLocalToUnit;};},
	{[(_this select 1), X39_MS2_var_Drugs_Morphine_ChangeOnConsume * (_this select 2)] call X39_MS2_fnc_addMorphine;},
	{(_this select 0) addItem "x39_xms2_morphine"},
	"MORPHINE"
] call X39_MS2_fnc_registerDrug;
true
