#include "\X39_MS2_Scripting\default.hpp"
/**
 *	LS (LimitationSystem) Function
 *	Registers a new limitation in the limitationSystem (for validation during createLimitation* functions)
 *
 *	@Param1 - STRING - limited action to check
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 */
private["_limitation"];
_limitation = [_this, 0, "", [""]] call BIS_fnc_param;
if(_limitation == "") exitWith {PRINT_ERROR("Please provide a valid limitation!");};
if(_limitation in X39_MS2_var_Internal_LimitationSystem_Limitations) exitWith {PRINT_WARNING(format["Limitation '%1' is already existing!" COMMA _limitation]);};
X39_MS2_var_Internal_LimitationSystem_Limitations set[count X39_MS2_var_Internal_LimitationSystem_Limitations, _limitation];