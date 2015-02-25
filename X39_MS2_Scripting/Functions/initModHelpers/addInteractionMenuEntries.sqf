#include "\X39_MS2_Scripting\default.hpp"
/*
 *	THIS FUNCTION IS NOT INTENDED TO BE CALLEN BY ANY USERSCRIPT!
 *
 *	@Param1 - STRING		- Text to display	
 *	@Param2 - STRING		- Image (use "" for no image) 
 *	@Param3 - STRING/CODE	- buttonAction (will automatically transformed to a STRING)
 *	@Param4 - CODE			- Condition to be displayed (works also on actions with subactions)
 *								Available preDefined variables:
 *								- X39_XLib_var_ActionDialog_Target
 *								- X39_XLib_var_ActionDialog_Executor
 *								- X39_XLib_var_ActionDialog_IsSelf
 *								- X39_XLib_var_ActionDialog_ExecutorInVehicle
 *								- X39_XLib_var_ActionDialog_preventMenuOpening
 *	@Param5 - SCALAR		- parent action ID (use this to add subactions or leave blank if not needed)
 *	@Return - SCALAR		- ActionID (in case of a subAction it wil return the parents action ID)
 *	@Author - X39|Cpt. HM Murdock
 */
[
	localize 'STR_X39_MS2_Scripting_InteractionMenu_openMedicalMenu',
	'',
	{
		[] call X39_XLib_fnc_ActionDialog_closeDialog;
		[X39_XLib_var_ActionDialog_Executor] call X39_MS2_fnc_MedicalUi_createDialog;
	},
	{[X39_XLib_var_ActionDialog_Target] call X39_MS2_fnc_isUnitXms2Unit && {X39_XLib_var_ActionDialog_IsSelf}}
] call X39_XLib_fnc_ActionDialog_registerAction;
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
[
	localize 'STR_X39_MS2_Scripting_InteractionMenu_removeEarplugs',
	'',
	{
		[] call X39_XLib_fnc_ActionDialog_closeDialog;
		X39_XLib_var_ActionDialog_Target setVariable ['X39_MS2_var_hasEarplugs', false];
		X39_XLib_var_ActionDialog_Target addItem 'x39_xms2_earplugs';
	},
	{[X39_XLib_var_ActionDialog_Target] call X39_MS2_fnc_isUnitXms2Unit && {(X39_XLib_var_ActionDialog_Target getVariable ['X39_MS2_var_hasEarplugs', false])}}
] call X39_XLib_fnc_ActionDialog_registerAction;
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
] call X39_XLib_fnc_ActionDialog_registerAction;
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
	{[X39_XLib_var_ActionDialog_Target] call X39_MS2_fnc_isUnitXms2Unit &&{!X39_XLib_var_ActionDialog_IsSelf && !X39_XLib_var_ActionDialog_ExecutorInVehicle && {({(_x getVariable ['X39_MS2_var_UnitInitialized', false])} count attachedObjects X39_XLib_var_ActionDialog_Executor) <= 0}}}
] call X39_XLib_fnc_ActionDialog_registerAction;
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
] call X39_XLib_fnc_ActionDialog_registerAction;
[
	'Vehicle Menu',
	'',
	{
		[] call X39_XLib_fnc_ActionDialog_closeDialog;
		[vehicle X39_XLib_var_ActionDialog_Executor] call X39_MS2_fnc_unitSelection_openDialog;		
	},
	{X39_XLib_var_ActionDialog_ExecutorInVehicle && X39_XLib_var_ActionDialog_IsSelf}
] call X39_XLib_fnc_ActionDialog_registerAction;
	
	