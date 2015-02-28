#include "\X39_MS2_Scripting\default.hpp"
[
	localize 'STR_X39_MS2_Scripting_InteractionMenu_stripWeapons',
	'',
	{
		private['_gearHolder', '_x'];
		[] call X39_XLib_fnc_ActionDialog_closeDialog;
		_gearHolder = 'GroundWeaponHolder' createVehicle position X39_XLib_var_ActionDialog_Executor;
		{
			_gearHolder addWeaponCargoGlobal[_x, 1];
			X39_XLib_var_ActionDialog_Target removeWeaponGlobal _x;
		}foreach (weapons X39_XLib_var_ActionDialog_Target);
	},
	{[X39_XLib_var_ActionDialog_Target] call X39_MS2_fnc_isUnitXms2Unit && {!X39_XLib_var_ActionDialog_IsSelf && !X39_XLib_var_ActionDialog_ExecutorInVehicle}}
] call X39_XLib_fnc_ActionDialog_registerAction;
true
