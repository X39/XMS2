class General //Functions without any categoriy
{
	class initUnit:X39_XLib_Function_TypeA														{file = "\X39_MS2_Scripting\Functions\initUnit.sqf";};
	class unInitUnit:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\unInitUnit.sqf";};
	
	class isUnitXms2Unit:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\isUnitXms2Unit.sqf";};
	class runTicker:X39_XLib_Function_TypeA														{file = "\X39_MS2_Scripting\Functions\runTicker.sqf";};
	class blackOutUnit:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\blackOutUnit.sqf";};
	class isBlackedOut:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\isBlackedOut.sqf";};
	class getBlackOutStage:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\getBlackOutStage.sqf";};
	class applyPPEffects:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\applyPPEffects.sqf";};
	class resetPPEffects:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\resetPPEffects.sqf";};
	class addEffect:X39_XLib_Function_TypeA														{file = "\X39_MS2_Scripting\Functions\addEffect.sqf";};
	class killUnit:X39_XLib_Function_TypeA														{file = "\X39_MS2_Scripting\Functions\killUnit.sqf";};
	class registerTickHandler:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\registerTickHandler.sqf";};
	class registerMedicalMessage:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\registerMedicalMessage.sqf";};
	class registerMedicalStatusEffect:X39_XLib_Function_TypeA									{file = "\X39_MS2_Scripting\Functions\registerMedicalStatusEffect.sqf";};
	
	class applyServerConfig:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\applyServerConfig.sqf";};
	class applyClientConfig:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\applyClientConfig.sqf";};
	class resetUnitsVariables:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\resetUnitsVariables.sqf";};
	
	class serverMessageSystem:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\serverMessageSystem.sqf";};
	
	class setAnimationLock:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\setAnimationLock.sqf";};
	class clearAnimationLock:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\clearAnimationLock.sqf";};
	class isAnimationLockInPlace:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\isAnimationLockInPlace.sqf";};
	class notifyUnit:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\notifyUnit.sqf";};
};
class InitModFunctions //Functions for initMod
{
	class initMod:X39_XLib_Function_TypeB														{file = "\X39_MS2_Scripting\Functions\initMod.sqf";};
	class postInit:X39_XLib_Function_TypeC														{file = "\X39_MS2_Scripting\Functions\postInit.sqf";};
};
class HitZones
{
	class isValidHitZone:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\HitZones\isValidHitZone.sqf";};
};
class Damage
{
	class getColorArrayFromDamageValue:X39_XLib_Function_TypeA									{file = "X39_MS2_Scripting\Functions\Damage\getColorArrayFromDamageValue.sqf";};
	class getDamageTotal:X39_XLib_Function_TypeA												{file = "X39_MS2_Scripting\Functions\Damage\getDamageTotal.sqf";};
	class getMaxDamageTotal:X39_XLib_Function_TypeA												{file = "X39_MS2_Scripting\Functions\Damage\getMaxDamageTotal.sqf";};
};
class Bleeding
{
	class addBlood:X39_XLib_Function_TypeA														{file = "X39_MS2_Scripting\Functions\Bleeding\adder\addBlood.sqf";};
	class addClotting:X39_XLib_Function_TypeA													{file = "X39_MS2_Scripting\Functions\Bleeding\adder\addClotting.sqf";};
	
	class setBlood:X39_XLib_Function_TypeA														{file = "X39_MS2_Scripting\Functions\Bleeding\setter\setBlood.sqf";};
	class setClotting:X39_XLib_Function_TypeA													{file = "X39_MS2_Scripting\Functions\Bleeding\setter\setClotting.sqf";};
	
	class getBlood:X39_XLib_Function_TypeA														{file = "X39_MS2_Scripting\Functions\Bleeding\getter\getBlood.sqf";};
	class getClotting:X39_XLib_Function_TypeA													{file = "X39_MS2_Scripting\Functions\Bleeding\getter\getClotting.sqf";};
	
	class isBleeding:X39_XLib_Function_TypeA													{file = "X39_MS2_Scripting\Functions\Bleeding\isBleeding.sqf";};
	class getAterialDamage:X39_XLib_Function_TypeA												{file = "X39_MS2_Scripting\Functions\Bleeding\getAterialDamage.sqf";};
	class setAterialDamage:X39_XLib_Function_TypeA												{file = "X39_MS2_Scripting\Functions\Bleeding\setAterialDamage.sqf";};
	class getBloodPresure:X39_XLib_Function_TypeA												{file = "X39_MS2_Scripting\Functions\Bleeding\getBloodPresure.sqf";};
	class getCurrentBleeding:X39_XLib_Function_TypeA											{file = "X39_MS2_Scripting\Functions\Bleeding\getCurrentBleeding.sqf";};
	
	class getTournique:X39_XLib_Function_TypeA													{file = "X39_MS2_Scripting\Functions\Bleeding\Tournique\getTournique.sqf";};
	class setTournique:X39_XLib_Function_TypeA													{file = "X39_MS2_Scripting\Functions\Bleeding\Tournique\setTournique.sqf";};
	class hasTournique:X39_XLib_Function_TypeA													{file = "X39_MS2_Scripting\Functions\Bleeding\Tournique\hasTournique.sqf";};
};
class Callback
{
	class cb_Explosion:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Callback\cb_Explosion.sqf";};
	class cb_FiredNear:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Callback\cb_FiredNear.sqf";};
	class cb_HandleDamage:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\Callback\cb_HandleDamage.sqf";};
	class cb_AnimStateChanged:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\Callback\cb_AnimStateChanged.sqf";};
	class cb_Respawn:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Callback\cb_Respawn.sqf";};
	class cb_hitPart:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Callback\cb_hitPart.sqf";};
};
class Pain
{
	class addPain:X39_XLib_Function_TypeA														{file = "\X39_MS2_Scripting\Functions\Pain\addPain.sqf";};
	class getPain:X39_XLib_Function_TypeA														{file = "\X39_MS2_Scripting\Functions\Pain\getPain.sqf";};
	class getMaxPain:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Pain\getMaxPain.sqf";};
	class setPain:X39_XLib_Function_TypeA														{file = "\X39_MS2_Scripting\Functions\Pain\setPain.sqf";};
};
class Distraction
{
	class addDistraction:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\Distraction\addDistraction.sqf";};
	class getDistraction:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\Distraction\getDistraction.sqf";};
	class setDistraction:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\Distraction\setDistraction.sqf";};
};
class Drugs
{
	class registerDrug:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Drugs\registerDrug.sqf";};
	class executeDrug:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Drugs\executeDrug.sqf";};
	
	class addMorphine:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Drugs\Morphine\addMorphine.sqf";};
	class getMorphine:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Drugs\Morphine\getMorphine.sqf";};
	class setMorphine:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Drugs\Morphine\setMorphine.sqf";};
	
	class addAdrenaline:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Drugs\Adrenaline\addAdrenaline.sqf";};
	class getAdrenaline:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Drugs\Adrenaline\getAdrenaline.sqf";};
	class setAdrenaline:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Drugs\Adrenaline\setAdrenaline.sqf";};
	
	class addNaloxone:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Drugs\Naloxone\addNaloxone.sqf";};
	class getNaloxone:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Drugs\Naloxone\getNaloxone.sqf";};
	class setNaloxone:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Drugs\Naloxone\setNaloxone.sqf";};
	
	class addAspirin:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Drugs\Aspirin\addAspirin.sqf";};
	class getAspirin:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Drugs\Aspirin\getAspirin.sqf";};
	class setAspirin:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Drugs\Aspirin\setAspirin.sqf";};
};
class Hearing
{
	class addHearing:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Hearing\addHearing.sqf";};
	class getHearing:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Hearing\getHearing.sqf";};
	class setHearing:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Hearing\setHearing.sqf";};
};
class Respiratory
{
	class addRespiratory:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\Respiratory\addRespiratory.sqf";};
	class getRespiratory:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\Respiratory\getRespiratory.sqf";};
	class setRespiratory:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\Respiratory\setRespiratory.sqf";};
	
	class setToungeBlocking:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\Respiratory\setToungeBlocking.sqf";};
	class getToungeBlocking:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\Respiratory\getToungeBlocking.sqf";};
	class setArrestPresent:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\Respiratory\setArrestPresent.sqf";};
	class getArrestPresent:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\Respiratory\getArrestPresent.sqf";};
	
	class getNasopharyngeal:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\Respiratory\Nasopharyngeal\getNasopharyngeal.sqf";};
	class setNasopharyngeal:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\Respiratory\Nasopharyngeal\setNasopharyngeal.sqf";};
	class getKingLt:X39_XLib_Function_TypeA														{file = "\X39_MS2_Scripting\Functions\Respiratory\KingLt\getkingLt.sqf";};
	class setKingLt:X39_XLib_Function_TypeA														{file = "\X39_MS2_Scripting\Functions\Respiratory\KingLt\setkingLt.sqf";};
	class getBagvalveMask:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\Respiratory\BagvalveMask\getBagvalveMask.sqf";};
	class setBagvalveMask:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\Respiratory\BagvalveMask\setBagvalveMask.sqf";};
};
class Heart
{
	class addHeartPulse:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Heart\addHeartPulse.sqf";};
	class getHeartPulse:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Heart\getHeartPulse.sqf";};
	class setHeartPulse:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Heart\setHeartPulse.sqf";};
	
	class setFlatLine:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Heart\setFlatLine.sqf";};
	class hasFlatLine:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Heart\hasFlatLine.sqf";};
	
	class getCprPresent:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Heart\getCprPresent.sqf";};
	class setCprPresent:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Heart\setCprPresent.sqf";};
	class addCprCount:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Heart\addCprCount.sqf";};
	class getCprCount:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Heart\getCprCount.sqf";};
	class setCprCount:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Heart\setCprCount.sqf";};
};
class Temperature
{
	class addTemperature:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\Temperature\addTemperature.sqf";};
	class getTemperature:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\Temperature\getTemperature.sqf";};
	class setTemperature:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\Temperature\setTemperature.sqf";};
	class addWetness:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Temperature\addWetness.sqf";};
	class getWetness:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Temperature\getWetness.sqf";};
	class setWetness:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Temperature\setWetness.sqf";};
};
class Hallucinations
{
	class registerHallucination:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\Hallucinations\registerHallucination.sqf";};
	
	class hallu_testHallucination:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\Hallucinations\testHallucination.sqf";};
};
class XMSTicks
{
	class respiratoryTick:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\XMSTicks\respiratoryTick.sqf";};
	class heartTick:X39_XLib_Function_TypeA														{file = "\X39_MS2_Scripting\Functions\XMSTicks\heartTick.sqf";};
	class updateOverlay:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\XMSTicks\updateOverlay.sqf";};
	class effectHandleTick:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\XMSTicks\effectHandleTick.sqf";};
	class temperatureTick:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\XMSTicks\temperatureTick.sqf";};
	class hearingTick:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\XMSTicks\hearingTick.sqf";};
	class distractionTick:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\XMSTicks\distractionTick.sqf";};
	class painTick:X39_XLib_Function_TypeA														{file = "\X39_MS2_Scripting\Functions\XMSTicks\painTick.sqf";};
	class bleedingTick:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\XMSTicks\bleedingTick.sqf";};
	class soundTick:X39_XLib_Function_TypeA														{file = "\X39_MS2_Scripting\Functions\XMSTicks\soundTick.sqf";};
	class itemReplacerTick:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\XMSTicks\itemReplacerTick.sqf";};
	class drugsSimulationTick:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\XMSTicks\drugsSimulationTick.sqf";};
	class DebugTick:X39_XLib_Function_TypeA														{file = "\X39_MS2_Scripting\Functions\XMSTicks\DebugTick.sqf";};
	class hitPartTick:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\XMSTicks\hitPartTick.sqf";};
	class hallucinationTick:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\XMSTicks\hallucinationTick.sqf";};
	class timeIntensiveCallsTick:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\XMSTicks\timeIntensiveCallsTick.sqf";};
	
	class publishTick:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\XMSTicks\publishTick.sqf";};
};
class LimitationSystem
{
	class ls_assignLimitationClass:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\LimitationSystem\assignLimitationClass.sqf";};
	class ls_assignLimitationObject:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\LimitationSystem\assignLimitationObject.sqf";};
	class ls_commitChanges:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\LimitationSystem\commitChanges.sqf";};
	class ls_convertLimitation:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\LimitationSystem\convertLimitation.sqf";};
	class ls_createLimitationClass:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\LimitationSystem\createLimitationClass.sqf";};
	class ls_createLimitationObject:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\LimitationSystem\createLimitationObject.sqf";};
	class ls_isAllowedToUse:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\LimitationSystem\isAllowedToUse.sqf";};
	class ls_registerLimitation:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\LimitationSystem\registerLimitation.sqf";};
};
class Modules
{
	class Module_BaseModule:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\Modules\Module_BaseModule.sqf";};
};
class DialogControl_BlackOutDialog
{
	class blackOutDialog_createDialog:X39_XLib_Function_TypeA									{file = "\X39_MS2_Scripting\Functions\DialogControl\BlackOutDialog\createDialog.sqf";};
	class blackOutDialog_closeDialog:X39_XLib_Function_TypeA									{file = "\X39_MS2_Scripting\Functions\DialogControl\BlackOutDialog\closeDialog.sqf";};
};
class DialogControl_Overlay
{
	class overlay_createDisplay:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\DialogControl\Overlay\createDisplay.sqf";};
	class overlay_destroyDisplay:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\DialogControl\Overlay\destroyDisplay.sqf";};
	class overlay_showHitMarker:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\DialogControl\Overlay\showHitMarker.sqf";};
	class setProgressBarTimeout:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\DialogControl\Overlay\setProgressBarTimeout.sqf";};
	class clearProgressBarTimeout:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\DialogControl\Overlay\clearProgressBarTimeout.sqf";};
};
class DialogControl_UnitSelection
{
	class unitSelection_openDialog:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\DialogControl\UnitSelectionUi\createDialog.sqf";};
};
class DialogControl_MedicalUi
{
	class registerMedicalUiStatusEffect:X39_XLib_Function_TypeA									{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalUi\registerMedicalUiStatusEffect.sqf";};
	class registerQuickAction:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalUi\registerQuickAction.sqf";};
	class MedicalUi_DiagnosticFrame_setVisibilityState:X39_XLib_Function_TypeA					{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalUi\DiagnosticFrame\MedicalUi_DiagnosticFrame_setVisibilityState.sqf";};
	class MedicalUi_btnDiagnosisPerformCheckUnit:X39_XLib_Function_TypeA						{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalUi\DiagnosticFrame\MedicalUi_btnDiagnosisPerformCheckUnit.sqf";};
	class MedicalUi_DrugsFrame_setVisibilityState:X39_XLib_Function_TypeA						{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalUi\DrugsFrame\MedicalUi_DrugsFrame_setVisibilityState.sqf";};
	class MedicalUi_DrugsFrame_applyDrug:X39_XLib_Function_TypeA								{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalUi\DrugsFrame\MedicalUi_DrugsFrame_applyDrug.sqf";};
	class MedicalUi_QuickActionFrame_setVisibilityState:X39_XLib_Function_TypeA					{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalUi\QuickActionFrame\MedicalUi_QuickActionFrame_setVisibilityState.sqf";};
	class MedicalUi_TriageCardFrame_setVisibilityState:X39_XLib_Function_TypeA					{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalUi\TriageCardFrame\MedicalUi_TriageCardFrame_setVisibilityState.sqf";};
	class MedicalUi_createDialog:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalUi\MedicalUi_createDialog.sqf";};
	class MedicalUi_closeDialog:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalUi\MedicalUi_closeDialog.sqf";};
	class setTriageCard:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalUi\setTriageCard.sqf";};
	class setTriageState:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalUi\setTriageState.sqf";};
	class getTriageCard:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalUi\getTriageCard.sqf";};
	class getTriageState:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalUi\getTriageState.sqf";};
	class MedicalUI_addGivenMessageToTriageCard:X39_XLib_Function_TypeA							{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalUi\addGivenMessageToTriageCard.sqf";};
	class MedicalUi_SetBodyViewType:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalUi\MedicalUi_SetBodyViewType.sqf";};
	class MedicalUi_HitZones_UpdateStatusEffects:X39_XLib_Function_TypeA						{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalUi\HitZones\MedicalUi_HitZones_UpdateStatusEffects.sqf";};
	class MedicalUi_HitZones_CreateMenu:X39_XLib_Function_TypeA									{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalUi\HitZones\MedicalUi_HitZones_CreateMenu.sqf";};

	class MedicalUi_outputBlockedMessage:X39_XLib_Function_TypeA								{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalUi\errorMessageOutputs\outputBlockedMessage.sqf";};
	class MedicalUi_outputNothingSelectedMessage:X39_XLib_Function_TypeA						{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalUi\errorMessageOutputs\outputNothingSelectedMessage.sqf";};
	class MedicalUi_outputCannotBeAppliedOnThisPartMessage:X39_XLib_Function_TypeA				{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalUi\errorMessageOutputs\outputCannotBeAppliedOnThisPartMessage.sqf";};
};
class MedcialActions
{
	class registerAction:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\MedicalActions\registerAction.sqf";};
	class getActionById:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\MedicalActions\getActionById.sqf";};
	
	class MA_defibrillate:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\MedicalActions\defibrillate.sqf";};
};