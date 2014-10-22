#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Adds a new drug to XMS2
 *
 *	@Param1		- STRING	- Image
 *	@Param2		- CODE		- DisplayCondition (will get the following as param: [TargetedUnit:OBJECT, SelectedHitZone:STRING])
 *	@Param2		- ARRAY	- Valid hitzones (use ["*"] for ALL hitzones)
 *	@Return		- NA
 *	
 *	@Author - X39|Cpt. HM Murdock
 */
private["_image", "_condition", "_image", "_condition", "_executionCode", "_abortCode", "_limitationID", "_index"];
_image =		[_this, 0	, "",		[""]]	call BIS_fnc_param;
_condition =	[_this, 1	, {false}, 	[{}]]	call BIS_fnc_param;
_validHitzones = [_this, 2, ["*"], [[]]] call BIS_fnc_param;
if(count _validHitzones == 0) then { _validHitzones = ["*"] };
{
	_validHitzones set[_forEachIndex, toUpper _x];
}forEach _validHitzones;
X39_MS2_var_Internal_MedicalUi_RegisteredStatusEffects set [count X39_MS2_var_Internal_MedicalUi_RegisteredStatusEffects, [
																_image,		//0
																_condition,	//1
																_validHitzones//2
															]];