#include "\X39_MS2_Scripting\default.hpp"
[
	localize 'STR_X39_MS2_Scripting_InteractionMenu_carryUnit',
	'',
	{
		//Self animation
		_animation = '';
		if(primaryWeapon X39_XLib_var_ActionDialog_Executor == '' && secondaryWeapon X39_XLib_var_ActionDialog_Executor == '') then
		{
			_animation = 'AcinPknlMstpSrasWrflDnon_AcinPercMrunSrasWrflDnon';
		}
		else
		{
			if(primaryWeapon X39_XLib_var_ActionDialog_Executor == '') then
			{
				_animation = 'AcinPknlMstpSrasWrflDnon_AcinPercMrunSrasWrflDnon';
			}
			else
			{
				_animation = 'AcinPknlMstpSrasWrflDnon_AcinPercMrunSrasWrflDnon';
			};
		};
		X39_XLib_var_ActionDialog_Executor playMove _animation;
		//Other unit animation
		X39_XLib_var_ActionDialog_Target attachTo [X39_XLib_var_ActionDialog_Executor, [0.2,0.2,0.1]];
		[X39_XLib_var_ActionDialog_Target, "(_this select 0) setDir (_this select 1)", [X39_XLib_var_ActionDialog_Target, 180]] call X39_XLib_fnc_executeLocalToUnit
		[X39_XLib_var_ActionDialog_Target, "(_this select 0) switchMove (_this select 1)", [X39_XLib_var_ActionDialog_Target, "AinjPfalMstpSnonWrflDnon_carried_Still"]] call X39_XLib_fnc_executeLocalToUnit
		[] call X39_XLib_fnc_ActionDialog_closeDialog;
	},
	{[X39_XLib_var_ActionDialog_Target] call X39_MS2_fnc_isUnitXms2Unit &&{!X39_XLib_var_ActionDialog_IsSelf && !X39_XLib_var_ActionDialog_ExecutorInVehicle && {({(_x getVariable ['X39_MS2_var_UnitInitialized', false])} count attachedObjects X39_XLib_var_ActionDialog_Executor) <= 0}}}
] call X39_MS2_fnc_addActionToInteractionMenu;
true
