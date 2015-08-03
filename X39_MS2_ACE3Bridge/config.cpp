class CfgPatches{
	class X39_MS2_ACE3Bridge{
         units[] = {};
         weapons[] = {};
         requiredVersion = 1.0;
         requiredAddons[] = {"X39_XLib_Scripting", "ace_interact_menu"};
         author = "X39|Cpt. HM Murdock";
         mail = "killerx29@gmail.com";
	};
};


class X39_XLib_Function_TypeA;
class X39_XLib_Function_TypeB;
class X39_XLib_Function_TypeC;
class CfgFunctions 
{
	class X39_MS2_ACE3Bridge
	{
		class InitModFunctions //Functions for initMod
		{
			class postInit:X39_XLib_Function_TypeC					{file = "\X39_MS2_ACE3Bridge\Functions\postInit.sqf";};
		};
	};
};