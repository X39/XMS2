#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Adds a new drug to XMS2s MedicalUi
 *	Effects are LOCAL
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
 *	@Notes		-	Params for ALL code interactions: [Executer:OBJECT, Target:OBJECT, Efficiency:SCALAR]
 *					Code will ALWAYS be executed on executer computer
 *	
 *	@Author - X39|Cpt. HM Murdock
 */
private "_index";
params [
	["_id", "NA", [""]],
	["_localizedString", "NA", [""]],
	["_image", "NA", [""]],
	["_condition", {true}, [{}]],
	["_executionCode", {}, [{}]],
	["_acceptCode", {}, [{}]],
	["_abortCode", {}, [{}]],
	["_limitationID", "NA", [""]]
];

if(_localizedString == "")	exitWith {PRINT_ERROR("MedicalActions NEEDS a localized string!");};
if(_image == "")				exitWith {PRINT_ERROR("MedicalActions NEEDS an image!");};
(X39_MS2_var_Internal_MedicalUi_RegisteredDrugs pushBack [
														toUpper _id,			//0
														_localizedString,		//1
														_image,				//2
														_condition,			//3
														_executionCode,		//4
														_acceptCode,			//5
														_abortCode,			//6
														_limitationID			//7
													])