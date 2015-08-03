#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Creates a new entry inside of the MedcialActionArray (MAA)
 *	Effect is LOCAL
 *
 *	@Param1		- STRING/CODE	- localization string (stringtable.xml) OR some code which NEEDS to return a string (wont be checked)
 *	@Param2		- ARRAY			- RGBA color array (fe.: [1,1,1,1] for white)
 *	@Param3		- CODE			- Condition when this message will be displayed
 *	@Return		- SCALAR		- MAA ID
 *	@Author - X39|Cpt. HM Murdock
 */
params [
	["_condition", {true}, ["", {}]],
	["_allowedHitZones", ["*"], [[]]],
	["_image", "", [""]]
];

if(_image == "") exitWith {PRINT_ERROR("A Status effect NEEDS an image!")};

if(ISCHARP(_condition)) then
{
	_condition = compile _condition;
};
if(count _allowedHitZones == 0) then
{
	_allowedHitZones = ["*"];
};

(X39_MS2_var_Internal_MedicalStatusEffects pushBack [
													_condition,			//0
													_allowedHitZones,		//1
													_image					//2
												])