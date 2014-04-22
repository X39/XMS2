class NATO_Box_Base;
class X39_MS2_medicalbox: NATO_Box_Base {
	scope = 2;
	vehicleClass = "X39_MS2_Vehicle";
	hiddenSelectionsTextures[] = {"\X39_MS2_Ressources\textures\MedicBox_HiddenSelectionTexture.paa","A3\Weapons_F\Ammoboxes\data\AmmoBox_CO.paa"};
	displayName = $STR_X39_MS2_Items_Vehicles_MedicalBox;
	model = "\A3\weapons_F\AmmoBoxes\WpnsBox_large_F";
	icon = "iconCrateLarge";
	mapSize = 2.34;
	author = "X39|Cpt. HM Murdock";
	transportMaxMagazines = 1000;
	transportMaxWeapons = 1000;
	transportMaxBackpacks = 1000;
	maximumLoad = 2000;
	
	class TransportMagazines{};
	class TransportWeapons{};
	class TransportItems {
		//class x39_medicBox_Bandages {
		//	name = "x39_bandage";
		//	count = 100;
		//};
	};

};