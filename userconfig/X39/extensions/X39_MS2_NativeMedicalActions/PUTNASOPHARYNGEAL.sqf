#include "\X39_MS2_Scripting\default.hpp"
[
	"PUTNASOPHARYNGEAL",
	"STR_X39_MS2_Scripting_MedicalUiActions_Nasopharyngeal_ActionNamePut",
	"",
	{(("x39_xms2_nasopharyngeal" in items (_this select 0)) || ("x39_xms2_nasopharyngeal" in items (_this select 1))) && !([_this select 1] call X39_MS2_fnc_getBagvalveMask) && {([_this select 1] call X39_MS2_fnc_isBlackedOut) && {!([_this select 1] call X39_MS2_fnc_getNasopharyngeal)}}},
	{
		if ("x39_xms2_nasopharyngeal" in items (_this select 1)) then
		{
			[(_this select 1), '(_this select 0) removeItem "x39_xms2_nasopharyngeal"', [_this select 1]] call X39_XLib_fnc_executeLocalToUnit;
		}
		else
		{
			[(_this select 0), '(_this select 0) removeItem "x39_xms2_nasopharyngeal"', [_this select 0]] call X39_XLib_fnc_executeLocalToUnit;
		};
		[_this select 1, true] call X39_MS2_fnc_setNasopharyngeal;
		[(_this select 1), -2, nil, nil, "NASOPHARYNGEAL", {[_this select 0] call X39_MS2_fnc_getNasopharyngeal}] call X39_MS2_fnc_blackOutUnit;
	},
	"PUTNASOPHARYNGEAL",
	8
] call X39_MS2_fnc_registerAction;
true
