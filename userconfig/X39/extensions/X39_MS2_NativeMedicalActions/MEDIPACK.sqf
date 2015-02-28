#include "\X39_MS2_Scripting\default.hpp"
[
	"MEDIPACK",
	"STR_X39_MS2_Scripting_MedicalUiActions_MediPack_ActionName",
	"\X39_MS2_Resources\Items\MedicalPack.paa",
	{("x39_xms2_mediPack" in items (_this select 0)) || ("x39_xms2_mediPack" in items (_this select 1))},
	{
		if ("x39_xms2_mediPack" in items (_this select 1)) then
		{
			[(_this select 1), '(_this select 0) removeItem "x39_xms2_mediPack"', [_this select 1]] call X39_XLib_fnc_executeLocalToUnit;
		}
		else
		{
			[(_this select 0), '(_this select 0) removeItem "x39_xms2_mediPack"', [_this select 0]] call X39_XLib_fnc_executeLocalToUnit;
		};
		[_this select 1, -X39_MS2_var_MedicalActions_MediPack_DamageHealing * (_this select 3)] call (missionNamespace getVariable format["X39_MS2_fnc_addDamageTo%1", _this select 2]);
	},
	"MEDIPACK",
	5
] call X39_MS2_fnc_registerAction;
true
