#include "\X39_MS2_Scripting\default.hpp"
[
	"GIVESALINE",
	"STR_X39_MS2_Scripting_MedicalUiActions_Saline_ActionName",
	"\X39_MS2_Resources\Items\IVBag\IVBag_thumb.paa",
	{("x39_xms2_IVBag" in items (_this select 0)) || ("x39_xms2_IVBag" in items (_this select 1))},
	{
		if ("x39_xms2_IVBag" in items (_this select 1)) then
		{
			[(_this select 1), '(_this select 0) removeItem "x39_xms2_IVBag"', [_this select 1]] call X39_XLib_fnc_executeLocalToUnit;
		}
		else
		{
			[(_this select 0), '(_this select 0) removeItem "x39_xms2_IVBag"', [_this select 0]] call X39_XLib_fnc_executeLocalToUnit;
		};
		[(_this select 1), (X39_MS2_var_MedicalActions_SalineBag_BloodChangeP * X39_MS2_var_Bleeding_maxBloodInEntireBody) * (_this select 3)] call X39_MS2_fnc_addBlood;
		[(_this select 1), ((X39_MS2_var_MedicalActions_SalineBag_BloodChangeP * X39_MS2_var_Bleeding_maxBloodInEntireBody) * (_this select 3)) / X39_MS2_var_Bleeding_maxBloodInEntireBody / (_this select 3)] call X39_MS2_fnc_addClotting;
	},
	"GIVESALINE",
	12
] call X39_MS2_fnc_registerAction;
true
