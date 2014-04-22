#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Creates a new entry inside of the MedcialActionArray (MAA)
 *	
 *	@Param1		- STRING	- string to use for the localize command (action name
 *	@Param2		- STRING	- FunctionName to execute (function gets: [UNITEXECUTE:OBJECT, UNITTARGETED:OBJECT, EFFICENCY:SCALAR])
 *	@Param3		- STRING	- Limitation name
 *	@Param4		- STRING	- animation to play
 *	@Param5		- STRING	- soundfile to play
 *	@Param6		- STRING	- image of action
 *	@Param7		- STRING	- Variable name for the timeout before actual action will be applied
 *	@Param8		- ARRAY		- array containing item names which are valid for this medical action
 *	@Param9		- CODE		- condition when this action is valid to be executed
 *	@Param10	- BOOL		- can be used for self usage too
 *	@Param11	- STRING	- Variable name for the healing value
 *	@Return		- SCALAR	- MAA ID
 *	@Author - X39|Cpt. HM Murdock
 */
private["_name", "_fncName", "_animation", "_sound", "_soundTimeout", "_image", "_timeout", "_items", "_condition", "_allowSelfUse", "_healingValue", "_animationTime"];
_name =				[_this, 0, "", [""]]		call BIS_fnc_param;
_fncName =			[_this, 1, "", [""]]		call BIS_fnc_param;
_limitationName =	[_this, 2, "", [""]]		call BIS_fnc_param;
_animation =		[_this, 3, "", [""]]		call BIS_fnc_param;
_animationTime =	[_this, 4, -1, [0]]			call BIS_fnc_param;
_sound =			[_this, 5, "", [""]]		call BIS_fnc_param;
_soundTimeout =		[_this, 6, -1, [0]]			call BIS_fnc_param;
_image =			[_this, 7, "", [""]]		call BIS_fnc_param;
_items =			[_this, 8, [], [[]]]		call BIS_fnc_param;
_condition =		[_this, 9, {true}, [{}]]	call BIS_fnc_param;
_allowSelfUse =		[_this, 10, false, [false]]	call BIS_fnc_param;
_healingValue =		[_this, 11, "", [""]]		call BIS_fnc_param;

if(_name == "")				exitWith {PRINT_ERROR("MedicalActions NEED a name!");};
if(_fncName == "")			exitWith {PRINT_ERROR("MedicalActions NEED a execution function!");};
if(ISCODE(_fncName))		exitWith {PRINT_ERROR("MedicalActions NEED a execution function!");};
//if(_limitationName == "")	exitWith {PRINT_ERROR("MedicalActions NEED a limitation name!");};
if(_animation == "")		exitWith {PRINT_ERROR("MedicalActions NEED an animation!");};
//if(_sound == "")			exitWith {PRINT_ERROR("MedicalActions NEED a sound!");};
//if(_image == "")			exitWith {PRINT_ERROR("MedicalActions NEED an image!");};

X39_MS2_var_Internal_MedicalActions_actionArray set [count X39_MS2_var_Internal_MedicalActions_actionArray, [
														_name,				//0
														_fncName,			//1
														_limitationName,	//2
														_animation,			//3
														_animationTime,		//4
														_sound,				//5
														_soundTimeout,		//6
														_image,				//7
														_items,				//8
														_condition,			//9
														_allowSelfUse,		//10
														_healingValue		//11
													]];