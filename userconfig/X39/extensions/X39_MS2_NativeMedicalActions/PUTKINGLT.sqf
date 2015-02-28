#include "\X39_MS2_Scripting\default.hpp"
[
	"PUTKINGLT",
	"STR_X39_MS2_Scripting_MedicalUiActions_KingLt_ActionNamePut",
	"",
	{(("x39_xms2_kinglt" in items (_this select 0)) || ("x39_xms2_kinglt" in items (_this select 1))) && !([_this select 1] call X39_MS2_fnc_getBagvalveMask) && {([_this select 1] call X39_MS2_fnc_isBlackedOut) && {!([_this select 1] call X39_MS2_fnc_getkingLt)}}},
	{
		if ("x39_xms2_kinglt" in items (_this select 1)) then
		{
			[(_this select 1), '(_this select 0) removeItem "x39_xms2_kinglt"', [_this select 1]] call X39_XLib_fnc_executeLocalToUnit;
		}
		else
		{
			[(_this select 0), '(_this select 0) removeItem "x39_xms2_kinglt"', [_this select 0]] call X39_XLib_fnc_executeLocalToUnit;
		};
		[_this select 1, true] call X39_MS2_fnc_setkingLt;
		[(_this select 1), -2, nil, nil, "KINGLT", {[_this select 0] call X39_MS2_fnc_getkingLt}] call X39_MS2_fnc_blackOutUnit;
	},
	"PUTKINGLT",
	8
] call X39_MS2_fnc_registerAction;
true
