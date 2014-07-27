#include "\X39_MS2_Scripting\default.hpp"
/*
 *	THIS FUNCTION IS NOT INTENDED TO BE CALLEN BY ANY USERSCRIPT!
 *
 *	ArrayStructure:
 *		0+ STRING		- displayed text
 *		1+ STRING		- limitation name
 *		2+ BOOL			- allow usage inside of a vehicle
 *		3+ CODE			- condition to display option
 *		4+ STRING/CODE	- code to execute when action is performed
 *	
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
[
	localize 'STR_X39_MS2_Scripting_InteractionMenu_openMedicalMenu',
	'',
	{
		[] call X39_XLib_fnc_ActionDialog_closeDialog;
		[X39_XLib_var_ActionDialog_Executor] call X39_MS2_fnc_MedicalActionMenu_createDialog;
	},
	{[X39_XLib_var_ActionDialog_Target] call X39_MS2_fnc_isUnitXms2Unit && {X39_XLib_var_ActionDialog_IsSelf}}
] call X39_XLib_fnc_ActionDialog_registerAction;
[
	localize 'STR_X39_MS2_Scripting_InteractionMenu_openMedicalMenu',
	'',
	{
		[] call X39_XLib_fnc_ActionDialog_closeDialog;
		if(isNull X39_XLib_var_ActionDialog_Target) exitWith {false};
		[X39_XLib_var_ActionDialog_Target] call X39_MS2_fnc_MedicalActionMenu_createDialog;
	},
	{[X39_XLib_var_ActionDialog_Target] call X39_MS2_fnc_isUnitXms2Unit && {!X39_XLib_var_ActionDialog_IsSelf}}
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
	localize 'STR_X39_MS2_Scripting_InteractionMenu_putTourniquet',
	'',
	{
		[] call X39_XLib_fnc_ActionDialog_closeDialog;
		X39_XLib_var_ActionDialog_Target setVariable ['X39_MS2_var_hasTourniquet', true];
		if('x39_xms2_tourniquet' in (items X39_XLib_var_ActionDialog_Target)) then
		{
			X39_XLib_var_ActionDialog_Target removeItem 'x39_xms2_tourniquet';
		}
		else
		{
			X39_XLib_var_ActionDialog_Executor removeItem 'x39_xms2_tourniquet';
		};
	},
	{[X39_XLib_var_ActionDialog_Target] call X39_MS2_fnc_isUnitXms2Unit && {(((items X39_XLib_var_ActionDialog_Executor) find 'x39_xms2_tourniquet' != -1) || ((items X39_XLib_var_ActionDialog_Target) find 'x39_xms2_tourniquet' != -1)) && !(X39_XLib_var_ActionDialog_Target getVariable ['X39_MS2_var_hasTourniquet', false])}}
] call X39_XLib_fnc_ActionDialog_registerAction;
[
	localize 'STR_X39_MS2_Scripting_InteractionMenu_removeTourniquet',
	'',
	{
		[] call X39_XLib_fnc_ActionDialog_closeDialog;
		X39_XLib_var_ActionDialog_Target setVariable ['X39_MS2_var_hasTourniquet', false];
		X39_XLib_var_ActionDialog_Executor addItem 'x39_xms2_tourniquet';
	},
	{[X39_XLib_var_ActionDialog_Target] call X39_MS2_fnc_isUnitXms2Unit && {(X39_XLib_var_ActionDialog_Target getVariable ['X39_MS2_var_hasTourniquet', false])}}
] call X39_XLib_fnc_ActionDialog_registerAction;
[
	localize 'STR_X39_MS2_Scripting_InteractionMenu_useDefibrillator',
	'',
	{
		[] call X39_XLib_fnc_ActionDialog_closeDialog;
		[X39_XLib_var_ActionDialog_Executor, X39_XLib_var_ActionDialog_Target] spawn X39_MS2_fnc_MA_defibrillate;
	},
	{[X39_XLib_var_ActionDialog_Target] call X39_MS2_fnc_isUnitXms2Unit && {
		!X39_XLib_var_ActionDialog_IsSelf && !X39_XLib_var_ActionDialog_ExecutorInVehicle &&
		{
			(((items X39_XLib_var_ActionDialog_Target) find 'x39_xms2_defibrillator') != -1) ||
			{
				(((items X39_XLib_var_ActionDialog_Executor) find 'x39_xms2_defibrillator') != -1) &&
				{
					X39_XLib_var_ActionDialog_TargetBlackOutStage >= 3
				}
			}
		}
	}}
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
			X39_XLib_var_ActionDialog_Target removeWeapon _x;
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
	{[X39_XLib_var_ActionDialog_Target] call X39_MS2_fnc_isUnitXms2Unit && {!X39_XLib_var_ActionDialog_IsSelf && !X39_XLib_var_ActionDialog_ExecutorInVehicle && {({(_x getVariable ['X39_MS2_var_UnitInitialized', false])} count attachedObjects X39_XLib_var_ActionDialog_Executor) <= 0}}}
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
			detach _unit;
			_unit playMove 'AinjPpneMstpSnonWrflDb_release';//TODO: Check if its required to do a primaryWeapon == '' etc. check
		}
		else
		{
			systemChat 'WHOOOPS! Something moved TERRIBLY wrong ...';
			systemChat 'Seems like ArmA bugs out with SQF AGAIN -.-*';
			systemChat 'Please report at XMS2 bugTracker and well ...';
			systemChat 'keep attached : /';
		};
		[] call X39_XLib_fnc_ActionDialog_closeDialog;
	},
	{[X39_XLib_var_ActionDialog_Target] call X39_MS2_fnc_isUnitXms2Unit && {X39_XLib_var_ActionDialog_IsSelf && !X39_XLib_var_ActionDialog_ExecutorInVehicle && {({(_x getVariable ['X39_MS2_var_UnitInitialized', false])} count attachedObjects X39_XLib_var_ActionDialog_Executor) > 0}}}
] call X39_XLib_fnc_ActionDialog_registerAction;
[
	'Add 2000 blood to body',
	{
		[] call X39_XLib_fnc_ActionDialog_closeDialog;
		[X39_XLib_var_ActionDialog_Target, 2000] call X39_MS2_fnc_addBlood;
		systemChat 'THIS IS A DUMMY IMPLEMENTATION! So please dont expect something will happen now ... ^^';
		systemChat '((for sure ... the target now has 2000 blood added))';
	},
	{[X39_XLib_var_ActionDialog_Target] call X39_MS2_fnc_isUnitXms2Unit && {!X39_XLib_var_ActionDialog_IsSelf && !X39_XLib_var_ActionDialog_ExecutorInVehicle}}
] call X39_XLib_fnc_ActionDialog_registerAction;