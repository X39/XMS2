#include "\X39_MS2_Scripting\default.hpp"
/**
 *	UI function
 *
 *	@Param1 - SCALAR - index
 *	@Param2 - STRING - function suffix
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_index", "_suffix", "_action"];
_index = [_this, 0, 0, [0]] call BIS_fnc_param;
_suffix =  [_this, 1, "", [""]] call BIS_fnc_param;

if(_index < 0 || {_index > count X39_MS2_var_Internal_MedicalActions_actionArray}) exitWith {PRINT_WARNING("Requested action is not existing inside of the MAA");};
_action = X39_MS2_var_Internal_MedicalActions_actionArray select _index;

if(_suffix == "") exitWith {PRINT_WARNING("No functionSuffix has been provided");};

_fncAdd = missionNamespace getVariable format["X39_MS2_fnc_addDamageTo%1", _suffix];
_fncSet = missionNamespace getVariable format["X39_MS2_fnc_setDamageOf%1", _suffix];
_fncGet = missionNamespace getVariable format["X39_MS2_fnc_getDamageOf%1", _suffix];

if(isNil "_fncAdd") exitWith {PRINT_ERROR(format["The function %1 has not been found" COMMA format["X39_MS2_fnc_addDamageTo%1" COMMA _suffix]]);};
if(isNil "_fncSet") exitWith {PRINT_ERROR(format["The function %1 has not been found" COMMA format["X39_MS2_fnc_setDamageOf%1" COMMA _suffix]]);};
if(isNil "_fncGet") exitWith {PRINT_ERROR(format["The function %1 has not been found" COMMA format["X39_MS2_fnc_getDamageOf%1" COMMA _suffix]]);};


hint str [_this, _action];