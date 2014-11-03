class X39_MS2_medicalbox: NATO_Box_Base {
	scope = 2;
	vehicleClass = "X39_MS2_Vehicle";
	hiddenSelectionsTextures[] = {"\X39_MS2_Resources\textures\MedicBox_HiddenSelectionTexture.paa","A3\Weapons_F\Ammoboxes\data\AmmoBox_CO.paa"};
	displayName = $STR_X39_MS2_Items_Vehicles_MedicalBox;
	model = "\A3\weapons_F\AmmoBoxes\WpnsBox_large_F";
	icon = "iconCrateLarge";
	mapSize = 2.34;
	author = "X39|Cpt. HM Murdock";
	transportMaxMagazines = 10000;
	transportMaxWeapons = 10000;
	transportMaxBackpacks = 10000;
	maximumLoad = 200000;
	
	class TransportMagazines{};
	class TransportWeapons{};
	class TransportItems {
		class x39_xms2_bandage {
			name = "x39_xms2_bandage";
			count = 100;
		};
		class x39_xms2_adrenaline {
			name = "x39_xms2_adrenaline";
			count = 100;
		};
		class x39_xms2_heatPack {
			name = "x39_xms2_heatPack";
			count = 100;
		};
		class x39_xms2_mediPack {
			name = "x39_xms2_mediPack";
			count = 100;
		};
		class x39_xms2_morphine {
			name = "x39_xms2_morphine";
			count = 100;
		};
		class x39_xms2_naloxone {
			name = "x39_xms2_naloxone";
			count = 100;
		};
		class x39_xms2_coldSpray {
			name = "x39_xms2_coldSpray";
			count = 100;
		};
		class x39_xms2_earplugs {
			name = "x39_xms2_earplugs";
			count = 100;
		};
		class x39_xms2_defibrillator {
			name = "x39_xms2_defibrillator";
			count = 100;
		};
		class x39_xms2_tourniquet {
			name = "x39_xms2_tourniquet";
			count = 100;
		};
		class x39_xms2_sphygmomanometer {
			name = "x39_xms2_sphygmomanometer";
			count = 100;
		};
		class x39_xms2_ivbag {
			name = "x39_xms2_IVBag";
			count = 100;
		};
		class x39_xms2_aspirin {
			name = "x39_xms2_Aspirin";
			count = 100;
		};
		class x39_xms2_nasopharyngeal {
			name = "x39_xms2_nasopharyngeal";
			count = 100;
		};
		class x39_xms2_kingLt {
			name = "x39_xms2_kingLt";
			count = 100;
		};
		class x39_xms2_bagvalvemask {
			name = "x39_xms2_bagvalvemask";
			count = 100;
		};
	};

};