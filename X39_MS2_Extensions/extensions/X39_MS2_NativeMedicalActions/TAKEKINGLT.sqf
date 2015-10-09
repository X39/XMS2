#include "\X39_MS2_Scripting\default.hpp"
[
	"TAKEKINGLT",
	"STR_X39_MS2_Scripting_MedicalUiActions_KingLt_ActionNameTake",
	"",
	{[_this select 1] call X39_MS2_fnc_getkingLt && !([_this select 1] call X39_MS2_fnc_getBagvalveMask)},
	{
		[(_this select 0), '(_this select 0) addItem "x39_xms2_kinglt"', [_this select 0]] call X39_XLib_fnc_executeLocalToUnit;
		[_this select 1, false] call X39_MS2_fnc_setkingLt;
		
	},
	"TAKEKINGLT",
	4
] call X39_MS2_fnc_registerAction;
true
