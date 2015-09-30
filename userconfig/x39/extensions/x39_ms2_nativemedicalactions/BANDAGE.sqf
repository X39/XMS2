#include "\X39_MS2_Scripting\default.hpp"
[
	"BANDAGE",
	"STR_X39_MS2_Scripting_MedicalUiActions_Bandage_ActionName",
	"\X39_MS2_Resources\Items\Bandage\Bandage.paa",
	{("x39_xms2_bandage" in items (_this select 0)) || ("x39_xms2_bandage" in items (_this select 1))},
	{
		if ("x39_xms2_bandage" in items (_this select 1)) then
		{
			[(_this select 1), '(_this select 0) removeItem "x39_xms2_bandage"', [_this select 1]] call X39_XLib_fnc_executeLocalToUnit;
		}
		else
		{
			[(_this select 0), '(_this select 0) removeItem "x39_xms2_bandage"', [_this select 0]] call X39_XLib_fnc_executeLocalToUnit;
		};
		if(!([_this select 1, _this select 2] call X39_MS2_fnc_getAterialDamage)) then
		{
			[(_this select 1), -X39_MS2_var_MedicalActions_StickyBandage_BleedingCure * (_this select 3)] call (missionNamespace getVariable format["X39_MS2_fnc_addBleedingTo%1", _this select 2]);
		};
	},
	"BANDAGE",
	3
] call X39_MS2_fnc_registerAction;
true
