class CfgPatches{
	class X39_MS2_Items{
         units[] = {"X39_MedicBackPack", "x39_medicBox"};
         weapons[] = {"x39_earplug", "x39_medikit5", "x39_medikit4", "x39_medikit3", "x39_medikit2", "x39_medikit", "x39_defibrillator", "x39_bloodbag", "x39_tourniquet", "x39_epinephrine", "x39_morphine", "x39_bandage"};
         requiredVersion = 1.0;
         requiredAddons[] = {"X39_MS2_Resources"};
         author = "X39|Cpt. HM Murdock";
         mail = "killerx29@gmail.com";
	};
};
class CfgVehicles {
	#include "vehicles.cpp"
	#include "backpacks.cpp"
};

class CfgWeapons {
	class ItemCore;
	#include "items.cpp"
};