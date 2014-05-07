#include "\X39_MS2_Scripting\default.hpp"
/*
 *	THIS FUNCTION IS NOT INTENDED TO BE CALLEN BY ANY USERSCRIPT!
 *
 *	ArrayStructure:
 *		0+ STRING		- displayed text
 *		1+ STRING		- limitation name
 *		2+ BOOL			- allow usage inside of a vehicle
 *		3+ CODE			- condition to display option
 *		4+ STRING/CODE	- code to execute when action is performed
 *		5- STRING/CODE	- "UpdateCode" see http://x39software.unitedtacticalforces.de/wiki/index.php?title=ArmA3_XActionUI_ActionsArray
 *		6- ARRAY		- "SubActions" see http://x39software.unitedtacticalforces.de/wiki/index.php?title=ArmA3_XActionUI_ActionsArray
 *	
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
X39_MS2_var_Internal_InteractionMenu_Entries set [count X39_MS2_var_Internal_InteractionMenu_Entries, 
[
	localize "STR_X39_MS2_Scripting_InteractionMenu_openMedicalMenu",
	"DUMMY",
	true, 
	{X39_MS2_var_Internal_Dialog_IsSelfInteracton},
	{
		[] call X39_ActionUI_fnc_closeDialog;
		[X39_MS2_var_Internal_DialogCommunication_IM_Executor] call X39_MS2_fnc_MedicalActionMenu_createDialog;
	}
]];
X39_MS2_var_Internal_InteractionMenu_Entries set [count X39_MS2_var_Internal_InteractionMenu_Entries, [
	localize "STR_X39_MS2_Scripting_InteractionMenu_openMedicalMenu",
	"DUMMY",
	true,
	{!X39_MS2_var_Internal_Dialog_IsSelfInteracton},
	{
		[] call X39_ActionUI_fnc_closeDialog;
		if(isNull cursorTarget) exitWith {false};
		[cursorTarget] call X39_MS2_fnc_MedicalActionMenu_createDialog;
	}
]];
X39_MS2_var_Internal_InteractionMenu_Entries set [count X39_MS2_var_Internal_InteractionMenu_Entries, [
	localize "STR_X39_MS2_Scripting_InteractionMenu_putEarplugs",
	"DUMMY",
	true,
	{((items X39_MS2_var_Internal_DialogCommunication_IM_Target) find "x39_xms2_earplugs" != -1) && !(X39_MS2_var_Internal_DialogCommunication_IM_Target getVariable ["X39_MS2_var_hasEarplugs", false])},
	{
		[] call X39_ActionUI_fnc_closeDialog;
		X39_MS2_var_Internal_DialogCommunication_IM_Target setVariable ["X39_MS2_var_hasEarplugs", true];
		X39_MS2_var_Internal_DialogCommunication_IM_Target removeItem "x39_xms2_earplugs";
	}
]];
X39_MS2_var_Internal_InteractionMenu_Entries set [count X39_MS2_var_Internal_InteractionMenu_Entries, [
	localize "STR_X39_MS2_Scripting_InteractionMenu_removeEarplugs",
	"DUMMY",
	true,
	{(X39_MS2_var_Internal_DialogCommunication_IM_Target getVariable ["X39_MS2_var_hasEarplugs", false])},
	{
		[] call X39_ActionUI_fnc_closeDialog;
		X39_MS2_var_Internal_DialogCommunication_IM_Target setVariable ["X39_MS2_var_hasEarplugs", false];
		X39_MS2_var_Internal_DialogCommunication_IM_Target addItem "x39_xms2_earplugs";
	}
]];
X39_MS2_var_Internal_InteractionMenu_Entries set [count X39_MS2_var_Internal_InteractionMenu_Entries, [
	localize "STR_X39_MS2_Scripting_InteractionMenu_useDefibrillator",
	"DUMMY",
	false,
	{!X39_MS2_var_Internal_Dialog_IsSelfInteracton && (((items X39_MS2_var_Internal_DialogCommunication_IM_Target) find "x39_xms2_defibrillator" != -1) || ((items X39_MS2_var_Internal_DialogCommunication_IM_Executor) find "x39_xms2_defibrillator" != -1))},
	{
		[] call X39_ActionUI_fnc_closeDialog;
		[X39_MS2_var_Internal_DialogCommunication_IM_Executor, X39_MS2_var_Internal_DialogCommunication_IM_Target] call X39_ActionUI_fnc_MA_defibrillate;
	}
]];