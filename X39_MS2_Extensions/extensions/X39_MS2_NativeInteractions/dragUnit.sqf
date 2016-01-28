#include "\X39_MS2_Scripting\default.hpp"
[
	localize 'STR_X39_MS2_Scripting_InteractionMenu_dragUnit',
	'',
	{
		//Self animation
		_animation = '';
		if(primaryWeapon X39_XLib_var_ActionDialog_Executor == '' && secondaryWeapon X39_XLib_var_ActionDialog_Executor == '') then
		{
			_animation = 'AcinPknlMstpSnonWnonDnon';
		}
		else
		{
			if(primaryWeapon X39_XLib_var_ActionDialog_Executor == '') then
			{
				_animation = 'AcinPknlMstpSnonWpstDnon';
			}
			else
			{
				_animation = 'AcinPknlMstpSrasWrflDnon';
			};
		};
		X39_XLib_var_ActionDialog_Executor playMove _animation;
		//Other unit animation
		X39_XLib_var_ActionDialog_Target attachTo [X39_XLib_var_ActionDialog_Executor, [0, 1.1, 0]];
		X39_XLib_var_ActionDialog_Target setDir 180;
		X39_XLib_var_ActionDialog_Target switchMove 'AinjPpneMstpSnonWrflDb'; //TODO: Check if its required to do a primaryWeapon == '' etc. check
		[] call X39_XLib_fnc_ActionDialog_closeDialog;
	},
	{
		[X39_XLib_var_ActionDialog_Target] call X39_MS2_fnc_isUnitXms2Unit && {
		!X39_XLib_var_ActionDialog_IsSelf &&
		!X39_XLib_var_ActionDialog_ExecutorInVehicle && {
		![X39_XLib_var_ActionDialog_Target] call X39_MS2_fnc_isBlackedOut &&
		({(_x getVariable ['X39_MS2_var_UnitInitialized', false])} count attachedObjects X39_XLib_var_ActionDialog_Executor) <= 0
	}}}
] call X39_MS2_fnc_addActionToInteractionMenu;
true
