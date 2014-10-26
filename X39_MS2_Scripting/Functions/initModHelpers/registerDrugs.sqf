#include "\X39_MS2_Scripting\default.hpp"
/*
 *	THIS FUNCTION IS NOT INTENDED TO BE CALLEN BY ANY USERSCRIPT!
 *	
 *	@Param1		- STRING	- DrugID (no uniqueCheck is performed here!)
 *	@Param2		- STRING	- localize string name (will be displayed)
 *	@Param3		- STRING	- Image
 *	@Param4		- CODE		- Condition (needs to check for correct item(s) available)
 *	@Param5		- CODE		- ExecutionCode (will be executed upon pressing applyDrug)
 *	@Param6		- CODE		- AcceptCode (will be executed when patient accepts drug)
 *	@Param7		- CODE		- AbortCode (will be executed when patient regrets drug)
 *	@Param8		- STRING	- LimitationID
 *	@Return		- SCALAR	- Drug Index
 *	
 *	@Notes		-	Params for ALL code interactions: [Executer:OBJECT, Target:OBJECT]
 *					Code will ALWAYS be executed on executer computer
 *	
 *	@Author - X39|Cpt. HM Murdock
 */
private["_id"];
DEBUG_CODE_SC(	[
					"DEBUG" COMMA
					"" COMMA
					"" COMMA
					{true} COMMA
					{systemChat "EXECUTE";} COMMA
					{systemChat "ACCEPT";} COMMA
					{systemChat "ABORT";} COMMA
					"DEBUG"
				] call X39_MS2_fnc_registerDrug)
[
	"ADRENALINE",
	"STR_X39_MS2_Scripting_Drugs_Adrenaline_Name",
	"\X39_MS2_Resources\Items\Injector\Injector_thumb.paa",
	{("x39_xms2_adrenaline" in items (_this select 0)) || ("x39_xms2_adrenaline" in items (_this select 1))},
	{if ("x39_xms2_adrenaline" in items (_this select 1)) then {[(_this select 1), '(_this select 0)  removeItem "x39_xms2_adrenaline"', [_this select 1]] call X39_XLib_fnc_executeLocalToUnit;} else {[(_this select 0), '(_this select 0)  removeItem "x39_xms2_adrenaline"', [_this select 0]] call X39_XLib_fnc_executeLocalToUnit;};},
	{[(_this select 1), X39_MS2_var_Drugs_Adrenaline_AdrenalineChangeOnConsume * (_this select 2)] call X39_MS2_fnc_addAdrenaline;},
	{(_this select 0) addItem "x39_xms2_adrenaline"},
	"ADRENALINE"
] call X39_MS2_fnc_registerDrug;
[
	"MORPHINE",
	"STR_X39_MS2_Scripting_Drugs_Morphine_Name",
	"\X39_MS2_Resources\Items\Injector\InjectorInv_thumb.paa",
	{("x39_xms2_morphine" in items (_this select 0)) || ("x39_xms2_morphine" in items (_this select 1))},
	{if ("x39_xms2_morphine" in items (_this select 1)) then {[(_this select 1), '(_this select 0)  removeItem "x39_xms2_morphine"', [_this select 1]] call X39_XLib_fnc_executeLocalToUnit;} else {[(_this select 0), '(_this select 0)  removeItem "x39_xms2_morphine"', [_this select 0]] call X39_XLib_fnc_executeLocalToUnit;};},
	{[(_this select 1), X39_MS2_var_Drugs_Morphine_ChangeOnConsume * (_this select 2)] call X39_MS2_fnc_addMorphine;},
	{(_this select 0) addItem "x39_xms2_morphine"},
	"MORPHINE"
] call X39_MS2_fnc_registerDrug;
[
	"NALOXONE",
	"STR_X39_MS2_Scripting_Drugs_Naloxone_Name",
	"\X39_MS2_Resources\Items\Injector\InjectorInv2_thumb.paa",
	{("x39_xms2_naloxone" in items (_this select 0)) || ("x39_xms2_naloxone" in items (_this select 1))},
	{if ("x39_xms2_naloxone" in items (_this select 1)) then {[(_this select 1), '(_this select 0)  removeItem "x39_xms2_naloxone"', [_this select 1]] call X39_XLib_fnc_executeLocalToUnit;} else {[(_this select 0), '(_this select 0)  removeItem "x39_xms2_naloxone"', [_this select 0]] call X39_XLib_fnc_executeLocalToUnit;};},
	{[(_this select 1), X39_MS2_var_Drugs_Naloxone_ChangeOnConsume * (_this select 2)] call X39_MS2_fnc_addNaloxone;},
	{(_this select 0) addItem "x39_xms2_naloxone"},
	"NALOXONE"
] call X39_MS2_fnc_registerDrug;
[
	"ASPIRIN",
	"STR_X39_MS2_Scripting_Drugs_Aspirin_Name",
	"",
	{("x39_xms2_Aspirin" in items (_this select 0)) || ("x39_xms2_Aspirin" in items (_this select 1))},
	{if ("x39_xms2_Aspirin" in items (_this select 1)) then {[(_this select 1), '(_this select 0)  removeItem "x39_xms2_Aspirin"', [_this select 1]] call X39_XLib_fnc_executeLocalToUnit;} else {[(_this select 0), '(_this select 0)  removeItem "x39_xms2_Aspirin"', [_this select 0]] call X39_XLib_fnc_executeLocalToUnit;};},
	{[(_this select 1), X39_MS2_var_Drugs_Aspirin_ChangeOnConsume * (_this select 2)] call X39_MS2_fnc_addAspirin;},
	{(_this select 0) addItem "x39_xms2_Aspirin"},
	"ASPIRIN"
] call X39_MS2_fnc_registerDrug;