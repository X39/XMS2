#include "\X39_MS2_Scripting\default.hpp"
/**
 *	UI function to close the BlackOut dialog
 *
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
if(!scriptDone X39_MS2_var_Internal_Handles_BlackOutDialogHandle) then
{
	terminate X39_MS2_var_Internal_Handles_BlackOutDialogHandle;
	X39_MS2_var_Internal_DialogCommunication_BO_isActive = false;
	if(dialog) then
	{
		closeDialog 26484;
	};
};