#include "\X39_MS2_Scripting\default.hpp"
[
	localize 'STR_X39_MS2_Scripting_InteractionMenu_dropUnit',
	'',
	{
		private['_unit', '_x'];
		X39_XLib_var_ActionDialog_Executor playMove 'AidlPknlMstpSrasWrflDnon_AI'; //TODO: Check if its required to do a primaryWeapon == '' etc. check
		_unit = objNull;
		{
			if(_x getVariable ['X39_MS2_var_UnitInitialized', false]) then
			{
				_unit = _x;
			};
			false
		} count attachedObjects X39_XLib_var_ActionDialog_Executor;
		if(!isNull _unit) then
		{
			private["_animation"];
			detach _unit;
			if([_unit] call X39_MS2_fnc_isBlackedOut) then
			{
				_animation = 'AmovPpneMstpSnonWrflDb_release';
			}
			else
			{
				_animation = "";
				if(primaryWeapon X39_XLib_var_ActionDialog_Executor == '' && secondaryWeapon X39_XLib_var_ActionDialog_Executor == '') then
				{
					_animation = 'AmovPpneMstpSnonWnonDnon';
				}
				else
				{
					if(primaryWeapon X39_XLib_var_ActionDialog_Executor == '') then
					{
						_animation = 'AmovPpneMstpSnonWpstDnon';
					}
					else
					{
						_animation = 'AmovPpneMstpSrasWrflDnon';
					};
				};
			};
			_unit playMoveNow _animation;
		};
		[] call X39_XLib_fnc_ActionDialog_closeDialog;
	},
	{[X39_XLib_var_ActionDialog_Target] call X39_MS2_fnc_isUnitXms2Unit && {X39_XLib_var_ActionDialog_IsSelf && !X39_XLib_var_ActionDialog_ExecutorInVehicle && {({(_x getVariable ['X39_MS2_var_UnitInitialized', false])} count attachedObjects X39_XLib_var_ActionDialog_Executor) > 0}}}
] call X39_MS2_fnc_addActionToInteractionMenu;
true
