#include "\X39_MS2_Scripting\default.hpp"
/*
 *	THIS FUNCTION IS NOT INTENDED TO BE CALLEN BY ANY USERSCRIPT!
 *	
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
//"Hands", "Body", "Legs", "Head", "Generic", "Temperature"
nope = {systemChat format["nope: %1", _this];};
[
	"Morphine",
	{
		[_this select 0, X39_MS2_var_MedicalActions_Morphine_AdditionalMorphineValue] call X39_MS2_fnc_addMorphine;
	},
	"",
	"Acts_TreatingWounded02",
	1, //8.032,
	"XMS2_SoundFiles_injection_3",
	0,
	"\X39_MS2_Resources\Items\MorphineInjector.paa",
	["x39_xms2_morphine"],
	{true},
	0,
	"X39_MS2_var_MedicalActions_Morphine_DamageHealing",
	["Hands", "Body", "Legs", "Head", "Generic"]
] call X39_MS2_fnc_registerAction;
[
	"Naloxone",
	{
		[_this select 0, X39_MS2_var_MedicalActions_Naloxone_AdditionalMorphineValue] call X39_MS2_fnc_addMorphine;
	},
	"",
	"Acts_TreatingWounded02",
	1, //8.032,
	"XMS2_SoundFiles_injection_3",
	0,
	"\X39_MS2_Resources\Items\NaloxoneInjector.paa",
	["x39_xms2_naloxone"],
	{true},
	0,
	"X39_MS2_var_MedicalActions_Naloxone_DamageHealing",
	["Hands", "Body", "Legs", "Head", "Generic"]
] call X39_MS2_fnc_registerAction;
[
	"Adrenaline",
	{
		[(_this select 1), X39_MS2_var_MedicalActions_Adrenaline_AdrenalineChange] call X39_MS2_fnc_addAdrenaline;
	},
	"",
	"Acts_TreatingWounded02",
	1, //8.032,
	"XMS2_SoundFiles_injection_3",
	0,
	"\X39_MS2_Resources\Items\Epipen.paa",
	["x39_xms2_adrenaline"],
	{true},
	0,
	"X39_MS2_var_MedicalActions_Adrenaline_DamageHealing",
	["Hands", "Body", "Legs", "Head", "Generic"]
] call X39_MS2_fnc_registerAction;
[
	"bandage",
	{
		_unit = _this select 0;
		_part = _this select 3;
		[_unit, -X39_MS2_var_MedicalActions_StickyBandage_BleedingCure] call format["X39_MS2_fnc_addBleedingTo%1", _part];
	},
	"",
	"Acts_TreatingWounded03",
	1, //8.665,
	"XMS2_SoundFiles_Bandage_unwrapping",
	0,
	"\X39_MS2_Resources\Items\Bandage.paa",
	["x39_xms2_bandage"],
	{true},
	0,
	"X39_MS2_var_MedicalActions_StickyBandage_DamageHealing",
	["Hands", "Body", "Legs", "Head", "Generic"]
] call X39_MS2_fnc_registerAction;
[
	"cold spray",
	{
		[(_this select 1), X39_MS2_var_MedicalActions_ColdSpray_TemperatureChange] call X39_MS2_fnc_addTemperature;
		[(_this select 1), X39_MS2_var_MedicalActions_ColdSpray_PainChange] call X39_MS2_fnc_addPain;
	},
	"",
	"Acts_TreatingWounded06",
	1, //6.234,
	"",
	0,
	"\X39_MS2_Resources\Items\ColdSpray.paa",
	["x39_xms2_coldSpray"],
	{true},
	0,
	"X39_MS2_var_MedicalActions_ColdSpray_DamageHealing",
	["Hands", "Body", "Legs", "Head", "Generic"]
] call X39_MS2_fnc_registerAction;
[
	"MediPack",
	{},
	"",
	"",
	1, //5,
	"",
	0,
	"\X39_MS2_Resources\Items\MedicalPack.paa",
	["x39_xms2_mediPack"],
	{true},
	0,
	"X39_MS2_var_MedicalActions_MediPack_DamageHealing",
	["Hands", "Body", "Legs", "Head", "Generic"]
] call X39_MS2_fnc_registerAction;

[
	"HeatPack",
	{
		[(_this select 1), X39_MS2_var_MedicalActions_HeatPack_TemperatureChange * (_this select 2)] call X39_MS2_fnc_addTemperature;
	},
	"",
	"",
	1, //5,
	"",
	0,
	"\X39_MS2_Resources\Items\HeatPack.paa",
	["x39_xms2_heatPack"],
	{true},
	0,
	0,
	["Temperature"]
] call X39_MS2_fnc_registerAction;