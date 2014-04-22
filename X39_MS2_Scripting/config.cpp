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
			class initMod:X39_XLib_Function_TypeB								{file = "\X39_MS2_Scripting\Functions\initMod.sqf";};
			class initUnit:X39_XLib_Function_TypeA								{file = "\X39_MS2_Scripting\Functions\initUnit.sqf";};
			class registerTickHandler:X39_XLib_Function_TypeA					{file = "\X39_MS2_Scripting\Functions\registerTickHandler.sqf";};
			class runTicker:X39_XLib_Function_TypeA								{file = "\X39_MS2_Scripting\Functions\runTicker.sqf";};
			class blackOutUnit:X39_XLib_Function_TypeA							{file = "\X39_MS2_Scripting\Functions\blackOutUnit.sqf";};
			class applyPPEffects:X39_XLib_Function_TypeA						{file = "\X39_MS2_Scripting\Functions\applyPPEffects.sqf";};
			class resetPPEffects:X39_XLib_Function_TypeA						{file = "\X39_MS2_Scripting\Functions\resetPPEffects.sqf";};
			class addEffect:X39_XLib_Function_TypeA								{file = "\X39_MS2_Scripting\Functions\addEffect.sqf";};
		};
		class Damage
		{
			class addDamageToBody:X39_XLib_Function_TypeA						{file = "X39_MS2_Scripting\Functions\Damage\adder\addDamageToBody.sqf";};
			class addDamageToGeneric:X39_XLib_Function_TypeA					{file = "X39_MS2_Scripting\Functions\Damage\adder\addDamageToGeneric.sqf";};
			class addDamageToHands:X39_XLib_Function_TypeA						{file = "X39_MS2_Scripting\Functions\Damage\adder\addDamageToHands.sqf";};
			class addDamageToHead:X39_XLib_Function_TypeA						{file = "X39_MS2_Scripting\Functions\Damage\adder\addDamageToHead.sqf";};
			class addDamageToLegs:X39_XLib_Function_TypeA						{file = "X39_MS2_Scripting\Functions\Damage\adder\addDamageToLegs.sqf";};
			
			class setDamageOfBody:X39_XLib_Function_TypeA						{file = "X39_MS2_Scripting\Functions\Damage\setter\setDamageOfBody.sqf";};
			class setDamageOfGeneric:X39_XLib_Function_TypeA					{file = "X39_MS2_Scripting\Functions\Damage\setter\setDamageOfGeneric.sqf";};
			class setDamageOfHands:X39_XLib_Function_TypeA						{file = "X39_MS2_Scripting\Functions\Damage\setter\setDamageOfHands.sqf";};
			class setDamageOfHead:X39_XLib_Function_TypeA						{file = "X39_MS2_Scripting\Functions\Damage\setter\setDamageOfHead.sqf";};
			class setDamageOfLegs:X39_XLib_Function_TypeA						{file = "X39_MS2_Scripting\Functions\Damage\setter\setDamageOfLegs.sqf";};
			
			class getDamageOfBody:X39_XLib_Function_TypeA						{file = "X39_MS2_Scripting\Functions\Damage\getter\getDamageOfBody.sqf";};
			class getDamageOfGeneric:X39_XLib_Function_TypeA					{file = "X39_MS2_Scripting\Functions\Damage\getter\getDamageOfGeneric.sqf";};
			class getDamageOfHands:X39_XLib_Function_TypeA						{file = "X39_MS2_Scripting\Functions\Damage\getter\getDamageOfHands.sqf";};
			class getDamageOfHead:X39_XLib_Function_TypeA						{file = "X39_MS2_Scripting\Functions\Damage\getter\getDamageOfHead.sqf";};
			class getDamageOfLegs:X39_XLib_Function_TypeA						{file = "X39_MS2_Scripting\Functions\Damage\getter\getDamageOfLegs.sqf";};
			
			class getColorArrayFromDamageValue:X39_XLib_Function_TypeA			{file = "X39_MS2_Scripting\Functions\Damage\getColorArrayFromDamageValue.sqf";};
			class getDamageTotal:X39_XLib_Function_TypeA						{file = "X39_MS2_Scripting\Functions\Damage\getDamageTotal.sqf";};
		};
		class Callback
		{
			class cb_Explosion:X39_XLib_Function_TypeA							{file = "\X39_MS2_Scripting\Functions\Callback\cb_Explosion.sqf";};
			class cb_FiredNear:X39_XLib_Function_TypeA							{file = "\X39_MS2_Scripting\Functions\Callback\cb_FiredNear.sqf";};
			class cb_HandleDamage:X39_XLib_Function_TypeA						{file = "\X39_MS2_Scripting\Functions\Callback\cb_HandleDamage.sqf";};
			class cb_KeyDown:X39_XLib_Function_TypeA							{file = "\X39_MS2_Scripting\Functions\Callback\cb_KeyDown.sqf";};
		};
		class Pain
		{
			class addPain:X39_XLib_Function_TypeA								{file = "\X39_MS2_Scripting\Functions\Pain\addPain.sqf";};
			class getPain:X39_XLib_Function_TypeA								{file = "\X39_MS2_Scripting\Functions\Pain\getPain.sqf";};
			class setPain:X39_XLib_Function_TypeA								{file = "\X39_MS2_Scripting\Functions\Pain\setPain.sqf";};
		};
		class Adrenaline
		{
			class addAdrenaline:X39_XLib_Function_TypeA							{file = "\X39_MS2_Scripting\Functions\Adrenaline\addAdrenaline.sqf";};
			class getAdrenaline:X39_XLib_Function_TypeA							{file = "\X39_MS2_Scripting\Functions\Adrenaline\getAdrenaline.sqf";};
			class setAdrenaline:X39_XLib_Function_TypeA							{file = "\X39_MS2_Scripting\Functions\Adrenaline\setAdrenaline.sqf";};
			class addHeartPulse:X39_XLib_Function_TypeA							{file = "\X39_MS2_Scripting\Functions\Adrenaline\addHeartPulse.sqf";};
			class getHeartPulse:X39_XLib_Function_TypeA							{file = "\X39_MS2_Scripting\Functions\Adrenaline\getHeartPulse.sqf";};
			class setHeartPulse:X39_XLib_Function_TypeA							{file = "\X39_MS2_Scripting\Functions\Adrenaline\setHeartPulse.sqf";};
			
			class setFlatLine:X39_XLib_Function_TypeA							{file = "\X39_MS2_Scripting\Functions\Adrenaline\setFlatLine.sqf";};
			class doHeartPulseDependingActions:X39_XLib_Function_TypeA			{file = "\X39_MS2_Scripting\Functions\Adrenaline\doHeartPulseDependingActions.sqf";};
		};
		class XMSTicks
		{
			class adrenalineTick:X39_XLib_Function_TypeA						{file = "\X39_MS2_Scripting\Functions\XMSTicks\adrenalineTick.sqf";};
			class updateOverlay:X39_XLib_Function_TypeA							{file = "\X39_MS2_Scripting\Functions\XMSTicks\updateOverlay.sqf";};
			class effectHandleTick:X39_XLib_Function_TypeA						{file = "\X39_MS2_Scripting\Functions\XMSTicks\effectHandleTick.sqf";};
			class debugTick:X39_XLib_Function_TypeA								{file = "\X39_MS2_Scripting\Functions\XMSTicks\debugTick.sqf";};
		};
		class DialogControl_Overlay
		{
			class overlay_createDisplay:X39_XLib_Function_TypeA					{file = "\X39_MS2_Scripting\Functions\DialogControl\Overlay\createDisplay.sqf";};
		};
		class DialogControl_MedicalActionMenu
		{
			class MedicalActionMenu_createDialog:X39_XLib_Function_TypeA		{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\createDialog.sqf";};
			class MedicalActionMenu_btnCheckUnit:X39_XLib_Function_TypeA		{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\btnCheckUnit.sqf";};
			class MedicalActionMenu_btnPerformAction:X39_XLib_Function_TypeA	{file = "\X39_MS2_Scripting\Functions\DialogControl\MedicalActionMenu\btnPerformAction.sqf";};
		};
		class MedcialActions
		{
			class registerAction:X39_XLib_Function_TypeA						{file = "\X39_MS2_Scripting\Functions\MedicalActions\registerAction.sqf";};
		};
	};
};