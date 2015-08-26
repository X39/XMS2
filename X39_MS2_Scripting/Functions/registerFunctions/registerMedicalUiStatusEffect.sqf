#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Registers a medicalUi status effect to the XMS2 system
 *	Effects are LOCAL
 *
 *	@Param1		- STRING	- Image
 *	@Param2		- CODE		- DisplayCondition (will get the following as param: [TargetedUnit:OBJECT, SelectedHitZone:STRING])
 *	@Param2		- ARRAY	- Valid hitzones (use ["*"] for ALL hitzones)
 *	@Return		- NA
 *	
 *	@Author - X39|Cpt. HM Murdock
 */
params [
	["_image", "", [""]],
	["_condition", {false}, [{}]],
	["_validHitzones", ["*"], [[]]]
];
if(count _validHitzones == 0) then { _validHitzones = ["*"] };
{
	_validHitzones set[_forEachIndex, toUpper _x];
}forEach _validHitzones;
X39_MS2_var_Internal_MedicalUi_RegisteredStatusEffects set [count X39_MS2_var_Internal_MedicalUi_RegisteredStatusEffects, [
																_image,		//0
																_condition,	//1
																_validHitzones//2
															]];