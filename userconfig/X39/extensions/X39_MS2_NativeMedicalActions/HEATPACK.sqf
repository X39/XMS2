#include "\X39_MS2_Scripting\default.hpp"
[
	"HEATPACK",
	"STR_X39_MS2_Scripting_MedicalUiActions_Heatpack_ActionName",
	"\X39_MS2_Resources\Items\HeatPack.paa",
	{("x39_xms2_heatPack" in items (_this select 0)) || ("x39_xms2_heatPack" in items (_this select 1))},
	{
		if ("x39_xms2_heatPack" in items (_this select 1)) then
		{
			[(_this select 1), '(_this select 0) removeItem "x39_xms2_heatPack"', [_this select 1]] call X39_XLib_fnc_executeLocalToUnit;
		}
		else
		{
			[(_this select 0), '(_this select 0) removeItem "x39_xms2_heatPack"', [_this select 0]] call X39_XLib_fnc_executeLocalToUnit;
		};
		[(_this select 1), X39_MS2_var_MedicalActions_HeatPack_TemperatureChange * (_this select 3)] call X39_MS2_fnc_addTemperature;
	},
	"HEATPACK",
	3
] call X39_MS2_fnc_registerAction;
true
