#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	Sets the requirements automatically at mission start
 *	(calling this function manually could lead into unexpected behaviour but should work)
 *	
 *	@Return - NA
 */
_fnc_getKey = 
{
	_keycode = getNumber (_this >> "key");
	_bool1 = (getNumber (_this >> "press_ctrl")) call X39_MedSys_fnc_IntToBoolean;
	_bool2 = (getNumber (_this >> "press_alt")) call X39_MedSys_fnc_IntToBoolean;
	_bool3 = (getNumber (_this >> "press_shift")) call X39_MedSys_fnc_IntToBoolean;
	_useActionKey = (getNumber (_this >> "useActionKey")) call X39_MedSys_fnc_IntToBoolean;
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

["PainChanged", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
["AdrenalineChanged", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange
["PulseChanged", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before valuechange


["PulseDependingActions", "XMS2", missionNamespace] call X39_XLib_EH_fnc_registerEvent;//Triggered before XMS2 Actions

//################################################
//# X39s Medical System - VARIABLES/REGISTRATION #
//################################################

/**********************
 * CATEGORY: INTERNAL *
 *********************/

assignValue("X39_MS2_var_Internal_Keys", []);
//Settings
_Keys = (configFile >> "CfgSettings" >> "X39" >> "x39_settings" >> "keys");
_X39_MedSys_var_Key_SelfInteraction = (_Keys >> "key1") call _fnc_getKey;
_X39_MedSys_var_Key_OthersInteraction = (_Keys >> "key2") call _fnc_getKey;
_arr = [[_X39_MedSys_var_Key_SelfInteraction, X39_MedSys_fnc_SelfInteraction], [_X39_MedSys_var_Key_OthersInteraction, X39_MedSys_fnc_OthersInteraction]];
X39_MS2_var_Internal_Keys set [count X39_MS2_var_Internal_Keys, [(configFile >> "CfgSettings" >> "X39" >> "XMS2" >> "ClientConfig" >> "keys" >> "Key1") call _fnc_getKey, {[player] call X39_MS2_fnc_MedicalActionMenu_createDialog}]];
X39_MS2_var_Internal_Keys set [count X39_MS2_var_Internal_Keys, [(configFile >> "CfgSettings" >> "X39" >> "XMS2" >> "ClientConfig" >> "keys" >> "Key2") call _fnc_getKey, {[cursorTarget] call X39_MS2_fnc_MedicalActionMenu_createDialog}]];

assignValue("X39_MS2_var_Internal_UnitVariables", []);
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_UnitInitialized",		{false											}]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Damage_Generic",		{0.0											}]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Damage_Body",			{0.0											}]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Damage_Head",			{0.0											}]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Damage_Hands",			{0.0											}]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Damage_Legs",			{0.0											}]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Damage_LastHitter", 	{objNull										}]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_EH_HandleDamage",		{-1												}]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_EH_FiredNear",			{-1												}]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_EH_Explosion",			{-1												}]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Adrenaline_value",		{0												}]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Adrenaline_heartPulse",	{X39_MS2_var_Adrenaline_minHeartPulsePerSecond	}]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Adrenaline_HasFlatLine",{0												}]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Pain_value",			{0												}]];
X39_MS2_var_Internal_UnitVariables set [count X39_MS2_var_Internal_UnitVariables, ["X39_MS2_var_Internal_XMSEffects",	{[]												}]];

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
nope = {systemChat format["nope: %1", _this];};
["Morphine", "nope", "", "Acts_TreatingWounded02", 8.032, "XMS2_SoundFiles_injection_3", "\X39_MS2_Ressources\UI\MedicalUI\MEDICAL_TAPE.paa", [], {true}, true, "X39_MS2_var_MedicalActions_DamageHealing_Morphine"] call X39_MS2_fnc_registerAction;
["Adrenaline", "nope", "", "Acts_TreatingWounded02", 8.032, "XMS2_SoundFiles_injection_3", "\X39_MS2_Ressources\UI\MedicalUI\MEDICAL_TAPE.paa", [], {true}, true, "X39_MS2_var_MedicalActions_DamageHealing_Adrenaline"] call X39_MS2_fnc_registerAction;
["CPR", "nope", "", "Acts_TreatingWounded01", 5.299, "someSound", "\X39_MS2_Ressources\UI\MedicalUI\MEDICAL_TAPE.paa", [], {false}, true, ""] call X39_MS2_fnc_registerAction;
["Applying sticky bandage", "nope", "", "Acts_TreatingWounded03", 8.665, "XMS2_SoundFiles_Bandage_unwrapping", "\X39_MS2_Ressources\UI\MedicalUI\MEDICAL_TAPE.paa", [], {false}, true, "X39_MS2_var_MedicalActions_DamageHealing_StickyBandage"] call X39_MS2_fnc_registerAction;
["Applying cold spray", "nope", "", "Acts_TreatingWounded06", 6.234, "someSound", "\X39_MS2_Ressources\UI\MedicalUI\MEDICAL_TAPE.paa", [], {false}, true, "X39_MS2_var_MedicalActions_DamageHealing_ColdSpray"] call X39_MS2_fnc_registerAction;

//Ticker
assignValue("X39_MS2_var_Internal_ticker_tickHandlers", []);
[X39_MS2_fnc_adrenalineTick, 1] call X39_MS2_fnc_registerTickHandler;
[X39_MS2_fnc_updateOverlay, 1] call X39_MS2_fnc_registerTickHandler;
[X39_MS2_fnc_effectHandleTick, 1] call X39_MS2_fnc_registerTickHandler;
DEBUG_CODE([X39_MS2_fnc_debugTick COMMA 1] call X39_MS2_fnc_registerTickHandler);
assignValue("X39_MS2_var_Internal_ticker_minTickRate", 0.25);
assignValue("X39_MS2_var_Internal_ticker_maxTicksTimeout", 100);

//XMSEffects
assignValue("X39_MS2_var_Internal_XMSEffects_MaxLifetime", 32000);

//Dialog communication variables
assignValue("X39_MS2_var_Internal_DialogCommunication_MA_Target", objNull);





/***********************
 * CATEGORY: BACKBLAST *
 **********************/
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

//Dynamic definitions
assignValue("X39_MS2_var_Damage_maxDamageHead", 5);
assignValue("X39_MS2_var_Damage_maxDamageBody", 3);
assignValue("X39_MS2_var_Damage_maxDamageHands", 1);
assignValue("X39_MS2_var_Damage_maxDamageLegs", 1);
assignValue("X39_MS2_var_Damage_maxDamageGeneric", 10);

//Modificators
assignValue("X39_MS2_var_Damage_ExplosionModificator", 1.0);

assignValue("X39_MS2_var_Damage_GlobalModificator", 1.0);
assignValue("X39_MS2_var_Damage_BodyModificator", 3.0);
assignValue("X39_MS2_var_Damage_GenericModificator", 1.0);
assignValue("X39_MS2_var_Damage_HandsModificator", 1.0);
assignValue("X39_MS2_var_Damage_HeadModificator", 5.0);
assignValue("X39_MS2_var_Damage_LegsModificator", 1.0);

/******************
 * CATEGORY: PAIN *
 *****************/
//Enable/Disable painRelated features
assignValue("X39_MS2_var_Pain_useExtraPain", true);
assignValue("X39_MS2_var_Pain_useCurrentDamageValues", true);

//Dynamic definitions
assignValue("X39_MS2_var_Pain_maxPain", 10);

//Modificators
assignValue("X39_MS2_var_Pain_ExtraPainForGlobalModificator", 1.0);
assignValue("X39_MS2_var_Pain_ExtraPainForBodyModificator", 1.0);
assignValue("X39_MS2_var_Pain_ExtraPainForGenericModificator", 1.0);
assignValue("X39_MS2_var_Pain_ExtraPainForHandsModificator", 1.0);
assignValue("X39_MS2_var_Pain_ExtraPainForHeadModificator", 1.0);
assignValue("X39_MS2_var_Pain_ExtraPainForLegsModificator", 1.0);

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
assignValue("X39_MS2_var_Adrenaline_normalMaxHeartPulsePerSecond", 220);
assignValue("X39_MS2_var_Adrenaline_deadlyMaxHeartPulsePerSecond", 300);
assignValue("X39_MS2_var_Adrenaline_adrenalineImpactOnHeartPulse", 300);
assignValue("X39_MS2_var_Adrenaline_knockOutUnitAt", 270);
assignValue("X39_MS2_var_Adrenaline_minHeartPulsePerSecond", 50);
assignValue("X39_MS2_var_Adrenaline_pulseReductionPerTickP", 0.5);
assignValue("X39_MS2_var_Adrenaline_fatigueToReducePulse", 0.1);
assignValue("X39_MS2_var_Adrenaline_fatigueToKeepPulse", 0.2);
assignValue("X39_MS2_var_Adrenaline_fatigueToRaisePulseNormal", 0.6);
assignValue("X39_MS2_var_Adrenaline_timeBeforeFlatLineKills", 120);

//Modificators
////GENERIC
assignValue("X39_MS2_var_Adrenaline_AdrenalineGlobalMultiplicator", 1);
////HEART
assignValue("X39_MS2_var_Adrenaline_pulseGlobalMultiplicator", 1);
assignValue("X39_MS2_var_Adrenaline_pulseMultiplicator", 0.3);
assignValue("X39_MS2_var_Adrenaline_pulseMultiplicatorByDeadlyFatigue", 0.6);

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

/***********************
 * CATEGORY: PPEFFECTS *
 **********************/
//Enables radial blur
assignValue("X39_MS2_var_ppEffect_EnableRadialBlur", true);
//Enables chrom aberration
assignValue("X39_MS2_var_ppEffect_EnableChromAberration", true);
//Enables wet distortion effect !EXPERIMENTAL!
assignValue("X39_MS2_var_ppEffect_EnableWetDistortion", false);
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
assignValue("X39_MS2_var_DialogControl_MedicalActionMenu_checkUnitTimeout", 0);
 
/****************************
 * CATEGORY: MedicalActions *
 ***************************/
assignValue("X39_MS2_var_MedicalActions_DamageHealing_Morphine", 1);
assignValue("X39_MS2_var_MedicalActions_DamageHealing_Adrenaline", 1);
assignValue("X39_MS2_var_MedicalActions_DamageHealing_StickyBandage", 1);
assignValue("X39_MS2_var_MedicalActions_DamageHealing_ColdSpray", 1);
 
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
             