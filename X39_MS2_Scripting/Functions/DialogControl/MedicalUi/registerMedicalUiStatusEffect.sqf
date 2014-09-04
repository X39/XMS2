#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Adds a new drug to XMS2
 *
 *	@Param1		- STRING	- Image
 *	@Param2		- CODE		- DisplayCondition (will get the following as param: [HitzoneName:STRING, TargetedUnit:OBJECT]
 *	@Return		- NA
 *	
 *	@Author - X39|Cpt. HM Murdock
 */
private["_image", "_condition", "_image", "_condition", "_executionCode", "_abortCode", "_limitationID", "_index"];
_image =		[_this, 0	, "",		[""]]	call BIS_fnc_param;
_condition =	[_this, 1	, {false}, 	[{}]]	call BIS_fnc_param;

X39_MS2_var_Internal_MedicalUi_RegisteredStatusEffects set [count X39_MS2_var_Internal_MedicalUi_RegisteredStatusEffects, [
																_image,		//0
																_condition	//1
															]];