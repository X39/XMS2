#include "\X39_MS2_Scripting\default.hpp"
/**
 *	UI function
 *
 *	@Param1 - SCALAR - timeout
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
_timeout = [_this, 0, 0, [0]] call BIS_fnc_param;
if(isNull X39_MS2_var_Internal_DialogCommunication_MA_Target) exitWith {PRINT_ERROR("X39_MS2_var_Internal_DialogCommunication_MA_Target is null!");};
if(_timeout > 0) then
{
	//TODO: Play animation
	sleep _timeout;
};
(findDisplay 26485 displayCtrl 1200) ctrlSetTextColor ([[X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getDamageOfHands, X39_MS2_var_Damage_maxDamageHands] call X39_MS2_fnc_getColorArrayFromDamageValue);
(findDisplay 26485 displayCtrl 1201) ctrlSetTextColor ([[X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getDamageOfBody, X39_MS2_var_Damage_maxDamageBody] call X39_MS2_fnc_getColorArrayFromDamageValue);
(findDisplay 26485 displayCtrl 1202) ctrlSetTextColor ([[X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getDamageOfLegs, X39_MS2_var_Damage_maxDamageLegs] call X39_MS2_fnc_getColorArrayFromDamageValue);
(findDisplay 26485 displayCtrl 1203) ctrlSetTextColor ([[X39_MS2_var_Internal_DialogCommunication_MA_Target] call X39_MS2_fnc_getDamageOfHead, X39_MS2_var_Damage_maxDamageHead] call X39_MS2_fnc_getColorArrayFromDamageValue);