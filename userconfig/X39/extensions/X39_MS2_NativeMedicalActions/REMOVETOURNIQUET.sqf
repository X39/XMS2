#include "\X39_MS2_Scripting\default.hpp"
[
	"REMOVETOURNIQUET",
	"STR_X39_MS2_Scripting_MedicalUiActions_Tourniquet_ActionNameTake",
	"\X39_MS2_Resources\Items\Tourniquet\Tourniquet_thumb.paa",
	{[_this select 1, _this select 2] call X39_MS2_fnc_getTournique},
	{
		[(_this select 0), '(_this select 0) addItem "x39_xms2_tourniquet"', [_this select 0]] call X39_XLib_fnc_executeLocalToUnit;
		[_this select 1, _this select 2, false] call X39_MS2_fnc_setTournique;

	},
	"REMOVETOURNIQUET",
	4
] call X39_MS2_fnc_registerAction;
true
