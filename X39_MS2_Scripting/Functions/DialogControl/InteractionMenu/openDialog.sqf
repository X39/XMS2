#include "\X39_MS2_Scripting\default.hpp"
/**
 *	UI function to open the XActionUI
 *
 *	@Param1 - BOOL - isSelf
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
_this spawn {
	if(dialog) exitWith {PRINT_ERROR("Another UI is already displayed!"); [] call X39_ActionUI_fnc_closeDialog};
	if(!X39_MS2_var_InteractionMenu_allowOpeningOfTheUi) exitWith {};
	if(X39_MS2_var_Internal_DialogCommunication_IM_preventActions) exitWith {};
	private["_isSelf", "_isInVehicle", "_actions", "_action"];
	_isSelf = [_this, 0, true, [true]] call BIS_fnc_param;
	_isInVehicle = vehicle player != player;
	X39_MS2_var_Internal_Dialog_IsSelfInteracton = _isSelf;
	X39_MS2_var_Internal_DialogCommunication_IM_Executor = player;
	X39_MS2_var_Internal_DialogCommunication_IM_TargetBlackOutStage = -1;
	if(_isSelf) then
	{
		X39_MS2_var_Internal_DialogCommunication_IM_Target = player;
	}
	else
	{
		if(_isInVehicle) then
		{
			X39_MS2_var_Internal_DialogCommunication_IM_Target = vehicle player;
		}
		else
		{
			X39_MS2_var_Internal_DialogCommunication_IM_Target = cursorTarget;
		};
	};
	if(isNull X39_MS2_var_Internal_DialogCommunication_IM_Target) exitWith {};
	if(!([X39_MS2_var_Internal_DialogCommunication_IM_Target] call X39_MS2_fnc_isUnitXms2Unit)) exitWith {DEBUG_LOG("InteractionMenu_openDialog: Other unit is a nonXMS2 compatible unit")};
	X39_MS2_var_Internal_DialogCommunication_IM_TargetBlackOutStage = [X39_MS2_var_Internal_DialogCommunication_IM_Target] call X39_MS2_fnc_getBlackOutStage;
	_actions = [];
	_index = 0;
	{
		if(!_isInVehicle || {((_x select 2) && _isInVehicle)}) then
		{
			if(X39_MS2_var_Internal_DialogCommunication_IM_Target call (_x select 3)) then
			{
				if([X39_MS2_var_Internal_DialogCommunication_IM_Target, _x select 1] call X39_MS2_fnc_isAllowedToUse select 0) then
				{
					_action = [_index, _x select 0, _x select 4];
					if(count _x > 5) then
					{
						_action set [count _action, _x select 5];
						if(count _x > 6) then
						{
							_action set [count _action, _x select 6];
						};
					};
					_actions set [count _actions, _action];
					_index = _index + 1;
				};
			};
		};
		false
	}count X39_MS2_var_Internal_InteractionMenu_Entries;
	DEBUG_LOG(str _actions);
	[_actions] call X39_ActionUI_fnc_createDialog;
	DEBUG_CODE(systemChat format["InterAction menu currently targeting: %1" COMMA X39_MS2_var_Internal_DialogCommunication_IM_Target];)
};