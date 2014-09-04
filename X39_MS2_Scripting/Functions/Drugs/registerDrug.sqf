#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Adds a new drug to XMS2s MedicalUi
 *
 *	@Param1		- STRING	- DrugID (no uniqueCheck is performed here!)
 *	@Param2		- STRING	- localize string name (will be displayed)
 *	@Param3		- STRING	- Image
 *	@Param4		- CODE		- Condition (needs to check for correct item(s) available)
 *	@Param5		- CODE		- ExecutionCode (will be executed upon pressing applyDrug)
 *	@Param6		- CODE		- AcceptCode (will be executed when patient accepts drug)
 *	@Param7		- CODE		- AbortCode (will be executed when patient regrets drug)
 *	@Param8		- STRING	- LimitationID
 *	@Return		- SCALAR	- Drug Index
 *	
 *	@Notes		-	Params for ALL code interactions: [Executer:OBJECT, Target:OBJECT]
 *					Code will ALWAYS be executed on executer computer
 *	
 *	@Author - X39|Cpt. HM Murdock
 */
private["_id", "_localizedString", "_image", "_condition", "_executionCode", "_acceptCode", "_abortCode", "_limitationID", "_index"];
_id =					[_this, 0	, "NA",		[""]]		call BIS_fnc_param;
_localizedString =		[_this, 1	, "", 		[""]]		call BIS_fnc_param;
_image =				[_this, 2	, "", 		[""]]		call BIS_fnc_param;
_condition =			[_this, 3	, {true}, 	[{}]]		call BIS_fnc_param;
_executionCode =		[_this, 4	, {}, 		[{}]]		call BIS_fnc_param;
_acceptCode =			[_this, 5	, {}, 		[{}]]		call BIS_fnc_param;
_abortCode =			[_this, 6	, {}, 		[{}]]		call BIS_fnc_param;
_limitationID =			[_this, 7	, "NA",		[""]]		call BIS_fnc_param;

if(_localizedString == "")	exitWith {PRINT_ERROR("MedicalActions NEEDS a localized string!");};
if(_image == "")			exitWith {PRINT_ERROR("MedicalActions NEEDS an image!");};
_index = count X39_MS2_var_Internal_MedicalUi_RegisteredDrugs;
X39_MS2_var_Internal_MedicalUi_RegisteredDrugs set [_index, [
														toUpper _id,		//0
														_localizedString,	//1
														_image,				//2
														_condition,			//3
														_executionCode,		//4
														_acceptCode,		//5
														_abortCode,			//6
														_limitationID		//7
													]];
_index