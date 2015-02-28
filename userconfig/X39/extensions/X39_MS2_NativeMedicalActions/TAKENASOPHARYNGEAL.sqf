#include "\X39_MS2_Scripting\default.hpp"
[
	"TAKENASOPHARYNGEAL",
	"STR_X39_MS2_Scripting_MedicalUiActions_Nasopharyngeal_ActionNameTake",
	"",
	{([_this select 1] call X39_MS2_fnc_getNasopharyngeal) && !([_this select 1] call X39_MS2_fnc_getBagvalveMask)},
	{
		[(_this select 0), '(_this select 0) addItem "x39_xms2_nasopharyngeal"', [_this select 0]] call X39_XLib_fnc_executeLocalToUnit;
		[_this select 1, false] call X39_MS2_fnc_setNasopharyngeal;
		
	},
	"TAKENASOPHARYNGEAL",
	4
] call X39_MS2_fnc_registerAction;
true
