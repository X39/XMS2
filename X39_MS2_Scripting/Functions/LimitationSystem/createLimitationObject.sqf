#include "\X39_MS2_Scripting\default.hpp"
/**
 *	LS (LimitationSystem) Function
 *	Evaluate if a given unit is allowed to use the given limited action
 *
 *	@Param1 - ARRAY		- Array of limitation names this object will contain
 *	@Param2 - SCALAR	- Object Type (1/0/-1):
 *								1 - ACTIVE	- Overrides existing limitations (& following PASSIVE ones (DENY limitations will remove this modifier again))
 *								0 - PASSIVE	- Will be used if not overridden
 *							   -1 - DENY	- Prevents usage of this limitation for ALL following limitations (exception: ACTIVE limitations will remove this modifier again)
 *	@Param3 - SCALAR	- Efficiency multiplicator
 *	@Return - SCALAR	- Limitation object ID
 *	@Author - X39|Cpt. HM Murdock
 */
private["_limitations", "_objectType", "_efficiency", "_index"];
_limitations = [_this, 0, [], [[]]] call BIS_fnc_param;
_objectType = [_this, 1, 0, [0]] call BIS_fnc_param;
_efficiency = [_this, 2, 0, [0]] call BIS_fnc_param;

if(count _limitations == 0 || {{!ISSTRING(_x)}count _limitations > 0}) exitWith {PRINT_ERROR("Please validate your limitationObjects Param1! (either empty or not 100% string array)");};
if({!(_x in X39_MS2_var_Internal_LimitationSystem_Limitations)}count _limitations > 0) exitWith {PRINT_ERROR("Please validate your limitationObjects Param1! (not all limitations are existing)");};

if(_objectType > 0) then { _objectType = 1; };
if(_objectType < 0) then { _objectType = -1; };

//if(_efficiency > 1) then { _efficiency = 1; };
if(_efficiency <= 0 && {_objectType != -1}) exitWith {PRINT_ERROR("Please validate your limitationObjects Param3! (Efficiency multiplicator needs to be >0 if ObjectType != -1!)");};
if(_objectType == -1) then {_efficiency = 0};

_index = count X39_MS2_var_Internal_LimitationSystem_Objects;
X39_MS2_var_Internal_LimitationSystem_Objects set[_index, [_limitations, _objectType, _efficiency]];
_index