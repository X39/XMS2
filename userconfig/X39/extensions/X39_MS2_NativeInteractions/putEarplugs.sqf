#include "\X39_MS2_Scripting\default.hpp"
[
	localize 'STR_X39_MS2_Scripting_InteractionMenu_putEarplugs',
	'',
	{
		[] call X39_XLib_fnc_ActionDialog_closeDialog;
		X39_XLib_var_ActionDialog_Target setVariable ['X39_MS2_var_hasEarplugs', true];
		X39_XLib_var_ActionDialog_Target removeItem 'x39_xms2_earplugs';
	},
	{[X39_XLib_var_ActionDialog_Target] call X39_MS2_fnc_isUnitXms2Unit && {((items X39_XLib_var_ActionDialog_Target) find 'x39_xms2_earplugs' != -1) && !(X39_XLib_var_ActionDialog_Target getVariable ['X39_MS2_var_hasEarplugs', false])}}
] call X39_XLib_fnc_ActionDialog_registerAction;
true
