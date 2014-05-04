class CfgPatches{
	class X39_MS2_Scripting{
         units[] = {};
         weapons[] = {};
         requiredVersion = 1.0;
         requiredAddons[] = {"X39_XLib_Core", "X39_MS2_Settings", "X39_MS2_Factions", "X39_MS2_Resources", "X39_MS2_UIs"};
         author = "X39|Cpt. HM Murdock";
         mail = "killerx29@gmail.com";
	};
};

class X39_XLib_Function_TypeA;
class X39_XLib_Function_TypeB;
class X39_XLib_Function_TypeC;

class CfgFunctions 
{
	class X39_MS2
	{
		class General //Functions without any categoriy
		{
			class initUnit:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\initUnit.sqf";};
			class registerTickHandler:X39_XLib_Function_TypeA								{file = "\X39_MS2_Scripting\Functions\registerTickHandler.sqf";};
			class runTicker:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\runTicker.sqf";};
			class blackOutUnit:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\blackOutUnit.sqf";};
			class isBlackedOut:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\isBlackedOut.sqf";};
			class getBlackOutStage:X39_XLib_Function_TypeA									{file = "\X39_MS2_Scripting\Functions\getBlackOutStage.sqf";};
			class applyPPEffects:X39_XLib_Function_TypeA									{file = "\X39_MS2_Scripting\Functions\applyPPEffects.sqf";};
			class resetPPEffects:X39_XLib_Function_TypeA									{file = "\X39_MS2_Scripting\Functions\resetPPEffects.sqf";};
			class addEffect:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\addEffect.sqf";};
			class messagePlayer:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\messagePlayer.sqf";};
			class applyServerConfig:X39_XLib_Function_TypeA									{file = "\X39_MS2_Scripting\Functions\applyServerConfig.sqf";};
		};
		class InitModFunctions //Functions for initMod
		{
			class initMod:X39_XLib_Function_TypeB											{file = "\X39_MS2_Scripting\Functions\initMod.sqf";};
			class IMH_registerMedicalActions:X39_XLib_Function_TypeB						{file = "\X39_MS2_Scripting\Functions\initModHelpers\registerMedicalActions.sqf";};
			class IMH_addMedicalMessages:X39_XLib_Function_TypeB							{file = "\X39_MS2_Scripting\Functions\initModHelpers\addMedicalMessages.sqf";};
			class IMH_addInteractionMenuEntries:X39_XLib_Function_TypeB						{file = "\X39_MS2_Scripting\Functions\initModHelpers\addInteractionMenuEntries.sqf";};
		};
		class Damage
		{
			class addDamageToBody:X39_XLib_Function_TypeA									{file = "X39_MS2_Scripting\Functions\Damage\adder\addDamageToBody.sqf";};
			class addDamageToGeneric:X39_XLib_Function_TypeA								{file = "X39_MS2_Scripting\Functions\Damage\adder\addDamageToGeneric.sqf";};
			class addDamageToHands:X39_XLib_Function_TypeA									{file = "X39_MS2_Scripting\Functions\Damage\adder\addDamageToHands.sqf";};
			class addDamageToHead:X39_XLib_Function_TypeA									{file = "X39_MS2_Scripting\Functions\Damage\adder\addDamageToHead.sqf";};
			class addDamageToLegs:X39_XLib_Function_TypeA									{file = "X39_MS2_Scripting\Functions\Damage\adder\addDamageToLegs.sqf";};
			
			class setDamageOfBody:X39_XLib_Function_TypeA									{file = "X39_MS2_Scripting\Functions\Damage\setter\setDamageOfBody.sqf";};
			class setDamageOfGeneric:X39_XLib_Function_TypeA								{file = "X39_MS2_Scripting\Functions\Damage\setter\setDamageOfGeneric.sqf";};
			class setDamageOfHands:X39_XLib_Function_TypeA									{file = "X39_MS2_Scripting\Functions\Damage\setter\setDamageOfHands.sqf";};
			class setDamageOfHead:X39_XLib_Function_TypeA									{file = "X39_MS2_Scripting\Functions\Damage\setter\setDamageOfHead.sqf";};
			class setDamageOfLegs:X39_XLib_Function_TypeA									{file = "X39_MS2_Scripting\Functions\Damage\setter\setDamageOfLegs.sqf";};
			
			class getDamageOfBody:X39_XLib_Function_TypeA									{file = "X39_MS2_Scripting\Functions\Damage\getter\getDamageOfBody.sqf";};
			class getDamageOfGeneric:X39_XLib_Function_TypeA								{file = "X39_MS2_Scripting\Functions\Damage\getter\getDamageOfGeneric.sqf";};
			class getDamageOfHands:X39_XLib_Function_TypeA									{file = "X39_MS2_Scripting\Functions\Damage\getter\getDamageOfHands.sqf";};
			class getDamageOfHead:X39_XLib_Function_TypeA									{file = "X39_MS2_Scripting\Functions\Damage\getter\getDamageOfHead.sqf";};
			class getDamageOfLegs:X39_XLib_Function_TypeA									{file = "X39_MS2_Scripting\Functions\Damage\getter\getDamageOfLegs.sqf";};
			
			class getColorArrayFromDamageValue:X39_XLib_Function_TypeA						{file = "X39_MS2_Scripting\Functions\Damage\getColorArrayFromDamageValue.sqf";};
			class getDamageTotal:X39_XLib_Function_TypeA									{file = "X39_MS2_Scripting\Functions\Damage\getDamageTotal.sqf";};
			class getMaxDamageTotal:X39_XLib_Function_TypeA									{file = "X39_MS2_Scripting\Functions\Damage\getMaxDamageTotal.sqf";};
		};
		class Bleeding
		{
			class addBleedingToBody:X39_XLib_Function_TypeA									{file = "X39_MS2_Scripting\Functions\Bleeding\adder\addBleedingToBody.sqf";};
			class addBleedingToGeneric:X39_XLib_Function_TypeA								{file = "X39_MS2_Scripting\Functions\Bleeding\adder\addBleedingToGeneric.sqf";};
			class addBleedingToHands:X39_XLib_Function_TypeA								{file = "X39_MS2_Scripting\Functions\Bleeding\adder\addBleedingToHands.sqf";};
			class addBleedingToHead:X39_XLib_Function_TypeA									{file = "X39_MS2_Scripting\Functions\Bleeding\adder\addBleedingToHead.sqf";};
			class addBleedingToLegs:X39_XLib_Function_TypeA									{file = "X39_MS2_Scripting\Functions\Bleeding\adder\addBleedingToLegs.sqf";};
			class addBlood:X39_XLib_Function_TypeA											{file = "X39_MS2_Scripting\Functions\Bleeding\adder\addBlood.sqf";};
			
			class setBleedingOfBody:X39_XLib_Function_TypeA									{file = "X39_MS2_Scripting\Functions\Bleeding\setter\setBleedingOfBody.sqf";};
			class setBleedingOfGeneric:X39_XLib_Function_TypeA								{file = "X39_MS2_Scripting\Functions\Bleeding\setter\setBleedingOfGeneric.sqf";};
			class setBleedingOfHands:X39_XLib_Function_TypeA								{file = "X39_MS2_Scripting\Functions\Bleeding\setter\setBleedingOfHands.sqf";};
			class setBleedingOfHead:X39_XLib_Function_TypeA									{file = "X39_MS2_Scripting\Functions\Bleeding\setter\setBleedingOfHead.sqf";};
			class setBleedingOfLegs:X39_XLib_Function_TypeA									{file = "X39_MS2_Scripting\Functions\Bleeding\setter\setBleedingOfLegs.sqf";};
			class setBlood:X39_XLib_Function_TypeA											{file = "X39_MS2_Scripting\Functions\Bleeding\setter\setBlood.sqf";};
			
			class getBleedingOfBody:X39_XLib_Function_TypeA									{file = "X39_MS2_Scripting\Functions\Bleeding\getter\getBleedingOfBody.sqf";};
			class getBleedingOfGeneric:X39_XLib_Function_TypeA								{file = "X39_MS2_Scripting\Functions\Bleeding\getter\getBleedingOfGeneric.sqf";};
			class getBleedingOfHands:X39_XLib_Function_TypeA								{file = "X39_MS2_Scripting\Functions\Bleeding\getter\getBleedingOfHands.sqf";};
			class getBleedingOfHead:X39_XLib_Function_TypeA									{file = "X39_MS2_Scripting\Functions\Bleeding\getter\getBleedingOfHead.sqf";};
			class getBleedingOfLegs:X39_XLib_Function_TypeA									{file = "X39_MS2_Scripting\Functions\Bleeding\getter\getBleedingOfLegs.sqf";};
			class getBlood:X39_XLib_Function_TypeA											{file = "X39_MS2_Scripting\Functions\Bleeding\getter\getBlood.sqf";};
		};
		class Callback
		{
			class cb_Explosion:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\Callback\cb_Explosion.sqf";};
			class cb_FiredNear:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\Callback\cb_FiredNear.sqf";};
			class cb_HandleDamage:X39_XLib_Function_TypeA									{file = "\X39_MS2_Scripting\Functions\Callback\cb_HandleDamage.sqf";};
			class cb_KeyDown:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\Callback\cb_KeyDown.sqf";};
			class cb_AnimStateChanged:X39_XLib_Function_TypeA								{file = "\X39_MS2_Scripting\Functions\Callback\cb_AnimStateChanged.sqf";};
		};
		class Pain
		{
			class addPain:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\Pain\addPain.sqf";};
			class getPain:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\Pain\getPain.sqf";};
			class getMaxPain:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\Pain\getMaxPain.sqf";};
			class setPain:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\Pain\setPain.sqf";};
			class addMorphine:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\Pain\addMorphine.sqf";};
			class getMorphine:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\Pain\getMorphine.sqf";};
			class setMorphine:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\Pain\setMorphine.sqf";};
		};
		class Hearing
		{
			class addHearing:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\Hearing\addHearing.sqf";};
			class getHearing:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\Hearing\getHearing.sqf";};
			class setHearing:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\Hearing\setHearing.sqf";};
		};
		class Adrenaline
		{
			class addAdrenaline:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\Adrenaline\addAdrenaline.sqf";};
			class getAdrenaline:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\Adrenaline\getAdrenaline.sqf";};
			class setAdrenaline:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\Adrenaline\setAdrenaline.sqf";};
			class addHeartPulse:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\Adrenaline\addHeartPulse.sqf";};
			class getHeartPulse:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\Adrenaline\getHeartPulse.sqf";};
			class setHeartPulse:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\Adrenaline\setHeartPulse.sqf";};
			
			class setFlatLine:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\Adrenaline\setFlatLine.sqf";};
			class hasFlatLine:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\Adrenaline\hasFlatLine.sqf";};
			class doHeartPulseDependingActions:X39_XLib_Function_TypeA						{file = "\X39_MS2_Scripting\Functions\Adrenaline\doHeartPulseDependingActions.sqf";};
		};
		class Temperature
		{
			class addTemperature:X39_XLib_Function_TypeA									{file = "\X39_MS2_Scripting\Functions\Temperature\addTemperature.sqf";};
			class getTemperature:X39_XLib_Function_TypeA									{file = "\X39_MS2_Scripting\Functions\Temperature\getTemperature.sqf";};
			class setTemperature:X39_XLib_Function_TypeA									{file = "\X39_MS2_Scripting\Functions\Temperature\setTemperature.sqf";};
		};
		class XMSTicks
		{
			class adrenalineTick:X39_XLib_Function_TypeA									{file = "\X39_MS2_Scripting\Functions\XMSTicks\adrenalineTick.sqf";};
			class updateOverlay:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\XMSTicks\updateOverlay.sqf";};
			class effectHandleTick:X39_XLib_Function_TypeA									{file = "\X39_MS2_Scripting\Functions\XMSTicks\effectHandleTick.sqf";};
			class temperatureTick:X39_XLib_Function_TypeA									{file = "\X39_MS2_Scripting\Functions\XMSTicks\temperatureTick.sqf";};
			class hearingTick:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\XMSTicks\hearingTick.sqf";};
			class painTick:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\XMSTicks\painTick.sqf";};
			class bleedingTick:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\XMSTicks\bleedingTick.sqf";};
			class soundTick:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\XMSTicks\soundTick.sqf";};
			class DebugTick:X39_XLib_Function_TypeA											{file = "\X39_MS2_Scripting\Functions\XMSTicks\DebugTick.sqf";};
			
			class publishTick:X39_XLib_Function_TypeA										{file = "\X39_MS2_Scripting\Functions\XMSTicks\publishTick.sqf";};
		};
		class LimitationSystem
		{
			class isAllowedToUse:X39_XLib_Function_TypeA									{file = "\X39_MS2_Scripting\Functions\LimitationSystem\isAllowedToUse.sqf";};
		};
		class DialogControl_BlackOutDialog
		{
			class blackOutDialog_createDialog:X39_XLib_Function_TypeA						{file = "\X39_MS2_Scripting\Functions\DialogControl\BlackOutDialog\createDialog.sqf";};
		};
		class DialogControl_Overlay
		{
			class overlay_createDisplay:X39_XLib_Function_TypeA								{file = "\X39_MS2_Scripting\Functions\DialogControl\Overlay\createDisplay.sqf";};
		};
		class DialogControl_InteractionMenu
		{
			class interactionMenu_openDialog:X39_XLib_Function_TypeA						{file = "\X39_MS2_Scripting\Functions\DialogControl\InteractionMenu\openDialog.sqf";};
		};
		class DialogControl_MedicalActionMenu
		{
			class MedicalActionMenu_btnAddSelectedToTriageCard:X39_XLib_Function_TypeA		{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\btnAddSelectedToTriageCard.sqf";};
			class MedicalActionMenu_btnAddToTriageCard:X39_XLib_Function_TypeA				{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\btnAddToTriageCard.sqf";};
			class MedicalActionMenu_btnApplyTriageCardChanges:X39_XLib_Function_TypeA		{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\btnApplyTriageCardChanges.sqf";};
			class MedicalActionMenu_btnCheckUnit:X39_XLib_Function_TypeA					{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\btnCheckUnit.sqf";};
			class MedicalActionMenu_btnClearTriageCard:X39_XLib_Function_TypeA				{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\btnClearTriageCard.sqf";};
			class MedicalActionMenu_btnPerformAction:X39_XLib_Function_TypeA				{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\btnPerformAction.sqf";};
			class MedicalActionMenu_btnRemoveSelectedFromTriageCard:X39_XLib_Function_TypeA	{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\btnRemoveSelectedFromTriageCard.sqf";};
			class MedicalActionMenu_createDialog:X39_XLib_Function_TypeA					{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\createDialog.sqf";};
			class MedicalActionMenu_outputBlockedMessage:X39_XLib_Function_TypeA			{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\outputBlockedMessage.sqf";};
			class MedicalActionMenu_outputNothingSelectedMessage:X39_XLib_Function_TypeA	{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\outputNothingSelectedMessage.sqf";};
			class MedicalActionMenu_outputMissingItemsMessage:X39_XLib_Function_TypeA		{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\outputMissingItemsMessage.sqf";};
		};
		class MedcialActions
		{
			class registerAction:X39_XLib_Function_TypeA									{file = "\X39_MS2_Scripting\Functions\MedicalActions\registerAction.sqf";};
			class MA_defibrillate:X39_XLib_Function_TypeA									{file = "\X39_MS2_Scripting\Functions\MedicalActions\defibrillate.sqf";};
		};
	};
};