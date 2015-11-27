#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	Uninitializes given unit
 *	
 *	@Param1 - OBJECT - Unit to initialize
 *	@Param2 - BOOLEAN - Should the function leave variables that are flagged as "keep over respawn" like they are or not
 *	@Return - NA
 */
params [["_unit", objNull, [objNull]], ["_leaveKepperVariablesAlive", false, [false]]];
FORCELOCAL(_unit);
player enableFatigue true;
if(isNull _unit) exitWith {PRINT_ERROR("Cannot uninitialize a NULL unit!");};
if((_unit getVariable ["X39_MS2_var_EH_HandleDamage", -1]) != -1)			then {_unit removeEventHandler["HandleDamage",			(_unit getVariable ["X39_MS2_var_EH_HandleDamage", -1])];};
if((_unit getVariable ["X39_MS2_var_EH_FiredNear", -1]) != -1)				then {_unit removeEventHandler["FiredNear",			    (_unit getVariable ["X39_MS2_var_EH_FiredNear", -1])];};
if((_unit getVariable ["X39_MS2_var_EH_Explosion", -1]) != -1)				then {_unit removeEventHandler["Explosion",			    (_unit getVariable ["X39_MS2_var_EH_Explosion", -1])];};
if((_unit getVariable ["X39_MS2_var_EH_AnimStateChanged", -1]) != -1)		then {_unit removeEventHandler["AnimStateChanged",  	(_unit getVariable ["X39_MS2_var_EH_AnimStateChanged", -1])];};
if((_unit getVariable ["X39_MS2_var_EH_Respawn", -1]) != -1)				then {_unit removeEventHandler["Respawn",				(_unit getVariable ["X39_MS2_var_EH_Respawn", -1])	];};

if(!scriptDone (_unit getVariable ["X39_MS2_var_UnitTickHandle", scriptNull]))	then {terminate (_unit getVariable ["X39_MS2_var_UnitTickHandle", scriptNull]);};
if(!scriptDone X39_MS2_var_Internal_Handles_CheckUnitHandle) then {terminate X39_MS2_var_Internal_Handles_CheckUnitHandle};
if(!scriptDone X39_MS2_var_Internal_Handles_ActionHandle) then {terminate X39_MS2_var_Internal_Handles_ActionHandle};
if(!scriptDone X39_MS2_var_Internal_Handles_ApplyDrugHandle) then {terminate X39_MS2_var_Internal_Handles_ApplyDrugHandle};
if(!scriptDone X39_MS2_var_Internal_Handles_DefibrillateHandle) then {terminate X39_MS2_var_Internal_Handles_DefibrillateHandle};
if(!scriptDone X39_MS2_var_Internal_Handles_HallucinationHandle) then {terminate X39_MS2_var_Internal_Handles_HallucinationHandle};


if(hasInterface && {_unit == player}) then
{
	if(X39_MS2_var_Internal_ppe_radialBlur == -1) then
	{
		ppEffectDestroy X39_MS2_var_Internal_ppe_radialBlur;
		X39_MS2_var_Internal_ppe_radialBlur = -1;
	};
	if(X39_MS2_var_Internal_ppe_chromAberration == -1) then
	{
		ppEffectDestroy X39_MS2_var_Internal_ppe_chromAberration;
		X39_MS2_var_Internal_ppe_chromAberration = -1;
	};
	if(X39_MS2_var_Internal_ppe_wetDistortion == -1) then
	{
		ppEffectDestroy X39_MS2_var_Internal_ppe_wetDistortion;
		X39_MS2_var_Internal_ppe_wetDistortion = -1;
	};
	if(X39_MS2_var_Internal_ppe_colorCorrections == -1) then
	{
		ppEffectDestroy X39_MS2_var_Internal_ppe_colorCorrections;
		X39_MS2_var_Internal_ppe_colorCorrections = -1;
	};
	if(X39_MS2_var_Internal_ppe_dynamicBlur == -1) then
	{
		ppEffectDestroy X39_MS2_var_Internal_ppe_dynamicBlur;
		X39_MS2_var_Internal_ppe_dynamicBlur = -1;
	};
	if(X39_MS2_var_Internal_ppe_filmGrain == -1) then
	{
		ppEffectDestroy X39_MS2_var_Internal_ppe_filmGrain;
		X39_MS2_var_Internal_ppe_filmGrain = -1;
	};
	if(X39_MS2_var_Internal_ppe_colorInversion == -1) then
	{
		ppEffectDestroy X39_MS2_var_Internal_ppe_colorInversion;
		X39_MS2_var_Internal_ppe_colorInversion = -1;
	};
	[] call X39_MS2_fnc_blackOutDialog_closeDialog;
	[] call X39_MS2_fnc_overlay_destroyDisplay;
	[] call X39_MS2_fnc_MedicalUi_closeDialog;
};

{
	if(_x select 3 && (!_leaveKepperVariablesAlive || !(_x select 4))) then
	{
		_unit setVariable[_x select 0, nil, true];				
	};
	false
}count X39_MS2_var_Internal_UnitVariables;

PRINT_INFO(format["%1 was successfully uninitialized!" COMMA _unit]);