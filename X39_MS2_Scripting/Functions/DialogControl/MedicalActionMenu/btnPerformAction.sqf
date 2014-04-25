#include "\X39_MS2_Scripting\default.hpp"
/**
 *	UI function
 *
 *	@Param1 - SCALAR - index
 *	@Param2 - STRING - function suffix
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
if(X39_MS2_var_Internal_DialogCommunication_MA_preventActions) exitWith {};//TODO: give output
_this spawn {
	X39_MS2_var_Internal_DialogCommunication_MA_preventActions = true;
	_this call {
		private["_fncAdd", "_fncSet", "_fncGet"];

		DEBUG_CODE(_fnc_scriptName = "X39_MS2_fnc_MedicalActionMenu_btnPerformAction");
		_index =					[_this, 0, 0, [0]] call BIS_fnc_param;
		_suffix =					[_this, 1, "", [""]] call BIS_fnc_param;
		_usesGetSetAddFunctions =	[_this, 2, true, [true]] call BIS_fnc_param;

		if(_index < 0 || {_index > count X39_MS2_var_Internal_MedicalActions_actionArray}) exitWith {PRINT_WARNING("Requested action is not existing inside of the MAA");};
		_action = X39_MS2_var_Internal_MedicalActions_actionArray select _index;

		if(_suffix == "") exitWith {PRINT_ERROR("No functionSuffix has been provided");};

		if(_usesGetSetAddFunctions) then
		{
			DEBUG_LOG_WFn(format["X39_MS2_fnc_addDamageTo%1" COMMA _suffix]);
			DEBUG_LOG_WFn(format["X39_MS2_fnc_setDamageTo%1" COMMA _suffix]);
			DEBUG_LOG_WFn(format["X39_MS2_fnc_getDamageTo%1" COMMA _suffix]);
			_fncAdd = missionNamespace getVariable format["X39_MS2_fnc_addDamageTo%1", _suffix];
			_fncSet = missionNamespace getVariable format["X39_MS2_fnc_setDamageOf%1", _suffix];
			_fncGet = missionNamespace getVariable format["X39_MS2_fnc_getDamageOf%1", _suffix];

			if(isNil "_fncAdd") exitWith {PRINT_ERROR(format["The function %1 has not been found" COMMA format["X39_MS2_fnc_addDamageTo%1" COMMA _suffix]]);};
			if(isNil "_fncSet") exitWith {PRINT_ERROR(format["The function %1 has not been found" COMMA format["X39_MS2_fnc_setDamageOf%1" COMMA _suffix]]);};
			if(isNil "_fncGet") exitWith {PRINT_ERROR(format["The function %1 has not been found" COMMA format["X39_MS2_fnc_getDamageOf%1" COMMA _suffix]]);};
		}
		else
		{
			_fncAdd = {};
			_fncSet = {};
			_fncGet = {};
		};
		DEBUG_LOG_WFn(format["_fncAdd = '%1'" COMMA _fncAdd]);
		DEBUG_LOG_WFn(format["_fncSet = '%1'" COMMA _fncSet]);
		DEBUG_LOG_WFn(format["_fncGet = '%1'" COMMA _fncGet]);
		//Handle action
		//_name =				(_action select 0);
		_fncName =			(_action select 1);
		_limitationName =	(_action select 2); //TODO: Implement new limitation system
		_animation =		(_action select 3);
		_animationTime =	(_action select 4);
		_sound =			(_action select 5);
		_soundTimeout =		(_action select 6);
		_image =			(_action select 7);
		_items =			(_action select 8);
		//_condition =		(_action select 9);
		//_allowSelfUse =		(_action select 10);
		_healingValue =		(_action select 11);
		_workingParts =		(_action select 12);
		_consumesItems =	(_action select 13);

		_efficency = 1; //TODO: Implement new limitation system

		if(ISCHARP(_fncName)) then
		{
			_fncName = missionNamespace getVariable [_fncName, {}];
		};
		if(ISCHARP(_healingValue)) then
		{
			_healingValue = missionNamespace getVariable [_healingValue, ""];
		};

		if(_workingParts find _suffix == -1) exitWith {};//TODO: not valid for this selection message output


		if(_consumesItems && {count _items > 0 && {{_caller find _x != -1} count _items <= 0 && {X39_MS2_var_Internal_DialogCommunication_MA_Target find _x != -1} count _items <= 0}}) exitWith {};//TODO: got no item for this message output
		if(_healingValue > 0) then
		{
			[X39_MS2_var_Internal_DialogCommunication_MA_Target, -(_healingValue * _efficency)] call _fncAdd;
		};

		DEBUG_LOG_WFn(str [_this COMMA _action]);
		_noAnimationPresent = (_animation == "");
		if(_noAnimationPresent) then
		{
			//Others: MedicStart; Self: Medic
			player playAction "MedicStart";
		}
		else
		{
			//Commented out as currently unfunctional: http://feedback.arma3.com/view.php?id=15808
			//player playMoveNow _animation; 
			player playAction "MedicStart"; _noAnimationPresent = true;
		};
		_spawnHandle = [_sound, _soundTimeout] spawn {
			if(_this select 0 == "") exitWith {};
			sleep (_this select 1);
			if([player] call X39_MS2_fnc_isBlackedOut) exitWith {};
			playSound3D [_this select 0, player, false, position player, 1, 1, 0];
		};
		sleep _animationTime;
		if(_noAnimationPresent) then
		{
			player playAction "medicStop";
		};
		
		if([player] call X39_MS2_fnc_isBlackedOut) exitWith {};
		[player, X39_MS2_var_Internal_DialogCommunication_MA_Target, _efficency, _suffix] call _fncName;
	};
	X39_MS2_var_Internal_DialogCommunication_MA_preventActions = false;
};