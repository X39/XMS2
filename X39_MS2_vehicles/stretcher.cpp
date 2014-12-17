class X39_MS2_stretcher: X39_MS2_vehicles_Base
{
	side = 1;
	scope = 2;
	model = "\X39_MS2_vehicles\data\stretcher\stretcher.p3d";
	faction = "X39_MS2_Faction";
	vehicleClass = "X39_MS2_Vehicle";
	displayname = "XMS_Stretcher";
	hasGunner = 0;
	transportSoldier=1;
	cargoAction[] = 
	{
		"passenger_injured_medevac_truck01"
	};
	threat[]={0,0,0};
	driverLeftHandAnimName="drivewheel";
	driverRightHandAnimName="";
	driverLeftLegAnimName = "";
	driverRightLegAnimName = "pedal_thrust";
	armor=120;
	damageResistance=0.030990001;
	Picture = "\X39_MS2_vehicles\data\stretcher\stretcher_ico.paa"; //i used the icon path change it if you want ,it's for diplay in the commandbar when one of you unit is inside it
	icon = "\X39_MS2_vehicles\data\stretcher\stretcher_ico.paa";
	attendant = 1; //this is the basic can heal variable from a3
	class Eventhandlers
	{
		init = "(_this select 0) addEventHandler ['HandleDamage', {0}];";
	};
	class Library
	{
		libTextDesc = "X39_MS2_vehicles";
	};
	class Turrets: Turrets
	{
	};
	class AnimationSources: AnimationSources
	{
	};
	class UserActions
	{
	};
	class TransportWeapons
	{
	};
	class TransportItems
	{
	};
	class Damage
	{
		tex[] = {};
		mat[] =
		{
		//once again dammage rvmat applied
		};
	};
	HiddenSelections[] =
	{
	/*
	//Related to named selection in model.
		"camo",
		"camo1",
		"camo2",
		"camo3"*/
	};
	HiddenSelectionsTextures[] = 
	{
	/*Path to textures applied to the related hiddenselection*/
	};
};