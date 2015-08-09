#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Adds a new quickAction to XMS2
 *	Effects are LOCAL
 *
 *	@Param1		- STRING/CODE	- DisplayName of the quickAction
 *	@Param2		- TEXT/CODE	- Description of the quickAction (as text !NOT STRING! see: https://community.bistudio.com/wiki/Structured_Text)
 *	@Param3		- STRING		- Image of the quickAction
 *	@Param4		- CODE			- Code to get the required time
 *											[CustomArgs:ANY, TargetUnit:OBJECT, ExecutingUnit:OBJECT]
 *	@Param5		- CODE			- Code to get the required items
 *											[CustomArgs:ANY, TargetUnit:OBJECT, ExecutingUnit:OBJECT]
 *	@Param6		- CODE			- Code which checks if the player is allowed to use this specific quickAction
 *											[TargetUnit:OBJECT, ExecutingUnit:OBJECT, CustomArgs:ANY]
 *	@Param7		- CODE			- Execution code
 *											[CustomArgs:ANY, TargetUnit:OBJECT, ExecutingUnit:OBJECT]
 *	@Param8		- ANY			- Custom Arguments
 *	@Param9		- BOOL			- Show this quickAction in medical menu (used for ACE3 integration)
 *	@Return		- NA
 *	
 *	@Author - X39|Cpt. HM Murdock
 */
params [
	["_displayName", "NotSet", ["", {}]],
	["_description", "NotSet", [parseText "", {}]],
	["_image", "", [""]],
	["_codeRequiredTime", {0}, [{}]],
	["_codeRequiredItems", {0}, [{}]],
	["_codeCondition", {false}, [{}]],
	["_codeExecute", {}, [{}]],
	"_customArguments",
	["_showInMedicalMenu", true, [true]]
];
if(ISCODE(_displayName)) then { _displayName = [] call compile _displayName; };
if(ISCODE(_description)) then { _description = [] call compile _description; };
X39_MS2_var_Internal_MedicalUi_QuickActions pushBack [
																_displayName,			//0
																_description,			//1
																_image,				//2
																_codeRequiredTime,	//3
																_codeCondition,		//4
																_codeExecute,			//5
																_customArguments,		//6
																_codeRequiredItems,	//7
																_showInMedicalMenu	//8
															  ];