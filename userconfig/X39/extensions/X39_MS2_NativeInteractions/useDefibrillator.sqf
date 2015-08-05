#include "\X39_MS2_Scripting\default.hpp"
[
	localize 'STR_X39_MS2_Scripting_InteractionMenu_useDefibrillator',
	'',
	{
		[] call X39_XLib_fnc_ActionDialog_closeDialog;
		[X39_XLib_var_ActionDialog_Executor, X39_XLib_var_ActionDialog_Target] call X39_MS2_fnc_MA_defibrillate;
	},
	{
		[X39_XLib_var_ActionDialog_Target] call X39_MS2_fnc_isUnitXms2Unit &&
		!([X39_XLib_var_ActionDialog_Target] call X39_MS2_fnc_getCprPresent) &&
		!X39_XLib_var_ActionDialog_IsSelf && !X39_XLib_var_ActionDialog_ExecutorInVehicle && {
		(((items X39_XLib_var_ActionDialog_Target) find 'x39_xms2_defibrillator') != -1) || {
		(((items X39_XLib_var_ActionDialog_Executor) find 'x39_xms2_defibrillator') != -1) }}
	}
] call X39_MS2_fnc_addActionToInteractionMenu;
true
