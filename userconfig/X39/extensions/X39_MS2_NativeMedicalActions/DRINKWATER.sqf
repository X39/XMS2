#include "\X39_MS2_Scripting\default.hpp"
[
	"DRINKWATER",
	"STR_X39_MS2_Scripting_MedicalUiActions_Bandage_ActionName",
	"\X39_MS2_Resources\Items\Bandage\Bandage.paa",
	{("x39_xms2_waterbottle" in items (_this select 0))},
	{


		[(_this select 0), '(_this select 0) removeItem "x39_xms2_bandage"', [_this select 0]] call X39_XLib_fnc_executeLocalToUnit;
	},
	"DRINKWATER",
	6
] call X39_MS2_fnc_registerAction;
true