#define generateFunctionsDynamiclyByHitZone(FUNCTIONNAME, SOURCEFILE) \
{\
	private["_fncName"];\
	_fncName = format[FUNCTIONNAME, _x select HITZONE_NAME];\
	if(isNil {missionNamespace getVariable _fncName}) then\
	{\
		missionNamespace setVariable [_fncName, compileFinal str formatText[preprocessFileLineNumbers SOURCEFILE, _x select 0]];\
	};\
}count X39_MS2_var_Internal_HitZones

#include "\X39_MS2_Scripting\default.hpp"
#include "\X39_MS2_UIs\MedicalUi\ui.defs"

/*
 *	Sets the requirements automatically at mission start (preInit)
 *	(calling this function manually could lead into unexpected behaviour but should work)
 *
 *	@Return - NA
 */

//ArmA3 HitZone names

												//	 HITZONE_NAME						COMMA	HITZONE_Size	COMMA	HITZONE_HasAterie	COMMA HITZONE_MedicalUiIdc				COMMA	HITZONE_CommonName	
												//	 HitZone name						COMMA	~size			COMMA	hasAterie			COMMA MedicalUi IDC						COMMA	Common name			
assignValue("X39_MS2_var_Internal_HitZones", 	[
													[stringify(HITZONE_Head)			COMMA	1				COMMA	false				COMMA	IDC_MEDICALUI_IMG_HEAD			COMMA	localize "STR_X39_MS2_Scripting_Hitzones_CommonNames_Head"				] COMMA
													[stringify(HITZONE_LeftLowerArm)	COMMA	2				COMMA	true				COMMA	IDC_MEDICALUI_IMG_LEFTLOWERARM	COMMA	localize "STR_X39_MS2_Scripting_Hitzones_CommonNames_LeftLowerArm"		] COMMA
													[stringify(HITZONE_LeftFoot)		COMMA	1				COMMA	false				COMMA	IDC_MEDICALUI_IMG_LEFTFOOT		COMMA	localize "STR_X39_MS2_Scripting_Hitzones_CommonNames_LeftFoot"			] COMMA
													[stringify(HITZONE_LeftUpperArm)	COMMA	1				COMMA	true				COMMA	IDC_MEDICALUI_IMG_LEFTUPPERARM	COMMA	localize "STR_X39_MS2_Scripting_Hitzones_CommonNames_LeftUpperArm"		] COMMA
													[stringify(HITZONE_LeftLowerLeg)	COMMA	2				COMMA	true				COMMA	IDC_MEDICALUI_IMG_LEFTLOWERLEG	COMMA	localize "STR_X39_MS2_Scripting_Hitzones_CommonNames_LeftLowerLeg"		] COMMA
													[stringify(HITZONE_LeftUpperLeg)	COMMA	2				COMMA	true				COMMA	IDC_MEDICALUI_IMG_LEFTUPPERLEG	COMMA	localize "STR_X39_MS2_Scripting_Hitzones_CommonNames_LeftUpperLeg"		] COMMA
													[stringify(HITZONE_RightLowerArm)	COMMA	1				COMMA	true				COMMA	IDC_MEDICALUI_IMG_RIGHTLOWERARM	COMMA	localize "STR_X39_MS2_Scripting_Hitzones_CommonNames_RightLowerArm"		] COMMA
													[stringify(HITZONE_RightFoot)		COMMA	1				COMMA	false				COMMA	IDC_MEDICALUI_IMG_RIGHTFOOT		COMMA	localize "STR_X39_MS2_Scripting_Hitzones_CommonNames_RightFoot"			] COMMA
													[stringify(HITZONE_RightUpperArm)	COMMA	1				COMMA	true				COMMA	IDC_MEDICALUI_IMG_RIGHTUPPERARM	COMMA	localize "STR_X39_MS2_Scripting_Hitzones_CommonNames_RightUpperArm"		] COMMA
													[stringify(HITZONE_RightLowerLeg)	COMMA	2				COMMA	true				COMMA	IDC_MEDICALUI_IMG_RIGHTLOWERLEG	COMMA	localize "STR_X39_MS2_Scripting_Hitzones_CommonNames_RightLowerLeg"		] COMMA
													[stringify(HITZONE_RightUpperLeg)	COMMA	2				COMMA	true				COMMA	IDC_MEDICALUI_IMG_RIGHTUPPERLEG	COMMA	localize "STR_X39_MS2_Scripting_Hitzones_CommonNames_RightUpperLeg"		] COMMA
													[stringify(HITZONE_LowerBody)		COMMA	2				COMMA	true				COMMA	IDC_MEDICALUI_IMG_LOWERBODY		COMMA	localize "STR_X39_MS2_Scripting_Hitzones_CommonNames_LowerBody"			] COMMA
													[stringify(HITZONE_UpperBody)		COMMA	2				COMMA	true				COMMA	IDC_MEDICALUI_IMG_UPPERBODY		COMMA	localize "STR_X39_MS2_Scripting_Hitzones_CommonNames_UpperBody"			]
												]);

//################################
//# X39s Medical System - EVENTS #
//################################

["XMS2", missionNamespace] call X39_XLib_EH_fnc_registerNamespace;
{
	[format["DamageChanged_%1", _x select HITZONE_NAME], "XMS2" COMMA missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
	[format["BleedingChanged_%1", _x select HITZONE_NAME], "XMS2" COMMA missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
	false
}count X39_MS2_var_Internal_HitZones;

["BloodChanged", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
["ClottingChanged", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange

["PainChanged", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
["DistractionChanged", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
["HearingChanged", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
["PulseChanged", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
["TemperatureChanged", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
["AdrenalineChanged", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
["MorphineChanged", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
["NaloxoneChanged", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
["AspirinChanged", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
["RespiratoryChanged", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange

["consciousStateChanged", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
["BlackOutTextChanged", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange


//Enable/Disable event variables
assignValue("X39_MS2_var_Events_EnableSetEvents", false);



//################################################
//# X39s Medical System - VARIABLES/REGISTRATION #
//################################################

/**********************
* CATEGORY: INTERNAL *
*********************/

assignValue("X39_MS2_var_UIs_XMS2_Overlay_ShownInCurrentMission", false);

assignValue("X39_MS2_var_Internal_UnitVariables", []);
//																				  |Variable name								|Value (as code)								|Will this be broadcasted over the network?|	IsInternalVariable|	Transfer after death
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_UnitInitialized",				{false												}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Damage_LastHitter", 			{objNull											}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Bleeding_Blood",				{X39_MS2_var_Bleeding_maxBloodInEntireBody	}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Bleeding_Clotting",				{1													}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_EH_HandleDamage",				{-1													}, false	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_EH_FiredNear",					{-1													}, false	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_EH_Explosion",					{-1													}, false	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_EH_AnimStateChanged",			{-1													}, false	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_EH_Respawn",						{-1													}, false	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_EH_HitPart",						{-1													}, false	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Heart_heartPulse",				{X39_MS2_var_Heart_minHeartPulsePerSecond		}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Heart_hasFlatLine",				{-1													}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Pain_value",						{0													}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Hearing_value",					{1													}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Internal_XMSEffects",			{[]												}, false	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Temperature_value",				{X39_MS2_var_Temperature_max					}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_hasEarplugs",					{false												}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_hasNasopharyngeal",				{false												}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_haskingLt",						{false												}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_hasBagvalveMask",				{false												}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_BlackOut_Text",					{""													}, false	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_BlackOut_isBlackedOut",		{false												}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_BlackOut_currentStage",		{0													}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_BlackOut_timeOfUnconscious",	{-1													}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_BlackOut_timeOfDeath",			{-1													}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_BlackOut_TimeValue",			{-1													}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Internal_lastValues",			{[]												}, false	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_triageCard",						{[player] call X39_MS2_fnc_getTriageCard		}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_hitMarkerValue",				{0													}, false	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_triageState",					{[player] call X39_MS2_fnc_getTriageState	}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Drugs_Morphine_value",			{0													}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Drugs_Adrenaline_value",		{0													}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Drugs_Naloxone_value",			{0													}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Drugs_Aspirin_value",			{0													}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_distraction",					{0													}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_respiratory_value",				{X39_MS2_var_Respiratory_maxValue				}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_respiratory_toungeBlocking",	{false												}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_respiratory_arrestPresent",	{false												}, true	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_lsClass",						{-1													}, false	,					true	,				true	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_UnitTickHandle",				{scriptNull										}, false	,					true	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["tf_unable_to_use_radio",						{true												}, true	,					false	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["tf_voiceVolume",								{1													}, true	,					false	,				false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["tf_globalVolume",								{1													}, true	,					false	,				false	]];
{
	X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, [format["X39_MS2_var_Damage_%1" COMMA _x select HITZONE_NAME], {0}, true]];
	X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, [format["X39_MS2_var_Bleeding_%1" COMMA _x select HITZONE_NAME], {0}, true]];
	X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, [format["X39_MS2_var_Bleeding_%1AterieDamaged" COMMA _x select HITZONE_NAME], {false}, true]];
	X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, [format["X39_MS2_var_%1HasTourniquet" COMMA _x select HITZONE_NAME], {false}, true]];
	false
}count X39_MS2_var_Internal_HitZones;

//Reserve ppEffect/EventHandler variable holders (not all are used)
assignValue("X39_MS2_var_Internal_ppe_radialBlur", -1);
assignValue("X39_MS2_var_Internal_ppe_chromAberration", -1);
assignValue("X39_MS2_var_Internal_ppe_wetDistortion", -1);
assignValue("X39_MS2_var_Internal_ppe_colorCorrections", -1);
assignValue("X39_MS2_var_Internal_ppe_dynamicBlur", -1);
assignValue("X39_MS2_var_Internal_ppe_filmGrain", -1);
assignValue("X39_MS2_var_Internal_ppe_colorInversion", -1);

//AnimationLock variables
assignValue("X39_MS2_var_Internal_AnimLock_AllowedAnimations", []);
assignValue("X39_MS2_var_Internal_AnimLock_ExitAnimations", []);
assignValue("X39_MS2_var_Internal_AnimLock_SealBrokenCode", {});
assignValue("X39_MS2_var_Internal_AnimLock_CustomArgs", []);



assignValue("X39_MS2_var_Internal_MedicalActions_actionArray", []);
assignValue("X39_MS2_var_Internal_MedicalUi_RegisteredDrugs", []);
assignValue("X39_MS2_var_Internal_MedicalUi_RegisteredStatusEffects", []);

assignValue("X39_MS2_var_Internal_MedicalUi_CheckUnitHandle", scriptNull);
assignValue("X39_MS2_var_Internal_MedicalUi_ActionHandle", scriptNull);
assignValue("X39_MS2_var_Internal_MedicalUi_ApplyDrugHandle", scriptNull);
assignValue("X39_MS2_var_Internal_MedicalUi_DefibrillateHandle", scriptNull);

assignValue("X39_MS2_var_Internal_Overlay_ProgressBarRunning", false);
assignValue("X39_MS2_var_Internal_Overlay_ProgressBarHandle", scriptNull);

//Ticker
assignValue("X39_MS2_var_Internal_ticker_tickHandlers", []);
["X39_MS2_fnc_respiratoryTick", 1] call X39_MS2_fnc_registerTickHandler;
["X39_MS2_fnc_heartTick", 1] call X39_MS2_fnc_registerTickHandler;
["X39_MS2_fnc_effectHandleTick", 1] call X39_MS2_fnc_registerTickHandler;
["X39_MS2_fnc_temperatureTick", 1] call X39_MS2_fnc_registerTickHandler;
["X39_MS2_fnc_hearingTick", 1] call X39_MS2_fnc_registerTickHandler;
["X39_MS2_fnc_bleedingTick", 1] call X39_MS2_fnc_registerTickHandler;
["X39_MS2_fnc_distractionTick", 1] call X39_MS2_fnc_registerTickHandler;
["X39_MS2_fnc_painTick", 1] call X39_MS2_fnc_registerTickHandler;
["X39_MS2_fnc_updateOverlay", 1] call X39_MS2_fnc_registerTickHandler;
["X39_MS2_fnc_drugsSimulationTick", 1] call X39_MS2_fnc_registerTickHandler;
["X39_MS2_fnc_itemReplacerTick", 5] call X39_MS2_fnc_registerTickHandler;
["X39_MS2_fnc_publishTick", 4] call X39_MS2_fnc_registerTickHandler;
["X39_MS2_fnc_soundTick", 12] call X39_MS2_fnc_registerTickHandler;
["X39_MS2_fnc_hitPartTick", 11] call X39_MS2_fnc_registerTickHandler;
DEBUG_CODE(["X39_MS2_fnc_debugTick" COMMA 1] call X39_MS2_fnc_registerTickHandler);
assignValue("X39_MS2_var_Internal_ticker_minTickRate", 0.5);
assignValue("X39_MS2_var_Internal_ticker_maxTicksTimeout", 100);

//XMSEffects
assignValue("X39_MS2_var_Internal_XMSEffects_MaxLifetime", 32000);

//Dialog variables
assignValue("X39_MS2_var_Internal_DialogCommunication_MA_Caller", objNull);
assignValue("X39_MS2_var_Internal_DialogCommunication_MA_Target", objNull);
assignValue("X39_MS2_var_Internal_DialogCommunication_MA_preventActions", false);
assignValue("X39_MS2_var_Internal_DialogCommunication_BO_isActive", false);
assignValue("X39_MS2_var_Internal_DialogCommunication_US_TargetedUnit", objNull);

assignValue("X39_MS2_var_Internal_Dialog_TriageCard_States", []);
assignValue("X39_MS2_var_Internal_Dialog_TriageCard_PreDefinedMessages", []);

//MedicalMessages
assignValue("X39_MS2_var_Internal_MedicalMessages", []);
assignValue("X39_MS2_var_Internal_MedicalStatusEffects", []);

//ClientServer communication
assignValue("X39_MS2_var_Internal_Communication_ServerReady", false);
assignValue("X39_MS2_var_Internal_Communication_ServerMessage", []);

//HitPart eventHandler
assignValue("X39_MS2_var_Internal_HitPart_InitializedUnits", []);


assignValue("X39_MS2_var_Internal_BlackOut_ConditionIDs", []);
assignValue("X39_MS2_var_Internal_BlackOut_ConditionCode", []);

assignValue("X39_MS2_var_Internal_LimitationSystem_Limitations", []);
assignValue("X39_MS2_var_Internal_LimitationSystem_Objects", []);
assignValue("X39_MS2_var_Internal_LimitationSystem_Classes", []);
assignValue("X39_MS2_var_Internal_LimitationSystem_Structure", []);


/***********************
* CATEGORY: BACKBLAST *
**********************/
//http://upload.wikimedia.org/wikipedia/commons/c/c4/A-1_Backblast_area_and_surface_danger_zone.PNG
assignValue("X39_MS2_var_BackBlast_RangeMaxDamage", 2);
assignValue("X39_MS2_var_BackBlast_DamageFalloffRange", 10);
assignValue("X39_MS2_var_BackBlast_MaxDamage", 3);
assignValue("X39_MS2_var_BackBlast_knocksOut", true);
assignValue("X39_MS2_var_BackBlast_maxAngle", 45);

/***********************
* CATEGORY: BLACKOUT *
**********************/
assignValue("X39_MS2_var_Blackout_allowTurningTempBlackoutToPermaByChance", true);
assignValue("X39_MS2_var_Blackout_turnTempToPermaBlackoutChanceP", 0.2);

/********************
* CATEGORY: DAMAGE *
*******************/
//Enable/Disable Hitzones
{ assignValue(format["X39_MS2_var_Damage_EnableHitzone%1" COMMA _x select HITZONE_NAME], true); false }count X39_MS2_var_Internal_HitZones;
assignValue("X39_MS2_var_Damage_AllowRealKillingOnMaxDamage", false);
assignValue("X39_MS2_var_Damage_AllowDeathThroughFullDamageAtHeadHitzone", false);
assignValue("X39_MS2_var_Damage_KillWithNoReviveAtMaxHeadDamage", true);

//Dynamic definitions
{ assignValue(format["X39_MS2_var_Damage_maxDamage%1" COMMA _x select HITZONE_NAME], 1); false }count X39_MS2_var_Internal_HitZones;
assignValue("X39_MS2_var_Damage_knockOutLimitP", 0.3);
assignValue("X39_MS2_var_Damage_DeathLimitP", 0.5);
assignValue("X39_MS2_var_Damage_DeathTime", 600);

//Modificators
{ assignValue(format["X39_MS2_var_Damage_%1Modificator" COMMA _x select HITZONE_NAME], 1); false }count X39_MS2_var_Internal_HitZones;
assignValue("X39_MS2_var_Damage_ExplosionModificator", 2.0);
assignValue("X39_MS2_var_Damage_GlobalModificator", 1.0);


/**********************
* CATEGORY: BLEEDING *
*********************/
//Enable/Disable stuff
{ assignValue(format["X39_MS2_var_Bleeding_EnableHitzone%1" COMMA _x select HITZONE_NAME], true); false }count X39_MS2_var_Internal_HitZones;
assignValue("X39_MS2_var_Bleeding_EnableAterialDamage", true);
assignValue("X39_MS2_var_Bleeding_EnableClotting", true);
assignValue("X39_MS2_var_Bleeding_LowBloodFeatures", true);
assignValue("X39_MS2_var_Bleeding_EnableBloodPresureForBleedingTick", true);
assignValue("X39_MS2_var_Bleeding_BloodPresureCanKill", true);
assignValue("X39_MS2_var_Bleeding_EnableBleedingCure", true);
assignValue("X39_MS2_var_Bleeding_AllowBleedingCureWhenAterieDamaged", false);

//Dynamic definitions
{ assignValue(format["X39_MS2_var_Bleeding_BleedingCurePerTick%1" COMMA _x select HITZONE_NAME], 0.0001); false }count X39_MS2_var_Internal_HitZones;
{ assignValue(format["X39_MS2_var_Bleeding_maxBleeding%1" COMMA _x select 0], 1); false }count X39_MS2_var_Internal_HitZones;
assignValue("X39_MS2_var_Bleeding_ChanceForAterialDamageP", 0.2);
assignValue("X39_MS2_var_Bleeding_maxBloodInEntireBody", 6000);
assignValue("X39_MS2_var_Bleeding_knockOutAtPBlood", 0.25);
assignValue("X39_MS2_var_Bleeding_killAtPBlood", 0.1);
assignValue("X39_MS2_var_Bleeding_knockOutAtPBloodPresureUpperEnd", 1.25);
assignValue("X39_MS2_var_Bleeding_knockOutAtPBloodPresureLowerEnd", 0.75);
assignValue("X39_MS2_var_Bleeding_killAtPBloodPresureUpperEnd", 1.5);
assignValue("X39_MS2_var_Bleeding_killAtPBloodPresureLowerEnd", 0.5);
assignValue("X39_MS2_var_Bleeding_NaturalMaxOfBloodPresure", 120);

//Modificators
{ assignValue(format["X39_MS2_var_Bleeding_%1Modificator" COMMA _x select HITZONE_NAME], 1); false }count X39_MS2_var_Internal_HitZones;
{ if(_x select HITZONE_HasAterie) then { assignValue(format["X39_MS2_var_Bleeding_AterialDamageMultiplicator%1" COMMA _x select HITZONE_NAME], 10); }; false }count X39_MS2_var_Internal_HitZones;
assignValue("X39_MS2_var_Bleeding_GlobalModificator", 10.0);
assignValue("X39_MS2_var_Bleeding_ClottingModificator", 1.0);

/*********************
* CATEGORY: HEARING *
********************/
//Enable/Disable painRelated features
assignValue("X39_MS2_var_Hearing_allowMusicChange", true);
assignValue("X39_MS2_var_Hearing_allowSoundChange", true);
assignValue("X39_MS2_var_Hearing_allowRadioChange", true);

//Dynamic definitions
assignValue("X39_MS2_var_Hearing_curePerTick", 0.001);
assignValue("X39_MS2_var_Hearing_reductionThroughEarplugs", 0.2);

//Modificators
assignValue("X39_MS2_var_Hearing_GlobalModificator", 1.0);

/*******************
* CATEGORY: DRUGS *
******************/
//Morphine
	//Enable/Disable Related features
	assignValue("X39_MS2_var_Drugs_Morphine_useForPain", true);
	assignValue("X39_MS2_var_Drugs_Morphine_OverdoseCanKill", true);
	assignValue("X39_MS2_var_Drugs_Morphine_OverdoseCanKnockOut", true);
	assignValue("X39_MS2_var_Drugs_Morphine_FakeKills", true);
	assignValue("X39_MS2_var_Drugs_Morphine_Effects", true);

	//Dynamic definitions
	assignValue("X39_MS2_var_Drugs_Morphine_maxMorphine", 11);
	assignValue("X39_MS2_var_Drugs_Morphine_KillLifeTime", 600);
	assignValue("X39_MS2_var_Drugs_Morphine_reductionPerTick", 0.001);
	assignValue("X39_MS2_var_Drugs_Morphine_RandomDowningPointP", 0.3);
	assignValue("X39_MS2_var_Drugs_Morphine_DisortionStartPointP", 0.4);
	assignValue("X39_MS2_var_Drugs_Morphine_ForceWalkPointP", 0.3);
	assignValue("X39_MS2_var_Drugs_Morphine_RandomDowningBaseValueP", 0.3);

	//Modificators
	assignValue("X39_MS2_var_Drugs_Morphine_PainCureValueP", 1.0);
	assignValue("X39_MS2_var_Drugs_Morphine_PainMinForFullCureP", 0.5);
	assignValue("X39_MS2_var_Drugs_Morphine_KillPointP", 1);
	assignValue("X39_MS2_var_Drugs_Morphine_BlackOutPointP", 0.5);

	assignValue("X39_MS2_var_Drugs_Morphine_GlobalMorphineModificator", 1.0);

	//Drug specification
	assignValue("X39_MS2_var_Drugs_Morphine_ChangeOnConsume", 5);
	
//Adrenaline
	//Enable/Disable Related features
	assignValue("X39_MS2_var_Drugs_Adrenaline_useForPain", true);
	assignValue("X39_MS2_var_Drugs_Adrenaline_useForHeartCalculations", true);
	
	//Dynamic definitions
	assignValue("X39_MS2_var_Drugs_Adrenaline_PainCureValueP", 1.0);
	assignValue("X39_MS2_var_Drugs_Adrenaline_PainMinForFullCureP", 1.0);
	assignValue("X39_MS2_var_Drugs_Adrenaline_maxAdrenaline", 10);
	assignValue("X39_MS2_var_Drugs_Adrenaline_naturalAdrenalineP", 0.2);
	assignValue("X39_MS2_var_Drugs_Adrenaline_reductionPerTick", 0.02);
	assignValue("X39_MS2_var_Drugs_Adrenaline_AdrenalineAddedThroughShooting", 0.035);
	assignValue("X39_MS2_var_Drugs_Adrenaline_AdrenalinePulseRagePointP", 0.7);
	
	//Modificators
	assignValue("X39_MS2_var_Drugs_Adrenaline_AdrenalineGlobalMultiplicator", 1);
	assignValue("X39_MS2_var_Drugs_Adrenaline_AdrenalinePulseMultiplicator", 1);
	
	//Drug specification
	assignValue("X39_MS2_var_Drugs_Adrenaline_AdrenalineChangeOnConsume", 5);
	
//Naloxone
	//Enable/Disable Related features
	assignValue("X39_MS2_var_Drugs_Naloxone_hasImpactOnMorphine", true);
	assignValue("X39_MS2_var_Drugs_Naloxone_allowWakeUnconscious", true);
	
	//Dynamic definitions
	assignValue("X39_MS2_var_Drugs_Naloxone_maxNaloxone", 10);
	assignValue("X39_MS2_var_Drugs_Naloxone_reductionPerTick", 0.001);
	assignValue("X39_MS2_var_Drugs_Naloxone_wakeBlackedPersonValueP", 0.4);
	
	//Modificators
	assignValue("X39_MS2_var_Drugs_Naloxone_NaloxoneGlobalMultiplicator", 1);
	assignValue("X39_MS2_var_Drugs_Naloxone_MorphineImpactMultiplicator", 8);

	//Drug specification
	assignValue("X39_MS2_var_Drugs_Naloxone_ChangeOnConsume", 2);

//Aspirin
	//Enable/Disable Related features
	assignValue("X39_MS2_var_Drugs_Aspirin_hasImpactOnBloodClotting", true);
	assignValue("X39_MS2_var_Drugs_Aspirin_useForPain", true);
	
	//Dynamic definitions
	assignValue("X39_MS2_var_Drugs_Aspirin_PainMinForFullCureP", 1.0);
	assignValue("X39_MS2_var_Drugs_Aspirin_PainCureValueP", 0.75);
	assignValue("X39_MS2_var_Drugs_Aspirin_maxAspirin", 10);
	assignValue("X39_MS2_var_Drugs_Aspirin_reductionPerTick", 0.001);
	
	//Modificators
	assignValue("X39_MS2_var_Drugs_Aspirin_GlobalAspirinModificator", 1);

	//Drug specification
	assignValue("X39_MS2_var_Drugs_Aspirin_ChangeOnConsume", 2);

/*******************
* CATEGORY: Heart *
*******************/
//Enable/Disable heartRelated features
assignValue("X39_MS2_var_Heart_enableHeartSimulation", true);

assignValue("X39_MS2_var_Heart_useFatigueForHeartCalculations", true);
assignValue("X39_MS2_var_Heart_allowForceWalkByPulse", false);
assignValue("X39_MS2_var_Heart_allowBlurryScreenByPulse", true);
assignValue("X39_MS2_var_Heart_allowCamShakeByPulse", true);
assignValue("X39_MS2_var_Heart_pulseUseFilmGrainForHighPulseIndicator", true);
assignValue("X39_MS2_var_Heart_lowerPulseIfPermaKnockedOut", true);

//Dynamic definitions
assignValue("X39_MS2_var_Heart_normalMaxHeartPulsePerSecond", 190);
assignValue("X39_MS2_var_Heart_deadlyMaxHeartPulsePerSecond", 260);
assignValue("X39_MS2_var_Heart_knockOutUnitAtPulse", 250);
assignValue("X39_MS2_var_Heart_temporaryKnockOutBaseTimePulse", 20);
assignValue("X39_MS2_var_Heart_temporaryKnockOutRandomTimePulse", 20);
assignValue("X39_MS2_var_Heart_minHeartPulsePerSecond", 50);
assignValue("X39_MS2_var_Heart_basePulseChangePerTick", 0.125);
assignValue("X39_MS2_var_Heart_timeBeforeFlatLineKills", 120);
assignValue("X39_MS2_var_Heart_pulseForceWalkAt", 190);
assignValue("X39_MS2_var_Heart_pulseBlurryAt", 190);
assignValue("X39_MS2_var_Heart_pulseCamShakeAt", 150);
assignValue("X39_MS2_var_Heart_pulseFilmGrainKickIn", 120);
assignValue("X39_MS2_var_Heart_pulseSpeedStage0", 0.001);
assignValue("X39_MS2_var_Heart_pulseSpeedStage1", 5);
assignValue("X39_MS2_var_Heart_pulseSpeedStage2", 12);
assignValue("X39_MS2_var_Heart_pulseSpeedStage3", 18);
assignValue("X39_MS2_var_Heart_pulseLimitStage1", 90);
assignValue("X39_MS2_var_Heart_pulseLimitStage2", 120);
assignValue("X39_MS2_var_Heart_pulseLimitStage3", 180);
assignValue("X39_MS2_var_Heart_pulseLimitStage4", -1);

//Modificators
assignValue("X39_MS2_var_Heart_pulseGlobalMultiplicator", 1);
assignValue("X39_MS2_var_Heart_pulseReductionMultiplicator", 2);
assignValue("X39_MS2_var_Heart_BlackedOutPulseModificator", 0.1);
assignValue("X39_MS2_var_Heart_camShakeMultiplicator", 3);

/******************
* CATEGORY: PAIN *
*****************/
//Enable/Disable painRelated features
assignValue("X39_MS2_var_Pain_useExtraPain", true);
assignValue("X39_MS2_var_Pain_useCurrentDamageValues", true);
assignValue("X39_MS2_var_Pain_showDiagnosticsMessagesUnconscious", true);

//Dynamic definitions
assignValue("X39_MS2_var_Pain_maxPain", 10);
assignValue("X39_MS2_var_Pain_painReductionPerTick", 0.001);

//Modificators
{ assignValue(format["X39_MS2_var_Pain_DamagePainFor%1Modificator" COMMA _x select HITZONE_NAME], 1); false }count X39_MS2_var_Internal_HitZones;
assignValue("X39_MS2_var_Pain_GlobalModificator", 1.0);
assignValue("X39_MS2_var_Pain_DamagePainGlobalModificator", 1.0);

/******************
* CATEGORY: Distraction *
*****************/
//Enable/Disable distraction related features

//Dynamic definitions
assignValue("X39_MS2_var_Distraction_reductionPerTick", 0.01);

//Modificators


/*************************
* CATEGORY: Temperature *
*************************/
//Enable/Disable painRelated features
assignValue("X39_MS2_var_Temperature_useGreyScreenForLowTemperature", true);
assignValue("X39_MS2_var_Temperature_useFocusEffectForLowTemperature", true);
assignValue("X39_MS2_var_Temperature_useFilmGrainForLowTemperature", true);
assignValue("X39_MS2_var_Temperature_InstantDeath", false); //when reaching X39_MS2_var_Temperature_minDead + this is true then a unit will be killed directly without timer, false will kill with timer

//Dynamic definitions
assignValue("X39_MS2_var_Temperature_max", 10); //Maximum temperature a unit can reach (starts with this), not allowed to be 0!
assignValue("X39_MS2_var_Temperature_maxReductionWhileRaining", 5); //Maximum temperature to which raining can reduce the temperature
assignValue("X39_MS2_var_Temperature_minNatural", 3); //Temperature where no effects (like slowing) will be applied
assignValue("X39_MS2_var_Temperature_forceWalkAtTemperature", 2.5);
assignValue("X39_MS2_var_Temperature_minDead", 0); //Temperature where unit dies, -1 to disable
assignValue("X39_MS2_var_Temperature_DeathTimerTime", 600);
assignValue("X39_MS2_var_Temperature_valueRaisePerTick", 0.0001);
assignValue("X39_MS2_var_Temperature_valueReductionWhileSwimmingPerTick", 0.01);
assignValue("X39_MS2_var_Temperature_valueReductionWhileRainingPerTick", 0.01);

//Modificators
assignValue("X39_MS2_var_Temperature_GlobalModificator", 1.0);


/***********************
* CATEGORY: HitMarker *
**********************/

assignValue("X39_MS2_var_HitMarker_ReductionPerTick", 0.25);


/*******************************************************
*  CATEGORY: Respiratory                               *
*     Read more about it in following ticket:          *
* http://mantis.unitedtacticalforces.de/view.php?id=93 *
*******************************************************/
//Enable/Disable painRelated features
assignValue("X39_MS2_var_Respiratory_Enable", true);
assignValue("X39_MS2_var_Respiratory_EnableToungeBlockingDuringBlackOut", true);
assignValue("X39_MS2_var_Respiratory_EnableRespiratoryArrestDuringBlackOut", true);
assignValue("X39_MS2_var_Respiratory_UseForHeartCalculations", true);

//Dynamic definitions
assignValue("X39_MS2_var_Respiratory_maxValue", 10);
assignValue("X39_MS2_var_Respiratory_RespiratoryArrestPointP", 0.6);
assignValue("X39_MS2_var_Respiratory_FlatLinePointP", 0.25);
assignValue("X39_MS2_var_Respiratory_MaxPulseChange", -0.5);

assignValue("X39_MS2_var_Respiratory_NormalChangePerTick", 0.1);
assignValue("X39_MS2_var_Respiratory_NoBeathingChangePerTick", -0.1);
assignValue("X39_MS2_var_Respiratory_ChanceForToungeBlockingDuringBlackOutP", 0.5);
assignValue("X39_MS2_var_Respiratory_ChanceForDirectRespiratoryArrestDuringBlackOutP", 0.25);
assignValue("X39_MS2_var_Respiratory_RequiredRespirationValueForWakeupP", 0.7);

//Modificators
assignValue("X39_MS2_var_Respiratory_GlobalModificator", 1);

/***************************
* CATEGORY: FEATURE FLAGS *
**************************/
//Allows the mod to handle AT/AA (launcher) weapons BackBlast
assignValue("X39_MS2_var_Feature_EnableBackBlast", true);
//Allows the mod to simulate pain
assignValue("X39_MS2_var_Feature_EnablePain", true);
//Allows the mod to simulate distraction
assignValue("X39_MS2_var_Feature_EnableDistraction", true);
//Enables general adrenaline parts of the mod
assignValue("X39_MS2_var_Feature_EnableAdrenaline", true);
//Enable adding "natural" ammount of adrenaline during fight
assignValue("X39_MS2_var_Feature_EnableAdrenalineFightSimulation", true);
//Enables simulation of focusing when under influence of adrenaline
assignValue("X39_MS2_var_Feature_EnableAdrenalineFocus", true);
//Enables simulation of temperature
assignValue("X39_MS2_var_Feature_EnableTemperature", true);
//Enables simulation of the human ear
assignValue("X39_MS2_var_Feature_EnableHearing", true);
//Enables simulation of bleeding
assignValue("X39_MS2_var_Feature_EnableBlood", true);
//Enables simulation of morphine
assignValue("X39_MS2_var_Feature_EnableMorphine", true);
//Enables simulation of morphine
assignValue("X39_MS2_var_Feature_EnableNaloxone", true);
//Enables simulation of morphine
assignValue("X39_MS2_var_Feature_EnableAspirin", true);
//Enables the simple hit marker
assignValue("X39_MS2_var_Feature_SimpleHitMarker", true);
//Enables the replacement of items in inventory 
assignValue("X39_MS2_var_Feature_ReplaceItemsOnInventoryJoin", true);

/***********************
* CATEGORY: PPEFFECTS *
**********************/
//Enables radial blur
assignValue("X39_MS2_var_ppEffect_EnableRadialBlur", true);
//Enables chrom aberration
assignValue("X39_MS2_var_ppEffect_EnableChromAberration", true);
//Enables wet distortion effect
assignValue("X39_MS2_var_ppEffect_EnableWetDistortion", true);
//Enables color corrections effect
assignValue("X39_MS2_var_ppEffect_EnableColorCorrections", true);
//Enables dynamic blur effect
assignValue("X39_MS2_var_ppEffect_EnableDynamicBlur", true);
//Enables film grain effect
assignValue("X39_MS2_var_ppEffect_EnableFilmGrain", true);
//Enables color inversion effect
assignValue("X39_MS2_var_ppEffect_EnableColorInversion", true);

/***************************
* CATEGORY: DialogControl *
**************************/
assignValue("X39_MS2_var_DialogControl_MedicalActionMenu_checkUnitTimeout", [5 COMMA 20 COMMA 60]);
assignValue("X39_MS2_var_DialogControl_BlackOutDialog_EnableRespawnButton", true);
assignValue("X39_MS2_var_DialogControl_BlackOutDialog_EnableAbortButton", true);

/*****************************
* CATEGORY: InteractionMenu *
****************************/
assignValue("X39_MS2_var_InteractionMenu_enableInVehicleHealing_self", true);
assignValue("X39_MS2_var_InteractionMenu_enableInVehicleHealing_others", true);
assignValue("X39_MS2_var_InteractionMenu_enablePutUnitsIntoVehicles", true);
assignValue("X39_MS2_var_InteractionMenu_enablePullUnitsFromVehicles", true);
assignValue("X39_MS2_var_InteractionMenu_allowOpeningOfTheUi", true);

assignValue("X39_MS2_var_InteractionMenu_Defibrillate_RequiredAdrenalineP", 0.4);
assignValue("X39_MS2_var_InteractionMenu_Defibrillate_ChanceWithoutAdrenaline", 12); //1:X
assignValue("X39_MS2_var_InteractionMenu_Defibrillate_DistractionAdded", 10);

/****************************
* CATEGORY: MedicalActions *
***************************/
assignValue("X39_MS2_var_MedicalActions_StickyBandage_BleedingCure", 0.5);

assignValue("X39_MS2_var_MedicalActions_MediPack_DamageHealing", 5);

assignValue("X39_MS2_var_MedicalActions_HeatPack_TemperatureChange", 4);

assignValue("X39_MS2_var_MedicalActions_SalineBag_BloodChangeP", 0.15);

/*******************
* CATEGORY: SOUND *
******************/
assignValue("X39_MS2_var_Sound_playExtremePainSounds", true);
assignValue("X39_MS2_var_Sound_playExtremePainSounds_startPointP", 0.5);

/**********************
* CATEGORY: CHECKUNIT *
**********************/
assignValue("X39_MS2_var_CheckUnit_sphygmomanometerIsRequiredToGetBloodPresureInfo", true);
assignValue("X39_MS2_var_CheckUnit_showDrugsConcentrationInDiagnostics", true);

/****************************
* CATEGORY: ITEMREPLACEMENT *
****************************/
assignValue("X39_MS2_var_ItemReplacement_Medikit", ["x39_xms2_bandage" COMMA "x39_xms2_bandage" COMMA "x39_xms2_bandage" COMMA "x39_xms2_adrenaline" COMMA "x39_xms2_adrenaline" COMMA "x39_xms2_morphine" COMMA "x39_xms2_morphine" COMMA "x39_xms2_naloxone" COMMA "x39_xms2_naloxone" COMMA "x39_xms2_naloxone" COMMA "x39_xms2_heatPack" COMMA "x39_xms2_heatPack" COMMA "x39_xms2_heatPack" COMMA "x39_xms2_mediPack" COMMA "x39_xms2_mediPack" COMMA "x39_xms2_bandage" COMMA "x39_xms2_bandage" COMMA "x39_xms2_bandage" COMMA "x39_xms2_morphine" COMMA "x39_xms2_adrenaline" COMMA "x39_xms2_defibrillator"]);
assignValue("X39_MS2_var_ItemReplacement_FirstAidKit", ["x39_xms2_bandage" COMMA "x39_xms2_mediPack" COMMA "x39_xms2_morphine"]);

#ifdef DEBUG
	/*******************
	 * CATEGORY: DEBUG *
	 ******************/
	assignValue("X39_MS2_DEBUG_enable", true);
	assignValue("X39_MS2_DEBUG_ppeDynamicBlur", -1);
	assignValue("X39_MS2_DEBUG_ppeRadialBlur", -1);
	assignValue("X39_MS2_DEBUG_ppeFocus", -1);
	assignValue("X39_MS2_DEBUG_ppeFilmGrain", -1);
	assignValue("X39_MS2_DEBUG_ppeChromAberration", -1);
	assignValue("X39_MS2_DEBUG_ppeGreyScreen", -1);
	assignValue("X39_MS2_DEBUG_redScreenAlpha", -1);
	assignValue("X39_MS2_DEBUG_cfnDisableFatigue", -1);
	assignValue("X39_MS2_DEBUG_cfnForceWalk", -1);
#endif

//#############################################################
//# X39s Medical System - VALIDATE PROFILENAMESPACE VARIABLES #
//#############################################################

assignValue3("X39_MS2_var_MedicalUI_selectedCheckUnitIndex", 0, profileNamespace);
assignValue3("X39_MS2_var_MedicalUI_ViewType", 0, profileNamespace);
assignValue3("X39_MS2_options_MedicalUi_toggleFrame_state_ToggleDrugsFrame", true, profileNamespace);
assignValue3("X39_MS2_options_MedicalUi_toggleFrame_state_ToggleDiagnosticFrame", true, profileNamespace);
assignValue3("X39_MS2_options_MedicalUi_toggleFrame_state_ToggleTriageCardFrame", true, profileNamespace);
assignValue3("X39_MS2_options_MedicalUi_toggleFrame_state_ToggleQuickActionFrame", true, profileNamespace);


//############################################
//# X39s Medical System - APPLY CONFIG FILES #
//############################################

if(isServer) then
{
	private["_id"];
	[] call X39_MS2_fnc_applyServerConfig;
};
if(!isDedicated) then
{
	[] call X39_MS2_fnc_applyClientConfig;
};
//####################################################
//# X39s Medical System - GENERATE DYNAMIC FUNCTIONS #
//####################################################

generateFunctionsDynamiclyByHitZone("X39_MS2_fnc_addDamageTo%1",	"\X39_MS2_Scripting\Functions\Damage\addDamageToHitZone.sqf");
generateFunctionsDynamiclyByHitZone("X39_MS2_fnc_setDamageOf%1",	"\X39_MS2_Scripting\Functions\Damage\setDamageOfHitZone.sqf");
generateFunctionsDynamiclyByHitZone("X39_MS2_fnc_getDamageOf%1",	"\X39_MS2_Scripting\Functions\Damage\getDamageOfHitZone.sqf");
generateFunctionsDynamiclyByHitZone("X39_MS2_fnc_addBleedingTo%1",	"\X39_MS2_Scripting\Functions\Bleeding\addBleedingToHitZone.sqf");
generateFunctionsDynamiclyByHitZone("X39_MS2_fnc_setBleedingOf%1",	"\X39_MS2_Scripting\Functions\Bleeding\setBleedingOfHitZone.sqf");
generateFunctionsDynamiclyByHitZone("X39_MS2_fnc_getBleedingOf%1",	"\X39_MS2_Scripting\Functions\Bleeding\getBleedingOfHitZone.sqf");