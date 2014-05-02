#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Creates a new entry inside of the MedcialActionArray (MAA)
 *
 *	@Param1	- OBJECT - Executing unit
 *	@Param2 - OBJECT - Targeted unit
 *	@Return	- NA
 *	@Author - X39|Cpt. HM Murdock
 */
private["_executer", "_unit", "_hasFlatLine", "_adrenaline"];
_executer = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_unit = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

if(isNull _unit) exitWith {PRINT_ERROR("no target")};
_hasFlatLine = [_unit] call X39_MS2_fnc_hasFlatLine;
_adrenaline = ([_unit] call X39_MS2_fnc_getAdrenaline) / X39_MS2_var_Adrenaline_maxAdrenaline;

X39_MS2_var_Internal_DialogCommunication_IM_preventActions = true;

_executer playAction "MedicStart";
playSound3D ["\X39_MS2_Ressources\sounds\XMS2_SoundFiles_LP12_full.ogg", _unit, false, position _unit, 1, 1, 0];
sleep 15;
if(_hasFlatLine) then
{
	if(_adrenaline > X39_MS2_var_InteractionMenu_Defibrillate_RequiredAdrenalineP || random X39_MS2_var_InteractionMenu_Defibrillate_ChanceWithoutAdrenaline == X39_MS2_var_InteractionMenu_Defibrillate_ChanceWithoutAdrenaline / 2) then
	{
		[_unit, 0] call X39_MS2_fnc_setFlatLine;
		[_unit, 0, -1, ""] call X39_MS2_fnc_blackOutUnit;
	};
}
else
{
	[_unit, time] call X39_MS2_fnc_setFlatLine;
};
_executer playAction "MedicStop";



X39_MS2_var_Internal_DialogCommunication_IM_preventActions = false;