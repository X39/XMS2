
class X39_MS2_veh_BaseModule: Module_F
{
	author = "X39|Cpt. HM Murdock";
	scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
	displayName = $STR_X39_MS2_Scripting_Modules_BaseModule; // Name displayed in the menu
	icon = "\X39_MS2_Resources\ModuleImages\BaseModule.paa"; // Map icon. Delete this entry to use the default icon
	category = "X39_MS2_Faction";
	side = 7;

	// Name of function triggered once conditions are met
	function = "X39_MS2_fnc_Module_BaseModule";
	// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
	functionPriority = 1;
	// 1 for remote execution on all clients, 0 for server only execution
	isGlobal = 0;
	// 1 for persistent execution (i.e. will be called on every JIPped client). Use with caution, can lead to desync
	isPersistent = 0;
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
		description = "Initializes XMS2 on all players"; // Short description, will be formatted as structured text
	};
};