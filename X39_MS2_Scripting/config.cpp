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
		#include "functions.cpp"
	};
};