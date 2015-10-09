#include "\X39_MS2_Scripting\default.hpp"
[
	"PUTTOURNIQUET",
	"STR_X39_MS2_Scripting_MedicalUiActions_Tourniquet_ActionNamePut",
	"\X39_MS2_Resources\Items\Tourniquet\Tourniquet_thumb.paa",
	{(getHitzoneInfo(getHitzoneIndexByName(_this select 2), HITZONE_HasAterie)) && {(!([_this select 1, _this select 2] call X39_MS2_fnc_getTournique)) && {("x39_xms2_tourniquet" in items (_this select 0)) || ("x39_xms2_tourniquet" in items (_this select 1))}}},
	{
		if ("x39_xms2_tourniquet" in items (_this select 1)) then
		{
			[(_this select 1), '(_this select 0) removeItem "x39_xms2_tourniquet"', [_this select 1]] call X39_XLib_fnc_executeLocalToUnit;
		}
		else
		{
			[(_this select 0), '(_this select 0) removeItem "x39_xms2_tourniquet"', [_this select 0]] call X39_XLib_fnc_executeLocalToUnit;
		};
		[_this select 1, _this select 2, true] call X39_MS2_fnc_setTournique;
	},
	"PUTTOURNIQUET",
	7
] call X39_MS2_fnc_registerAction;
true
