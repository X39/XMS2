#define ITEM_ITEMINFO_TYPE 201
#define ITEM_TYPE 131072
#define ITEM_SIMULATION "weapon"
//TODO: Find a solution so that ALL items are not recognized as something invalid but still visible in all required UIs
class x39_xms2_bandage : ItemCore
{
	scope = 2;
	displayName = $STR_X39_MS2_Items_Items_Bandage;
	model = "\X39_MS2_Resources\Items\Bandage\Bandage.p3d";
	class ItemInfo
    {
		mass = 2;
		type = ITEM_ITEMINFO_TYPE;
    }; 
	picture = "\X39_MS2_Resources\Items\Bandage\Bandage.paa";
	descriptionShort = "";
	type = ITEM_TYPE;
	simulation = ITEM_SIMULATION;
};
class x39_xms2_adrenaline : ItemCore
{
	scope = 2;
	displayName = $STR_X39_MS2_Items_Items_Adrenaline;
	model = "\X39_MS2_Resources\Items\Injector\Injector.p3d";
	picture = "\X39_MS2_Resources\Items\Injector\Injector_thumb.paa";
	class ItemInfo
    {
		mass = 1;
		type = ITEM_ITEMINFO_TYPE;
    }; 
	descriptionShort = "";
	type = ITEM_TYPE;
	simulation = ITEM_SIMULATION;
};
class x39_xms2_heatPack : ItemCore
{
	scope = 2;
	displayName = $STR_X39_MS2_Items_Items_heatPack;
	class ItemInfo
    {
		mass = 4;
		type = ITEM_ITEMINFO_TYPE;
    }; 
	picture = "\X39_MS2_Resources\Items\HeatPack.paa";
	descriptionShort = "";
	type = ITEM_TYPE;
	simulation = ITEM_SIMULATION;
};
class x39_xms2_mediPack : ItemCore
{
	scope = 2;
	displayName = $STR_X39_MS2_Items_Items_mediPack;
	class ItemInfo
    {
		mass = 8;
		type = ITEM_ITEMINFO_TYPE;
    }; 
	picture = "\X39_MS2_Resources\Items\MedicalPack.paa";
	descriptionShort = "";
	type = ITEM_TYPE;
	simulation = ITEM_SIMULATION;
};
class x39_xms2_morphine : ItemCore
{
	scope = 2;
	displayName = $STR_X39_MS2_Items_Items_morphine;
	model = "\X39_MS2_Resources\Items\Injector\InjectorInv.p3d";
	picture = "\X39_MS2_Resources\Items\Injector\InjectorInv_thumb.paa";
	class ItemInfo
    {
		mass = 1;
		type = ITEM_ITEMINFO_TYPE;
    }; 
	descriptionShort = "";
	type = ITEM_TYPE;
	simulation = ITEM_SIMULATION;
};
class x39_xms2_naloxone : ItemCore
{
	scope = 2;
	displayName = $STR_X39_MS2_Items_Items_naloxone;
	model = "\X39_MS2_Resources\Items\Injector\InjectorInv2.p3d";
	picture = "\X39_MS2_Resources\Items\Injector\InjectorInv2_thumb.paa";
	class ItemInfo
    {
		mass = 1;
		type = ITEM_ITEMINFO_TYPE;
    }; 
	descriptionShort = "";
	type = ITEM_TYPE;
	simulation = ITEM_SIMULATION;
};
class x39_xms2_earplugs : ItemCore
{
	scope = 2;
	displayName = $STR_X39_MS2_Items_Items_earplugs;
	class ItemInfo
    {
		mass = 0;
		type = ITEM_ITEMINFO_TYPE;
    }; 
	picture = "\X39_MS2_Resources\Items\earplugs.paa";
	descriptionShort = "";
	type = ITEM_TYPE;
	simulation = ITEM_SIMULATION;
};
class x39_xms2_defibrillator : ItemCore
{
	scope = 2;
	displayName = $STR_X39_MS2_Items_Items_defibrillator;
	model = "\A3\Structures_F_EPA\Items\Medical\Defibrillator_F.p3d";
	class ItemInfo
    {
    	mass = 20;
		type = ITEM_ITEMINFO_TYPE;
    }; 
	picture = "\X39_MS2_Resources\Items\Defibrillator.paa";
	descriptionShort = "";
	type = ITEM_TYPE;
	simulation = ITEM_SIMULATION;
};
class x39_xms2_tourniquet : ItemCore
{
	scope = 2;
	displayName = $STR_X39_MS2_Items_Items_tourniquet;
	model = "\X39_MS2_Resources\Items\Tourniquet\Tourniquet.p3d";
	picture = "\X39_MS2_Resources\Items\Tourniquet\Tourniquet_thumb.paa";
	class ItemInfo
    {
    	mass = 3;
		type = ITEM_ITEMINFO_TYPE;
    }; 
	descriptionShort = "";
	type = ITEM_TYPE;
	simulation = ITEM_SIMULATION;
};
class x39_xms2_sphygmomanometer : ItemCore
{
	scope = 2;
	displayName = $STR_X39_MS2_Items_Items_sphygmomanometer;
	picture = "\X39_MS2_Resources\Items\Sphygmomanometer.paa";
	class ItemInfo
    {
    	mass = 5;
		type = ITEM_ITEMINFO_TYPE;
    }; 
	descriptionShort = "";
	type = ITEM_TYPE;
	simulation = ITEM_SIMULATION;
};
class x39_xms2_IVBag : ItemCore
{
	scope = 2;
	displayName = $STR_X39_MS2_Items_Items_ivBag;
	picture = "\x39_ms2_resources\items\IVBag\IVBag_thumb.paa";
	model = "\x39_ms2_resources\items\IVBag\IVBag.p3d";
	class ItemInfo
    {
    	mass = 5;
		type = ITEM_ITEMINFO_TYPE;
    }; 
	descriptionShort = "";
	type = ITEM_TYPE;
	simulation = ITEM_SIMULATION;
};