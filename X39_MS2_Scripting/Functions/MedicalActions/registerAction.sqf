#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Adds a new Action to XMS2s MedicalUi
 *
 *	@Param1		- STRING		- ActionID (no uniqueCheck is performed here!)
 *	@Param2		- STRING		- localize string name (will be displayed)
 *	@Param3		- STRING		- Image
 *	@Param4		- CODE			- Condition (needs to check for correct item(s) available)
 *	@Param5		- CODE			- ExecutionCode (will be executed upon pressing applyDrug)
 *	@Param6		- STRING		- LimitationID
 *	@Param7		- SCALAR/CODE	- Perform timeout
 *	@Return		- SCALAR		- Action Index
 *	
 *	@Notes		-	Params for ALL CODE related stuff: [Executer:OBJECT, Target:OBJECT, Hitzone:STRING, Efficiency:SCALAR]
 *					Code will ALWAYS be executed on executer computer
 *	
 *	@Author - X39|Cpt. HM Murdock
 */
private["_id", "_localizedString", "_image", "_condition", "_executionCode", "_index", "_limitationID", "_timeout"];
_id =					[_this, 0	, "NA",		[""]]		call BIS_fnc_param;
_localizedString =		[_this, 1	, "", 		[""]]		call BIS_fnc_param;
_image =				[_this, 2	, "", 		[""]]		call BIS_fnc_param;
_condition =			[_this, 3	, {true}, 	[{}]]		call BIS_fnc_param;
_executionCode =		[_this, 4	, {}, 		[{}]]		call BIS_fnc_param;
_limitationID =			[_this, 5	, "NA",		[""]]		call BIS_fnc_param;
_timeout =				[_this, 6	, 1,		[0, {}]]	call BIS_fnc_param;

if(_localizedString == "")	exitWith {PRINT_ERROR("MedicalActions NEEDS a localized string!");};
_index = count X39_MS2_var_Internal_MedicalActions_actionArray;
X39_MS2_var_Internal_MedicalActions_actionArray set [_index, [
														toUpper _id,														//0
														_localizedString,													//1
														_image,																//2
														_condition,															//3
														_executionCode,														//4
														_limitationID,														//6
														(if(ISCODE(_timeout)) then {_timeout} else {compile str _timeout})	//7
													]];
_index