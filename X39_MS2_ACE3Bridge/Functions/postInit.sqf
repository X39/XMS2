[] spawn {
	waitUntil {!isNil "X39_MS2_var_Initialized"};
	if(isNil "ACE_interact_menu_fnc_addActionToClass") exitWith {diag_log "ACE3Bridge of XMS2 exited, no ACE3 found";};
	_aceActionVariables = [];
	_len = count toArray "ace_interact_menu_act_";
	{
		if("ace_interact_menu_act_" == (_x select [0, _len])) then
		{
			_aceVariables pushBack (_x select [_len]);
		};
		false
	} count allVariables MissionNamespace;
	_recursiveAddActionToClass {
		params ["_typename", "_addActionToClassArray"];
		{
			if(_x isKindOf _typename || {_x isEqualTo _typename}) then 
			{
				_addActionToClassArray set [0, _x];
				_addActionToClassArray call ACE_interact_menu_fnc_addActionToClass;  
			};
			false
		}count _aceActionVariables;
	};
	
	_ace_selfInteraction = ["xms2_interactions_self", "Interactions", "\z\ace\addons\common\UI\blank_CO.paa", {}, {true}, {
		X39_XLib_var_ActionDialog_Executor = _this select 0;
		X39_XLib_var_ActionDialog_Target = _this select 1;
		X39_XLib_var_ActionDialog_IsSelf = X39_XLib_var_ActionDialog_Executor == X39_XLib_var_ActionDialog_Target;
		X39_XLib_var_ActionDialog_ExecutorInVehicle = vehicle player == player;
	}] call ACE_interact_menu_fnc_createAction;
	["CAManBase", 1, ["ACE_MainActions"], _ace_selfInteraction] call _recursiveAddActionToClass;
	_ace_otherInteraction = ["xms2_interactions_other", "Interactions", "\z\ace\addons\common\UI\blank_CO.paa", {}, {true}, {
		X39_XLib_var_ActionDialog_Executor = _this select 0;
		X39_XLib_var_ActionDialog_Target = _this select 1;
		X39_XLib_var_ActionDialog_IsSelf = X39_XLib_var_ActionDialog_Executor == X39_XLib_var_ActionDialog_Target;
		X39_XLib_var_ActionDialog_ExecutorInVehicle = vehicle player == player;
	}] call ACE_interact_menu_fnc_createAction;
	["CAManBase", 0, ["ACE_MainActions"], _ace_otherInteraction] call _recursiveAddActionToClass;
	{
		_ID = format["xms2_interaction%1", _forEachIndex];
		_displayText = _x select 0;
		_image = _x select 1; if(_image == "") then {_image = "\z\ace\addons\common\UI\blank_CO.paa";};
		_execCode = _this select 2;
		_condition = _this select 3;
		_action = [_ID, _displayText, _image, _execCode, _condition] call ACE_interact_menu_fnc_createAction;
		["CAManBase", 1, ["ACE_MainActions", "xms2_interactions_self"], _action] call _recursiveAddActionToClass;
		["CAManBase", 0, ["ACE_MainActions", "xms2_interactions_other"], _action] call _recursiveAddActionToClass;
	}foreach X39_MS2_var_Internal_XLibActionArrays;
};