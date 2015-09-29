#include "\X39_MS2_Scripting\default.hpp"
/**
 *	Shows the XMS2 hitmarker if feature is enabled
 *	!FUNCTION IS NOT CALLSAFE!
 *	
 *	@ParamsCount - 1
 *	@Param1 - OBJECT - Player unit
 *	@Return - N/A
 *	@Author - X39
 */
if(!X39_MS2_var_Feature_SimpleHitMarker) exitWith {};

(_this select 0) setVariable ["X39_MS2_var_hitMarkerValue", 1, false];
displayCtrl_Overlay(1294) ctrlSetTextColor [1, 1, 1, ([_unit] call X39_MS2_fnc_getPain) / (0 call X39_MS2_fnc_getMaxPain)];