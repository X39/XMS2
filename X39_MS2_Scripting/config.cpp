class CfgPatches{
	class X39_MS2_Scripting{
         units[] = {"X39_MS2_veh_BaseModule"};
         weapons[] = {};
         requiredVersion = 1.0;
         requiredAddons[] = {"X39_XLib_Core", "X39_MS2_Settings", "X39_MS2_Factions", "X39_MS2_Resources", "X39_MS2_UIs", "X39_XLib_ActionDialog"};
         author = "X39|Cpt. HM Murdock";
         mail = "killerx29@gmail.com";
	};
};


class X39_XLib_Function_TypeA;
class X39_XLib_Function_TypeB;
class X39_XLib_Function_TypeC;

class CfgVehicles
{
	#include "modules.cpp"
};

class CfgFunctions 
{
	class X39_MS2
	{
		class General //Functions without any categoriy
		{
			class initUnit:X39_XLib_Function_TypeA														{file = "\X39_MS2_Scripting\Functions\initUnit.sqf";};
			class isUnitXms2Unit:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\isUnitXms2Unit.sqf";};
			class runTicker:X39_XLib_Function_TypeA														{file = "\X39_MS2_Scripting\Functions\runTicker.sqf";};
			class blackOutUnit:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\blackOutUnit.sqf";};
			class isBlackedOut:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\isBlackedOut.sqf";};
			class getBlackOutStage:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\getBlackOutStage.sqf";};
			class applyPPEffects:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\applyPPEffects.sqf";};
			class resetPPEffects:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\resetPPEffects.sqf";};
			class addEffect:X39_XLib_Function_TypeA														{file = "\X39_MS2_Scripting\Functions\addEffect.sqf";};
			class messagePlayer:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\messagePlayer.sqf";};
			class killUnit:X39_XLib_Function_TypeA														{file = "\X39_MS2_Scripting\Functions\killUnit.sqf";};
			class registerTickHandler:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\registerTickHandler.sqf";};
			class registerMedicalMessage:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\registerMedicalMessage.sqf";};
			
			class applyServerConfig:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\applyServerConfig.sqf";};
			class applyClientConfig:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\applyClientConfig.sqf";};
			class resetUnitsVariables:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\resetUnitsVariables.sqf";};
			
			class serverMessageSystem:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\serverMessageSystem.sqf";};
		};
		class InitModFunctions //Functions for initMod
		{
			class initMod:X39_XLib_Function_TypeB														{file = "\X39_MS2_Scripting\Functions\initMod.sqf";};
			class postInit:X39_XLib_Function_TypeC														{file = "\X39_MS2_Scripting\Functions\postInit.sqf";};
			class IMH_registerMedicalActions:X39_XLib_Function_TypeA									{file = "\X39_MS2_Scripting\Functions\initModHelpers\registerMedicalActions.sqf";};
			class IMH_addMedicalMessages:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\initModHelpers\addMedicalMessages.sqf";};
			class IMH_addInteractionMenuEntries:X39_XLib_Function_TypeA									{file = "\X39_MS2_Scripting\Functions\initModHelpers\addInteractionMenuEntries.sqf";};
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
			class addMorphine:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Drugs\Morphine\addMorphine.sqf";};
			class getMorphine:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Drugs\Morphine\getMorphine.sqf";};
			class setMorphine:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Drugs\Morphine\setMorphine.sqf";};
			
			class addAdrenaline:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Drugs\Adrenaline\addAdrenaline.sqf";};
			class getAdrenaline:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Drugs\Adrenaline\getAdrenaline.sqf";};
			class setAdrenaline:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Drugs\Adrenaline\setAdrenaline.sqf";};
			
			class addNaloxone:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Drugs\Naloxone\addNaloxone.sqf";};
			class getNaloxone:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Drugs\Naloxone\getNaloxone.sqf";};
			class setNaloxone:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Drugs\Naloxone\setNaloxone.sqf";};
		};
		class Hearing
		{
			class addHearing:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Hearing\addHearing.sqf";};
			class getHearing:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Hearing\getHearing.sqf";};
			class setHearing:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Hearing\setHearing.sqf";};
		};
		class Heart
		{
			class addHeartPulse:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Heart\addHeartPulse.sqf";};
			class getHeartPulse:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Heart\getHeartPulse.sqf";};
			class setHeartPulse:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Heart\setHeartPulse.sqf";};
			
			class setFlatLine:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Heart\setFlatLine.sqf";};
			class hasFlatLine:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\Heart\hasFlatLine.sqf";};
		};
		class Temperature
		{
			class addTemperature:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\Temperature\addTemperature.sqf";};
			class getTemperature:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\Temperature\getTemperature.sqf";};
			class setTemperature:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\Temperature\setTemperature.sqf";};
		};
		class XMSTicks
		{
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
			
			class publishTick:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\XMSTicks\publishTick.sqf";};
		};
		class LimitationSystem
		{
			class isAllowedToUse:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\LimitationSystem\isAllowedToUse.sqf";};
		};
		class Modules
		{
			class Module_BaseModule:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\Modules\Module_BaseModule.sqf";};
		};
		class DialogControl_BlackOutDialog
		{
			class blackOutDialog_createDialog:X39_XLib_Function_TypeA									{file = "\X39_MS2_Scripting\Functions\DialogControl\BlackOutDialog\createDialog.sqf";};
		};
		class DialogControl_Overlay
		{
			class overlay_createDisplay:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\DialogControl\Overlay\createDisplay.sqf";};
			class overlay_showHitMarker:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\DialogControl\Overlay\showHitMarker.sqf";};
		};
		class DialogControl_UnitSelection
		{
			class unitSelection_openDialog:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\DialogControl\UnitSelectionUi\createDialog.sqf";};
		};
		class DialogControl_MedicalActionMenu
		{
			class setTriageCard:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\setTriageCard.sqf";};
			class setTriageState:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\setTriageState.sqf";};
			class getTriageCard:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\getTriageCard.sqf";};
			class getTriageState:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\getTriageState.sqf";};
			class MedicalActionMenu_createDialog:X39_XLib_Function_TypeA								{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\createDialog.sqf";};
			class MedicalActionMenu_btnDiagnosisPerformCheckUnit:X39_XLib_Function_TypeA				{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\btnDiagnosisPerformCheckUnit.sqf";};
			class MedicalActionMenu_btnDiagnosisAddSelectedEntryToTriageCard:X39_XLib_Function_TypeA	{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\btnDiagnosisAddSelectedEntryToTriageCard.sqf";};
			class MedicalActionMenu_btnTriageCardResetTriageCard:X39_XLib_Function_TypeA				{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\btnTriageCardResetTriageCard.sqf";};
			class MedicalActionMenu_btnTriageCardRemoveSelectedEntry:X39_XLib_Function_TypeA			{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\btnTriageCardRemoveSelectedEntry.sqf";};
			class MedicalActionMenu_btnPerformAction:X39_XLib_Function_TypeA							{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\btnPerformAction.sqf";};

			class MedicalActionMenu_outputBlockedMessage:X39_XLib_Function_TypeA						{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\outputBlockedMessage.sqf";};
			class MedicalActionMenu_outputNothingSelectedMessage:X39_XLib_Function_TypeA				{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\outputNothingSelectedMessage.sqf";};
			class MedicalActionMenu_outputMissingItemsMessage:X39_XLib_Function_TypeA					{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\outputMissingItemsMessage.sqf";};
			class MedicalActionMenu_outputCannotBeAppliedOnThisPartMessage:X39_XLib_Function_TypeA		{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\outputCannotBeAppliedOnThisPartMessage.sqf";};
			class MedicalActionMenu_updateCraftingOutput:X39_XLib_Function_TypeA						{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\updateCraftingOutput.sqf";};
			class MedicalActionMenu_addGivenMessageToTriageCard:X39_XLib_Function_TypeA					{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\addGivenMessageToTriageCard.sqf";};
		};
		class MedcialActions
		{
			class registerAction:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\MedicalActions\registerAction.sqf";};
			class getActionById:X39_XLib_Function_TypeA													{file = "\X39_MS2_Scripting\Functions\MedicalActions\getActionById.sqf";};
			
			class MA_defibrillate:X39_XLib_Function_TypeA												{file = "\X39_MS2_Scripting\Functions\MedicalActions\defibrillate.sqf";};
		};
	};
};