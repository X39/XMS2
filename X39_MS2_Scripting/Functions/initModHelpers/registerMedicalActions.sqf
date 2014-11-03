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
		if(!([_this select 1, _this select 2] call X39_MS2_fnc_getAterialDamage)) then
		{
			[(_this select 1), -X39_MS2_var_MedicalActions_StickyBandage_BleedingCure * (_this select 3)] call (missionNamespace getVariable format["X39_MS2_fnc_addBleedingTo%1", _this select 2]);
		};
	},
	"BANDAGE",
	3
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
		[_this select 1, -X39_MS2_var_MedicalActions_MediPack_DamageHealing * (_this select 3)] call (missionNamespace getVariable format["X39_MS2_fnc_addDamageTo%1", _this select 2]);
	},
	"MEDIPACK",
	5
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
		[(_this select 1), X39_MS2_var_MedicalActions_HeatPack_TemperatureChange * (_this select 3)] call X39_MS2_fnc_addTemperature;
	},
	"HEATPACK",
	3
] call X39_MS2_fnc_registerAction;

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
[
	"GIVESALINE",
	"STR_X39_MS2_Scripting_MedicalUiActions_Tourniquet_ActionNameTake",
	"\X39_MS2_Resources\Items\Tourniquet\Tourniquet_thumb.paa",
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
	},
	"GIVESALINE",
	12
] call X39_MS2_fnc_registerAction;
[
	"PUTNASOPHARYNGEAL",
	"STR_X39_MS2_Scripting_MedicalUiActions_Nasopharyngeal_ActionNamePut",
	"",
	{(("x39_xms2_nasopharyngeal" in items (_this select 0)) || ("x39_xms2_nasopharyngeal" in items (_this select 1))) && !([_this select 1] call X39_MS2_fnc_getBagvalveMask) && {([_this select 1] call X39_MS2_fnc_isBlackedOut) && {!([_this select 1] call X39_MS2_fnc_getNasopharyngeal)}}},
	{
		if ("x39_xms2_nasopharyngeal" in items (_this select 1)) then
		{
			[(_this select 1), '(_this select 0) removeItem "x39_xms2_nasopharyngeal"', [_this select 1]] call X39_XLib_fnc_executeLocalToUnit;
		}
		else
		{
			[(_this select 0), '(_this select 0) removeItem "x39_xms2_nasopharyngeal"', [_this select 0]] call X39_XLib_fnc_executeLocalToUnit;
		};
		[_this select 1, true] call X39_MS2_fnc_setNasopharyngeal;
		[(_this select 1), -2, nil, nil, "NASOPHARYNGEAL", {[_this select 0] call X39_MS2_fnc_getNasopharyngeal}] call X39_MS2_fnc_blackOutUnit;
	},
	"PUTNASOPHARYNGEAL",
	8
] call X39_MS2_fnc_registerAction;
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
[
	"PUTKINGLT",
	"STR_X39_MS2_Scripting_MedicalUiActions_KingLt_ActionNamePut",
	"",
	{(("x39_xms2_kinglt" in items (_this select 0)) || ("x39_xms2_kinglt" in items (_this select 1))) && !([_this select 1] call X39_MS2_fnc_getBagvalveMask) && {([_this select 1] call X39_MS2_fnc_isBlackedOut) && {!([_this select 1] call X39_MS2_fnc_getkingLt)}}},
	{
		if ("x39_xms2_kinglt" in items (_this select 1)) then
		{
			[(_this select 1), '(_this select 0) removeItem "x39_xms2_kinglt"', [_this select 1]] call X39_XLib_fnc_executeLocalToUnit;
		}
		else
		{
			[(_this select 0), '(_this select 0) removeItem "x39_xms2_kinglt"', [_this select 0]] call X39_XLib_fnc_executeLocalToUnit;
		};
		[_this select 1, true] call X39_MS2_fnc_setkingLt;
		[(_this select 1), -2, nil, nil, "KINGLT", {[_this select 0] call X39_MS2_fnc_getkingLt}] call X39_MS2_fnc_blackOutUnit;
	},
	"PUTKINGLT",
	8
] call X39_MS2_fnc_registerAction;
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
[
	"USEBAGVALVEMASK",
	"STR_X39_MS2_Scripting_MedicalUiActions_UseBagValveMask",
	"",
	{("x39_xms2_bagvalvemask" in items (_this select 0)) || ("x39_xms2_bagvalvemask" in items (_this select 1)) && {([_this select 1] call X39_MS2_fnc_isBlackedOut) && {!([_this select 1] call X39_MS2_fnc_getBagvalveMask)}}},
	{
		[
			_this select 0,
			["ainvpknlmstpsnonwrfldnon_medic", "ainvpknlmstpsnonwrfldnon_medic0s", "ainvpknlmstpsnonwrfldnon_ainvpknlmstpsnonwrfldnon_medic"],
			["ainvpknlmstpsnonwrfldnon_medicend"],
			{
				_this = _this select 1;
				[_this select 0, false] call X39_MS2_fnc_setBagvalveMask;
				[-1] call X39_MS2_fnc_clearProgressBarTimeout;
				X39_MS2_var_Internal_DialogCommunication_MA_preventActions = false;
				X39_XLib_var_ActionDialog_preventMenuOpening = false;
				[] call X39_MS2_fnc_clearAnimationLock;
			},
			{
				_this = _this select 1;
				[_this select 0, true] call X39_MS2_fnc_setBagvalveMask;
				[] call X39_MS2_fnc_MedicalUi_closeDialog;
				[-1] call X39_MS2_fnc_setProgressBarTimeout;
				X39_MS2_var_Internal_DialogCommunication_MA_preventActions = true;
				X39_XLib_var_ActionDialog_preventMenuOpening = true;
				(_this select 0) playAction "MedicStart";
			},
			[_this select 0, _this select 1]
		] call X39_MS2_fnc_setAnimationLock;
	},
	"USEBAGVALVEMASK",
	0
] call X39_MS2_fnc_registerAction;

//FINALLY, register the "close" action
["NA", "STR_X39_MS2_Scripting_MedicalUiActions_Close", "", {true}, {}, "NA", 0] call X39_MS2_fnc_registerAction;