#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Adds a new quickAction to XMS2
 *
 *	@Param1		- STRING/CODE	- DisplayName of the quickAction
 *	@Param2		- TEXT/CODE	- Description of the quickAction (as text !NOT STRING! see: https://community.bistudio.com/wiki/Structured_Text)
 *	@Param3		- STRING		- Image of the quickAction
 *	@Param4		- CODE			- Code to get the required time
 *											[CustomArgs:ANY, TargetUnit:OBJECT, ExecutingUnit:OBJECT]
 *	@Param5		- CODE			- Code to get the required items
 *											[CustomArgs:ANY, TargetUnit:OBJECT, ExecutingUnit:OBJECT]
 *	@Param6		- CODE			- Code which checks if the player is allowed to use this specific quickAction
 *											[CustomArgs:ANY, TargetUnit:OBJECT, ExecutingUnit:OBJECT]
 *	@Param7		- CODE			- Execution code
 *											[CustomArgs:ANY, TargetUnit:OBJECT, ExecutingUnit:OBJECT]
 *	@Param8		- ANY			- Custom Arguments
 *	@Return		- NA
 *	
 *	@Author - X39|Cpt. HM Murdock
 */
private["_displayName", "_description", "_image", "_codeRequiredTime", "_codeCondition", "_codeExecute", "_customArguments", "_codeRequiredItems"];
_displayName			= [_this, 0, "NotSet", ["", {}]] call BIS_fnc_param;
if(ISCODE(_displayName)) then { _displayName = [] call compile _displayName; };
_description			= [_this, 1, "NotSet", [parseText "", {}]] call BIS_fnc_param;
if(ISCODE(_description)) then { _description = [] call compile _description; };
_image					= [_this, 2, "", [""]] call BIS_fnc_param;
_codeRequiredTime		= [_this, 3, {0}, [{}]] call BIS_fnc_param;
_codeRequiredItems	= [_this, 4, {0}, [{}]] call BIS_fnc_param;
_codeCondition		= [_this, 5, {false}, [{}]] call BIS_fnc_param;
_codeExecute			= [_this, 6, {}, [{}]] call BIS_fnc_param;
_customArguments		= (if(count _this > 7) then {_this select 7} else {nil});
X39_MS2_var_Internal_MedicalUi_QuickActions pushBack [
																_displayName,			//0
																_description,			//1
																_image,				//2
																_codeRequiredTime,	//3
																_codeCondition,		//4
																_codeExecute,			//5
																_customArguments,		//6
																_codeRequiredItems	//7
															  ];