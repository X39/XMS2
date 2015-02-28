#include "\X39_MS2_Scripting\default.hpp"
[
	localize 'STR_X39_MS2_Scripting_InteractionMenu_openMedicalMenu',
	'',
	{
		[] call X39_XLib_fnc_ActionDialog_closeDialog;
		if(isNull X39_XLib_var_ActionDialog_Target) exitWith {false};
		[X39_XLib_var_ActionDialog_Target] call X39_MS2_fnc_MedicalUi_createDialog;
	},
	{[X39_XLib_var_ActionDialog_Target] call X39_MS2_fnc_isUnitXms2Unit && {!X39_XLib_var_ActionDialog_IsSelf && !X39_XLib_var_ActionDialog_ExecutorInVehicle}}
] call X39_XLib_fnc_ActionDialog_registerAction;
true
