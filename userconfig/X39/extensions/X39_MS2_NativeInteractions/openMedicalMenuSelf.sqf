#include "\X39_MS2_Scripting\default.hpp"
[
	localize 'STR_X39_MS2_Scripting_InteractionMenu_openMedicalMenu',
	'',
	{
		[] call X39_XLib_fnc_ActionDialog_closeDialog;
		[X39_XLib_var_ActionDialog_Executor] call X39_MS2_fnc_MedicalUi_createDialog;
	},
	{[X39_XLib_var_ActionDialog_Target] call X39_MS2_fnc_isUnitXms2Unit && {X39_XLib_var_ActionDialog_IsSelf}}
] call X39_MS2_fnc_addActionToInteractionMenu;
true
