#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Sets the requirements automatically at mission start
 *	(calling this function manually could lead into unexpected behaviour but should work)
 *
 *	@Return - NA
 */

if(isNil "scriptNull") then
{
	scriptNull = 0 spawn {};
};
_fnc_getKey =
{
	_keycode = getNumber (_this >> "key");
	_bool1 = (getNumber (_this >> "press_ctrl")) call X39_XLib_fnc_IntToBool;
	_bool2 = (getNumber (_this >> "press_alt")) call X39_XLib_fnc_IntToBool;
	_bool3 = (getNumber (_this >> "press_shift")) call X39_XLib_fnc_IntToBool;
	_useActionKey = (getNumber (_this >> "useActionKey")) call X39_XLib_fnc_IntToBool;
	_actionKey = getText (_this >> "actionKey");
	[_useActionKey, _keycode, _bool1, _bool2, _bool3, _actionKey]
};

//################################
//# X39s Medical System - EVENTS #
//################################

["XMS2", missionNamespace] call X39_XLib_EH_fnc_registerNamespace;
["DamageChanged_Head", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
["DamageChanged_Body", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
["DamageChanged_Hands", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
["DamageChanged_Legs", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
["DamageChanged_Generic", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange

["Bleeding_Head", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
["Bleeding_Body", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
["Bleeding_Hands", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
["Bleeding_Legs", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
["Bleeding_Generic", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
["BloodChanged", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange

["PainChanged", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
["HearingChanged", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
["AdrenalineChanged", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
["PulseChanged", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
["TemperatureChanged", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange


["PulseDependingActions", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before XMS2 Actions

["unitBlackedOut", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;
["BlackOutTextChanged", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;




//################################################
//# X39s Medical System - VARIABLES/REGISTRATION #
//################################################

/**********************
 * CATEGORY: INTERNAL *
 *********************/

assignValue("X39_MS2_var_UIs_XMS2_Overay_ShownInCurrentMission", false);

assignValue("X39_MS2_var_Internal_Keys", []);
//Settings
X39_MS2_var_Internal_Keys set [count X39_MS2_var_Internal_Keys, [(configFile >> "CfgSettings" >> "X39" >> "XMS2" >> "ClientConfig" >> "keys" >> "Key1") call _fnc_getKey, {X39_MS2_var_Internal_Dialog_IsSelfInteracton = true;	[true] call X39_MS2_fnc_interactionMenu_openDialog;}]];
X39_MS2_var_Internal_Keys set [count X39_MS2_var_Internal_Keys, [(configFile >> "CfgSettings" >> "X39" >> "XMS2" >> "ClientConfig" >> "keys" >> "Key2") call _fnc_getKey, {X39_MS2_var_Internal_Dialog_IsSelfInteracton = false;[false] call X39_MS2_fnc_interactionMenu_openDialog;}]];

assignValue("X39_MS2_var_Internal_UnitVariables", []);
//																				  |Variable name								|Value (as code)								|Will this be broadcasted over the network?|
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_UnitInitialized",				{false											}, true		]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Damage_LastHitter", 			{objNull										}, true		]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Damage_Generic",				{0.0											}, true		]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Damage_Body",					{0.0											}, true		]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Damage_Head",					{0.0											}, true		]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Damage_Hands",					{0.0											}, true		]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Damage_Legs",					{0.0											}, true		]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Bleeding_Generic",				{0.0											}, true		]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Bleeding_Body",					{0.0											}, true		]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Bleeding_Head",					{0.0											}, true		]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Bleeding_Hands",				{0.0											}, true		]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Bleeding_Legs",					{0.0											}, true		]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Bleeding_Blood",				{X39_MS2_var_Bleeding_maxBloodInEntireBody		}, true		]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_EH_HandleDamage",				{-1												}, false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_EH_FiredNear",					{-1												}, false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_EH_Explosion",					{-1												}, false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_EH_AnimStateChanged",			{-1												}, false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Adrenaline_value",				{0												}, true		]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Adrenaline_heartPulse",			{X39_MS2_var_Adrenaline_minHeartPulsePerSecond	}, true		]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Adrenaline_HasFlatLine",		{-1												}, true		]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Pain_value",					{0												}, true		]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Pain_MorphineValue",			{0												}, true		]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Hearing_value",					{1												}, true		]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Internal_XMSEffects",			{[]												}, false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Temperature_value",				{X39_MS2_var_Temperature_max					}, true		]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_hasEarplugs",					{false											}, true		]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_BlackOut_Text",					{""												}, false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_BlackOut_isBlackedOut",			{false											}, true		]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_BlackOut_currentStage",			{0												}, true		]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_BlackOut_timeOfUnconscious",	{-1												}, true		]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_BlackOut_timeOfDeath",			{-1												}, true		]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_BlackOut_TimeValue",			{-1												}, true		]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Internal_lastValues",			{[]												}, false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_triageCard",					{[]												}, false	]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_triageState",					{-1												}, true		]];

//Reserve ppEffect/EventHandler variable holders (not all are used)
assignValue("X39_MS2_var_Internal_ppe_radialBlur", -1);
assignValue("X39_MS2_var_Internal_ppe_chromAberration", -1);
assignValue("X39_MS2_var_Internal_ppe_wetDistortion", -1);
assignValue("X39_MS2_var_Internal_ppe_colorCorrections", -1);
assignValue("X39_MS2_var_Internal_ppe_dynamicBlur", -1);
assignValue("X39_MS2_var_Internal_ppe_filmGrain", -1);
assignValue("X39_MS2_var_Internal_ppe_colorInversion", -1);

assignValue("X39_MS2_var_Internal_deh_keyDown", -1);



//MedicalActions
assignValue("X39_MS2_var_Internal_MedicalActions_actionArray", []);
[] call X39_MS2_fnc_IMH_registerMedicalActions;

//Ticker
assignValue("X39_MS2_var_Internal_ticker_tickHandlers", []);
["X39_MS2_fnc_adrenalineTick", 1] call X39_MS2_fnc_registerTickHandler;
["X39_MS2_fnc_effectHandleTick", 1] call X39_MS2_fnc_registerTickHandler;
["X39_MS2_fnc_temperatureTick", 1] call X39_MS2_fnc_registerTickHandler;
["X39_MS2_fnc_hearingTick", 1] call X39_MS2_fnc_registerTickHandler;
["X39_MS2_fnc_bleedingTick", 1] call X39_MS2_fnc_registerTickHandler;
["X39_MS2_fnc_painTick", 1] call X39_MS2_fnc_registerTickHandler;
["X39_MS2_fnc_updateOverlay", 1] call X39_MS2_fnc_registerTickHandler;
["X39_MS2_fnc_publishTick", 4] call X39_MS2_fnc_registerTickHandler;
DEBUG_CODE(["X39_MS2_fnc_debugTick" COMMA 1] call X39_MS2_fnc_registerTickHandler);
assignValue("X39_MS2_var_Internal_ticker_minTickRate", 0.25);
assignValue("X39_MS2_var_Internal_ticker_maxTicksTimeout", 100);

//XMSEffects
assignValue("X39_MS2_var_Internal_XMSEffects_MaxLifetime", 32000);

//Dialog variables
assignValue("X39_MS2_var_Internal_DialogCommunication_IM_Target", objNull);
assignValue("X39_MS2_var_Internal_DialogCommunication_IM_Executor", objNull);
assignValue("X39_MS2_var_Internal_DialogCommunication_IM_preventActions", false);
assignValue("X39_MS2_var_Internal_DialogCommunication_MA_Target", objNull);
assignValue("X39_MS2_var_Internal_DialogCommunication_MA_preventActions", false);
assignValue("X39_MS2_var_Internal_DialogCommunication_BO_isActive", false);

assignValue("X39_MS2_var_Internal_Dialog_TriageCard_States", []);
assignValue("X39_MS2_var_Internal_Dialog_TriageCard_PreDefinedMessages", []);

//MedicalMessages
assignValue("X39_MS2_var_Internal_MedicalMessages", []);
[] call X39_MS2_fnc_IMH_addMedicalMessages;

//InteractionMenu
assignValue("X39_MS2_var_Internal_Dialog_IsSelfInteracton", false);
assignValue("X39_MS2_var_Internal_InteractionMenu_Entries", []);
[] call X39_MS2_fnc_IMH_addInteractionMenuEntries;

/***********************
 * CATEGORY: BACKBLAST *
 **********************/
//http://upload.wikimedia.org/wikipedia/commons/c/c4/A-1_Backblast_area_and_surface_danger_zone.PNG
assignValue("X39_MS2_var_BackBlast_range", 10);
assignValue("X39_MS2_var_BackBlast_damageDealtOverall", 3);
assignValue("X39_MS2_var_BackBlast_knocksOut", true);
assignValue("X39_MS2_var_BackBlast_maxAngle", 45);

/********************
 * CATEGORY: DAMAGE *
 *******************/
//Enable/Disable Hitzones
assignValue("X39_MS2_var_Damage_EnableHitzoneHead", true);
assignValue("X39_MS2_var_Damage_EnableHitzoneBody", true);
assignValue("X39_MS2_var_Damage_EnableHitzoneHands", true);
assignValue("X39_MS2_var_Damage_EnableHitzoneLegs", true);
assignValue("X39_MS2_var_Damage_EnableHitzoneGeneric", true);
assignValue("X39_MS2_var_Damage_AllowRealKillingOnMaxDamage", true);

//Dynamic definitions
assignValue("X39_MS2_var_Damage_maxDamageHead", 1);
assignValue("X39_MS2_var_Damage_maxDamageBody", 5);
assignValue("X39_MS2_var_Damage_maxDamageHands", 1);
assignValue("X39_MS2_var_Damage_maxDamageLegs", 1);
assignValue("X39_MS2_var_Damage_maxDamageGeneric", 5);

assignValue("X39_MS2_var_Damage_knockOutLimitP", 0.5);
assignValue("X39_MS2_var_Damage_DeathLimitP", 0.8);
assignValue("X39_MS2_var_Damage_DeathTime", 600);

//Modificators
assignValue("X39_MS2_var_Damage_ExplosionModificator", 1.0);

assignValue("X39_MS2_var_Damage_GlobalModificator", 1.0);
assignValue("X39_MS2_var_Damage_BodyModificator", 3.0);
assignValue("X39_MS2_var_Damage_GenericModificator", 1.0);
assignValue("X39_MS2_var_Damage_HandsModificator", 1.0);
assignValue("X39_MS2_var_Damage_HeadModificator", 5.0);
assignValue("X39_MS2_var_Damage_LegsModificator", 1.0);

/**********************
 * CATEGORY: BLEEDING *
 *********************/
//Enable/Disable Hitzones
assignValue("X39_MS2_var_Bleeding_EnableHitzoneHead", true);
assignValue("X39_MS2_var_Bleeding_EnableHitzoneBody", true);
assignValue("X39_MS2_var_Bleeding_EnableHitzoneHands", true);
assignValue("X39_MS2_var_Bleeding_EnableHitzoneLegs", true);
assignValue("X39_MS2_var_Bleeding_EnableHitzoneGeneric", true);

//Dynamic definitions
assignValue("X39_MS2_var_Bleeding_BleedingCurePerTick", 0.001);

assignValue("X39_MS2_var_Bleeding_maxBloodInEntireBody", 60000);
assignValue("X39_MS2_var_Bleeding_maxBleedingHead", 1);
assignValue("X39_MS2_var_Bleeding_maxBleedingBody", 5);
assignValue("X39_MS2_var_Bleeding_maxBleedingHands", 1);
assignValue("X39_MS2_var_Bleeding_maxBleedingLegs", 1);
assignValue("X39_MS2_var_Bleeding_maxBleedingGeneric", 5);

assignValue("X39_MS2_var_Bleeding_minDamageRequiredForHead", 0.3);
assignValue("X39_MS2_var_Bleeding_minDamageRequiredForBody", 0.3);
assignValue("X39_MS2_var_Bleeding_minDamageRequiredForHands", 0.3);
assignValue("X39_MS2_var_Bleeding_minDamageRequiredForLegs", 0.3);
assignValue("X39_MS2_var_Bleeding_minDamageRequiredForGeneric", 0.3);

//Modificators
assignValue("X39_MS2_var_Bleeding_ExplosionModificator", 1.0);

assignValue("X39_MS2_var_Bleeding_GlobalModificator", 1.0);
assignValue("X39_MS2_var_Bleeding_BodyModificator", 3.0);
assignValue("X39_MS2_var_Bleeding_GenericModificator", 1.0);
assignValue("X39_MS2_var_Bleeding_HandsModificator", 1.0);
assignValue("X39_MS2_var_Bleeding_HeadModificator", 5.0);
assignValue("X39_MS2_var_Bleeding_LegsModificator", 1.0);

/*********************
 * CATEGORY: HEARING *
 ********************/
//Enable/Disable painRelated features
assignValue("X39_MS2_var_Hearing_allowMusicChange", true);
assignValue("X39_MS2_var_Hearing_allowSoundChange", true);
assignValue("X39_MS2_var_Hearing_allowRadioChange", true);

//Dynamic definitions
assignValue("X39_MS2_var_Hearing_curePerTick", 0.0001);
assignValue("X39_MS2_var_Hearing_reductionThroughEarplugs", 0.2);

//Modificators
assignValue("X39_MS2_var_Hearing_GlobalModificator", 1.0);

/******************
 * CATEGORY: PAIN *
 *****************/
//Enable/Disable painRelated features
assignValue("X39_MS2_var_Pain_useExtraPain", true);
assignValue("X39_MS2_var_Pain_useMorphineForPain", true);
assignValue("X39_MS2_var_Pain_morphineOverdoseCanKill", true);
assignValue("X39_MS2_var_Pain_morphineFakeKills", true);
assignValue("X39_MS2_var_Pain_useCurrentDamageValues", true);
assignValue("X39_MS2_var_Pain_morphineEffects", true);

//Dynamic definitions
assignValue("X39_MS2_var_Pain_maxMorphine", 11);
assignValue("X39_MS2_var_Pain_maxPain", 10);
assignValue("X39_MS2_var_Pain_morphineKillLifeTime", 600);
assignValue("X39_MS2_var_Pain_painReductionPerTick", 0.001);
assignValue("X39_MS2_var_Pain_morphineReductionPerTick", 0.001);
assignValue("X39_MS2_var_Pain_morphineRandomDowningPointP", 0.3);
assignValue("X39_MS2_var_Pain_morphineDisortionStartPointP", 0.4);
assignValue("X39_MS2_var_Pain_morphineForceWalkPointP", 0.3);
assignValue("X39_MS2_var_Pain_morphineRandomDowningBaseValue", 30);

//Modificators
assignValue("X39_MS2_var_Pain_MorphinePainCureValueP", 1.0);
assignValue("X39_MS2_var_Pain_MorphinePainMinForFullCureP", 0.5);
assignValue("X39_MS2_var_Pain_MorphineKillPointP", 1);

assignValue("X39_MS2_var_Pain_ExtraPainForGlobalModificator", 1.0);
assignValue("X39_MS2_var_Pain_ExtraPainForBodyModificator", 1.0);
assignValue("X39_MS2_var_Pain_ExtraPainForGenericModificator", 1.0);
assignValue("X39_MS2_var_Pain_ExtraPainForHandsModificator", 1.0);
assignValue("X39_MS2_var_Pain_ExtraPainForHeadModificator", 1.0);
assignValue("X39_MS2_var_Pain_ExtraPainForLegsModificator", 1.0);

assignValue("X39_MS2_var_Pain_GlobalMorphineModificator", 1.0);
assignValue("X39_MS2_var_Pain_GlobalModificator", 1.0);
assignValue("X39_MS2_var_Pain_DamagePainForGlobalModificator", 1.0);
assignValue("X39_MS2_var_Pain_DamagePainForBodyModificator", 1.0);
assignValue("X39_MS2_var_Pain_DamagePainForGenericModificator", 1.0);
assignValue("X39_MS2_var_Pain_DamagePainForHandsModificator", 1.0);
assignValue("X39_MS2_var_Pain_DamagePainForHeadModificator", 1.0);
assignValue("X39_MS2_var_Pain_DamagePainForLegsModificator", 1.0);

/************************
 * CATEGORY: Adrenaline *
 * Also contains heart	*
 * simulation			*
 ***********************/
//Enable/Disable painRelated features
////GENERIC
assignValue("X39_MS2_var_Adrenaline_enableHeartSimulation", true);
////HEART
assignValue("X39_MS2_var_Adrenaline_useAdrenalineForHeartCalculations", true);

//Dynamic definitions
////GENERIC
assignValue("X39_MS2_var_Adrenaline_maxAdrenaline", 10);
assignValue("X39_MS2_var_Adrenaline_naturalAdrenalineP", 0.2);
//assignValue("X39_MS2_var_Adrenaline_naturalAdrenalineRaise", 0.04);
assignValue("X39_MS2_var_Adrenaline_adrenalineReductionPerTick", 0.02);
assignValue("X39_MS2_var_Adrenaline_adrenalineAddedThroughShooting", 0.025);
////HEART
assignValue("X39_MS2_var_Adrenaline_AdrenalinePulseRagePointP", 0.7);
assignValue("X39_MS2_var_Adrenaline_normalMaxHeartPulsePerSecond", 190);
assignValue("X39_MS2_var_Adrenaline_deadlyMaxHeartPulsePerSecond", 260);
assignValue("X39_MS2_var_Adrenaline_knockOutUnitAtPulse", 220);
assignValue("X39_MS2_var_Adrenaline_temporaryKnockOutBaseTimePulse", 20);
assignValue("X39_MS2_var_Adrenaline_temporaryKnockOutRandomTimePulse", 20);
assignValue("X39_MS2_var_Adrenaline_minHeartPulsePerSecond", 50);
assignValue("X39_MS2_var_Adrenaline_basePulseChangePerTick", 0.125);
assignValue("X39_MS2_var_Adrenaline_timeBeforeFlatLineKills", 120);
assignValue("X39_MS2_var_Adrenaline_PulseSpeedStage0", 0.001);
assignValue("X39_MS2_var_Adrenaline_PulseSpeedStage1", 5);
assignValue("X39_MS2_var_Adrenaline_PulseSpeedStage2", 12);
assignValue("X39_MS2_var_Adrenaline_PulseSpeedStage3", 18);

//Modificators
////GENERIC
assignValue("X39_MS2_var_Adrenaline_AdrenalineGlobalMultiplicator", 1);
assignValue("X39_MS2_var_Adrenaline_AdrenalinePulseMultiplicator", 1);
////HEART
assignValue("X39_MS2_var_Adrenaline_pulseGlobalMultiplicator", 1);
assignValue("X39_MS2_var_Adrenaline_pulseReductionMultiplicator", 2);

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

/***************************
 * CATEGORY: FEATURE FLAGS *
 **************************/
//Allows the mod to handle AT/AA (launcher) weapons BackBlast
assignValue("X39_MS2_var_Feature_EnableBackBlast", true);
//Allows the mod to simulate pain
assignValue("X39_MS2_var_Feature_EnablePain", true);
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
assignValue("X39_MS2_var_DialogControl_MedicalActionMenu_checkUnitTimeout", 20); //TODO: Adjust

/*****************************
 * CATEGORY: InteractionMenu *
 ****************************/
 assignValue("X39_MS2_var_InteractionMenu_enableInVehicleHealing_self", true);
 assignValue("X39_MS2_var_InteractionMenu_enableInVehicleHealing_others", true);
 assignValue("X39_MS2_var_InteractionMenu_enablePutUnitsIntoVehicles", true);
 assignValue("X39_MS2_var_InteractionMenu_enablePullUnitsFromVehicles", true);
 assignValue("X39_MS2_var_InteractionMenu_allowOpeningOfTheUi", true);
 
 assignValue("X39_MS2_var_InteractionMenu_Defibrillate_RequiredAdrenalineP", 0.5);
 assignValue("X39_MS2_var_InteractionMenu_Defibrillate_ChanceWithoutAdrenaline", 12); //1:X
 
/****************************
 * CATEGORY: MedicalActions *
 ***************************/
assignValue("X39_MS2_var_MedicalActions_Morphine_AdditionalMorphineValue", 5);
assignValue("X39_MS2_var_MedicalActions_Morphine_DamageHealing", 0.5);

assignValue("X39_MS2_var_MedicalActions_Naloxone_AdditionalMorphineValue", -2);
assignValue("X39_MS2_var_MedicalActions_Naloxone_DamageHealing", 0.5);

assignValue("X39_MS2_var_MedicalActions_Adrenaline_AdrenalineChange", 5);
assignValue("X39_MS2_var_MedicalActions_Adrenaline_DamageHealing", 0);

assignValue("X39_MS2_var_MedicalActions_StickyBandage_DamageHealing", 0.1);
assignValue("X39_MS2_var_MedicalActions_StickyBandage_BleedingCure", 0.5);

assignValue("X39_MS2_var_MedicalActions_ColdSpray_TemperatureChange", -0.5);
assignValue("X39_MS2_var_MedicalActions_ColdSpray_PainChange", -3);
assignValue("X39_MS2_var_MedicalActions_ColdSpray_DamageHealing", 0);

assignValue("X39_MS2_var_MedicalActions_MediPack_DamageHealing", 5);

assignValue("X39_MS2_var_MedicalActions_HeatPack_TemperatureChange", 4);

/*******************
 * CATEGORY: DEBUG *
 ******************/
assignValue("X39_MS2_DEBUG_ppeDynamicBlur", -1);
assignValue("X39_MS2_DEBUG_ppeRadialBlur", -1);
assignValue("X39_MS2_DEBUG_ppeFocus", -1);
assignValue("X39_MS2_DEBUG_ppeFilmGrain", -1);
assignValue("X39_MS2_DEBUG_ppeChromAberration", -1);
assignValue("X39_MS2_DEBUG_ppeGreyScreen", -1);
assignValue("X39_MS2_DEBUG_cfnDisableFatigue", -1);
assignValue("X39_MS2_DEBUG_cfnForceWalk", -1);

if(isServer) then
{
	[] call X39_MS2_fnc_applyServerConfig;
};