#include "\X39_MS2_Scripting\default.hpp"
/*
 *	THIS FUNCTION IS NOT INTENDED TO BE CALLEN BY ANY USERSCRIPT!
 *	
 *	@Param1		- STRING	- ActionID (no uniqueCheck is performed here!)
 *	@Param2		- STRING	- localize string name (will be displayed)
 *	@Param3		- STRING	- Image
 *	@Param4		- CODE		- Condition (needs to check for correct item(s) available)
 *	@Param5		- CODE		- ExecutionCode (will be executed upon pressing applyDrug)
 *	@Param6		- STRING	- LimitationID
 *	@Return		- SCALAR	- Action Index
 *	
 *	@Notes		-	Params for ALL CODE related stuff: [Executer:OBJECT, Target:OBJECT, Hitzone:STRING]
 *					Code will ALWAYS be executed on executer computer
 *	
 *	@Author - X39|Cpt. HM Murdock
 */

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
		[(_this select 1), -X39_MS2_var_MedicalActions_StickyBandage_BleedingCure] call (missionNamespace getVariable format["X39_MS2_fnc_addBleedingTo%1", _this select 2]);
	},
	"BANDAGE"
] call X39_MS2_fnc_registerAction;
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
		[_this select 1, -X39_MS2_var_MedicalActions_MediPack_DamageHealing] call (missionNamespace getVariable format["X39_MS2_fnc_addTamageTo%1", _this select 2]);
	},
	"MEDIPACK"
] call X39_MS2_fnc_registerAction;

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
		[(_this select 1), X39_MS2_var_MedicalActions_HeatPack_TemperatureChange] call X39_MS2_fnc_addTemperature;
	},
	"HEATPACK"
] call X39_MS2_fnc_registerAction;

//FINALLY, register the "close" action
["NA", "STR_X39_MS2_Scripting_MedicalUiActions_Close", "", {true}, {}, "NA"] call X39_MS2_fnc_registerAction;