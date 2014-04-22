class Logic;
class Module_F: Logic
{
	class ArgumentsBaseUnits
	{
	};
	class ModuleDescription
	{
	};
};
class X39_MedSys_Module_BasicModule: Module_F
{
	author = "X39|Cpt. HM Murdock";
	scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
	displayName = "Base module"; // Name displayed in the menu
	icon = "\X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa"; // Map icon. Delete this entry to use the default icon
	category = "X39_XMedSys";
	side = 7;

	// Name of function triggered once conditions are met
	function = "X39_MedSys_fnc_module_BaseModule";
	// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
	functionPriority = 1;
	// 1 for remote execution on all clients, 0 for server only execution
	isGlobal = 1;
	// 1 for persistent execution (i.e. will be called on every JIPped client). Use with caution, can lead to desync
	isPersistent = 1;
	// 1 for module waiting until all synced triggers are activated
	isTriggerActivated = 0;
	// 1 if modules is to be disabled once it's activated (i.e., repeated trigger activation won't work)
	isDisposable = 0;

	// Module arguments
	class Arguments
	{
		class DialogOptions_EnableHealthView
		{
			displayName = "Enable health view";
			typeName = "NUMBER";
			class values : ArgumentsBaseUnits
			{
				
				class opt_true	{name = "Yes"; value = 1; default = 1;};
				class opt_false	{name = "No"; value = 0; default = 0;};
			};
		};
		class DialogOptions_EnableBloodView
		{
			displayName = "Enable blood view";
			typeName = "NUMBER";
			class values : ArgumentsBaseUnits
			{
				class opt_true	{name = "Yes"; value = 1; default = 1;};
				class opt_false	{name = "No"; value = 0; default = 0;};
			};
		};
		class DialogOptions_EnableTourniquetView
		{
			displayName = "Enable tourniquet view";
			typeName = "NUMBER";
			class values : ArgumentsBaseUnits
			{
				class opt_true	{name = "Yes"; value = 1; default = 1;};
				class opt_false	{name = "No"; value = 0; default = 0;};
			};
		};
		class DialogOptions_EnableLegView
		{
			displayName = "Enable broken leg view";
			typeName = "NUMBER";
			class values : ArgumentsBaseUnits
			{
				class opt_true	{name = "Yes"; value = 1; default = 1;};
				class opt_false	{name = "No"; value = 0; default = 0;};
			};
		};
		class DialogOptions_EnableMorphineView
		{
			displayName = "Enable Morphine view";
			typeName = "NUMBER";
			class values : ArgumentsBaseUnits
			{
				class opt_true	{name = "Yes"; value = 1; default = 1;};
				class opt_false	{name = "No"; value = 0; default = 0;};
			};
		};
	};
	// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
	class ModuleDescription: ModuleDescription
	{
		description = "Initilizes the Players to use XMedSys"; // Short description, will be formatted as structured text
	};
};
class X39_MedSys_Module_EnableLimitationsSystemModule: Module_F
{
	author = "X39|Cpt. HM Murdock";
	scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
	displayName = "Enable limitations system"; // Name displayed in the menu
	icon = "\X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa"; // Map icon. Delete this entry to use the default icon
	category = "X39_XMedSys";
	side = 7;

	// Name of function triggered once conditions are met
	function = "X39_MedSys_fnc_module_EnableLimitationSystem";
	// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
	functionPriority = 2;
	// 1 for remote execution on all clients, 0 for server only execution
	isGlobal = 1;
	// 1 for persistent execution (i.e. will be called on every JIPped client). Use with caution, can lead to desync
	isPersistent = 1;
	// 1 for module waiting until all synced triggers are activated
	isTriggerActivated = 0;
	// 1 if modules is to be disabled once it's activated (i.e., repeated trigger activation won't work)
	isDisposable = 0;

	// Module arguments
	class Arguments
	{
	};
	// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
	class ModuleDescription: ModuleDescription
	{
		description = "Enables the usage of the limitations system"; // Short description, will be formatted as structured text
	};
};
class X39_MedSys_Module_AddLimitationModule: Module_F
{
	author = "X39|Cpt. HM Murdock";
	scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
	displayName = "Add limitation"; // Name displayed in the menu
	icon = "\X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa"; // Map icon. Delete this entry to use the default icon
	category = "X39_XMedSys";
	side = 7;

	// Name of function triggered once conditions are met
	function = "X39_MedSys_fnc_module_AddLimitation";
	// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
	functionPriority = 2;
	// 1 for remote execution on all clients, 0 for server only execution
	isGlobal = 1;
	// 1 for persistent execution (i.e. will be called on every JIPped client). Use with caution, can lead to desync
	isPersistent = 1;
	// 1 for module waiting until all synced triggers are activated
	isTriggerActivated = 0;
	// 1 if modules is to be disabled once it's activated (i.e., repeated trigger activation won't work)
	isDisposable = 0;

	// Module arguments
	class Arguments
	{
		class DialogOptions_TakeSynchedClassnames
		{
			displayName = "Take classnames";
			description = "if true, synched vehicles will be removed on spawn and the classnames will be used for the limitations";
			typeName = "NUMBER";
			class values : ArgumentsBaseUnits
			{
				
				class opt_true	{name = "Yes"; value = 1; default = 0;};
				class opt_false	{name = "No"; value = 0; default = 1;};
			};
		};
		class DialogOptions_LimitationToAdd
		{
			displayName = "Limitation to add";
			description = "limitations comming with XmedSys: ""BANDAGE"", ""BLOOD"", ""DEFIBRILLATE"", ""EPINEPHRINE"", ""MORPHINE"", ""MEDKIT"", ""TOURNIQUET""";
			typeName = "STRING";
			defaultValue = "[]";
		};
		class DialogOptions_BehaviourID
		{
			displayName = "Behaviour";
			typeName = "NUMBER";
			class values : ArgumentsBaseUnits
			{
				class opt_0	{name = "synched units are able to heal other units up to 100% in field"; value = 0; default = 1;};
				class opt_1	{name = "synched units are not able to heal other units up to 100% in field"; value = 1; default = 0;};
				class opt_2	{name = "synched units are 'service provider' where all units can be healed up to 100% when in range"; value = 0; default = 0;};
			};
		};
	};
	class ModuleDescription: ModuleDescription
	{
		description = "Adds unit/class limitation to XMedSys"; // Short description, will be formatted as structured text
		sync[] = {"Anything"}; // Array of synced entities (can contain base classes)
	};
};