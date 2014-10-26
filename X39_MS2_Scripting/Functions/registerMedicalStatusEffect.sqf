#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Creates a new entry inside of the MedcialActionArray (MAA)
 *
 *	@Param1		- STRING/CODE	- localization string (stringtable.xml) OR some code which NEEDS to return a string (wont be checked)
 *	@Param2		- ARRAY			- RGBA color array (fe.: [1,1,1,1] for white)
 *	@Param3		- CODE			- Condition when this message will be displayed
 *	@Return		- SCALAR		- MAA ID
 *	@Author - X39|Cpt. HM Murdock
 */
private["_condition", "_allowedHitZones", "_image", "_index"];
_condition				=	[_this, 0, {true}, ["", {}]]		call BIS_fnc_param;
_allowedHitZones		=	[_this, 1, ["*"], [[]]]				call BIS_fnc_param;
_image					=	[_this, 2, "", [""]]					call BIS_fnc_param;

if(_image == "") exitWith {PRINT_ERROR("A Status effect NEEDS an image!")};

if(ISCHARP(_condition)) then
{
	_condition = compile _condition;
};
if(count _allowedHitZones == 0) then
{
	_allowedHitZones = ["*"];
};

_index = count X39_MS2_var_Internal_MedicalStatusEffects;
X39_MS2_var_Internal_MedicalStatusEffects set	[_index,
												[
													_condition,			//0
													_allowedHitZones,		//1
													_image					//2
												]
											];
_index