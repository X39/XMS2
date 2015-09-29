#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Adds a new Action to XMS2s MedicalUi
 * Effect is LOCAL
 *
 *	@Param1		- STRING		- ActionID (no uniqueCheck is performed here!)
 *	@Param2		- STRING		- localize string name (will be displayed)
 *	@Param3		- STRING		- Image
 *	@Param4		- CODE			- Condition (needs to check for correct item(s) available)
 *	@Param5		- CODE			- ExecutionCode (will be executed upon pressing applyDrug)
 *	@Param6		- STRING		- LimitationID
 *	@Param7		- SCALAR/CODE	- Perform timeout
 *	@Param8		- BOOLEAN		- Prevent the (un)locking of the medicalUi actions & actionUi actions
 *	@Return		- SCALAR		- Action Index
 *	
 *	@Notes		-	Params for ALL CODE related stuff (but Param7): [Executer:OBJECT, Target:OBJECT, Hitzone:STRING, Efficiency:SCALAR]
 *					Code will ALWAYS be executed on executer computer
 *	
 *	@Author - X39
 */
params [
	["_id", "NA", [""]],
	["_localizedString", "", [""]],
	["_image", "", [""]],
	["_condition", {true},	[{}]],
	["_executionCode", {},	[{}]],
	["_limitationID", "NA", [""]],
	["_timeout", 1,		[0, {}]],
	["_preventUnlock", false,	[false]]
];

if(_localizedString == "")	exitWith {PRINT_ERROR("MedicalActions NEEDS a localized string!");};
(X39_MS2_var_Internal_MedicalActions_actionArray pushBack [
														toUpper _id,																	//0
														_localizedString,																//1
														_image,																		//2
														_condition,																	//3
														_executionCode,																//4
														_limitationID,																//5
														(if(ISCODE(_timeout)) then {_timeout} else {compile str _timeout}),	//6
														_preventUnlock																//7
													])