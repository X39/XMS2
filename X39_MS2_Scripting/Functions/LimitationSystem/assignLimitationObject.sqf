#include "\X39_MS2_Scripting\default.hpp"
/**
 *	LS (LimitationSystem) Function
 *	Adds an limitation object to an existing class
 *
 *	@Param1 - SCALAR	- LimitationClass ID where the LimitationObject shall be added to
 *	@Param2 - SCALAR	- LimitationObject ID which will be added
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 */
private["_limitationId", "_lsObjectCount"];
_limitationId = [_this, 0, -1, [0]] call BIS_fnc_param;
_limitationObjectId = [_this, 1, -1, [0]] call BIS_fnc_param;
if(_limitationId >= count X39_MS2_var_Internal_LimitationSystem_Classes || _limitationId < 0) exitWith {PRINT_ERROR("Invalid LimitationClassId");};
if(_limitationObjectId >= count X39_MS2_var_Internal_LimitationSystem_Objects || _limitationObjectId < 0) exitWith {PRINT_ERROR("Invalid LimitationObjectId");};

((X39_MS2_var_Internal_LimitationSystem_Classes select [_limitationId]) select 1) set [count ((X39_MS2_var_Internal_LimitationSystem_Classes select [_limitationId]) select 1), _limitationObjectId];
