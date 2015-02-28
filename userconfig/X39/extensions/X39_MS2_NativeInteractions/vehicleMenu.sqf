#include "\X39_MS2_Scripting\default.hpp"
[
	'Vehicle Menu',
	'',
	{
		[] call X39_XLib_fnc_ActionDialog_closeDialog;
		[vehicle X39_XLib_var_ActionDialog_Executor] call X39_MS2_fnc_unitSelection_openDialog;
	},
	{X39_XLib_var_ActionDialog_ExecutorInVehicle && X39_XLib_var_ActionDialog_IsSelf}
] call X39_XLib_fnc_ActionDialog_registerAction;
true
