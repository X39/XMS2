class CfgPatches{
	class X39_MS2_Items{
         units[] = {"X39_MS2_medicalbox"};
         weapons[] = {
			 "x39_xms2_bandage",
			 "x39_xms2_adrenaline",
			 "x39_xms2_heatPack",
			 "x39_xms2_mediPack",
			 "x39_xms2_morphine",
			 "x39_xms2_naloxone",
			 "x39_xms2_coldSpray",
			 "x39_xms2_earplugs",
			 "x39_xms2_defibrillator"
		 };
         requiredVersion = 1.0;
         requiredAddons[] = {"X39_MS2_Resources"};
         author = "X39|Cpt. HM Murdock";
         mail = "killerx29@gmail.com";
	};
};
class CfgVehicles {
	class NATO_Box_Base;
	class Bag_Base;
	#include "vehicles.cpp"
	#include "backpacks.cpp"
};

class CfgWeapons {
	class ItemCore;
	#include "items.cpp"
};