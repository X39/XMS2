#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Creates a new entry inside of the MedcialActionArray (MAA)
 *
 *	@Param1		- STRING	- string to use for the localize command (action name
 *	@Param2		- STRING	- FunctionName to execute (function gets: [UNITEXECUTE:OBJECT, UNITTARGETED:OBJECT, EFFICENCY:SCALAR, PART:STRING])
 *								Function can use the following parent functions
 *								- _fncAdd	([UNIT:OBJECT, VALUE:SCALAR])
 *								- _fncSet	([UNIT:OBJECT, VALUE:SCALAR])
 *								- _fncGet	([UNIT:OBJECT, VALUE:SCALAR])
 *	@Param3		- STRING	- Limitation name
 *	@Param4		- STRING	- animation to play
 *	@Param5		- STRING	- soundfile to play
 *	@Param6		- STRING	- image of action
 *	@Param7		- STRING	- Variable name for the timeout before actual action will be applied
 *	@Param8		- ARRAY		- array containing item names which are valid for this medical action
 *	@Param9		- CODE		- condition when this action is valid to be executed
 *	@Param10	- SCALAR	- 0 = can be used for self and others, 1 = only self, 2 = only others
 *	@Param11	- STRING	- Variable name for the healing value
 *	@Param12	- ARRAY		- Array containing the parts where this action is accepted on
 *	@Param13	- ARRAY		- Valid items which will be consumed when this action is performed
 *	@Return		- SCALAR	- MAA ID
 *	@Author - X39|Cpt. HM Murdock
 */
private["_index", "_name", "_fncName", "_limitationName", "_animation", "_sound", "_soundTimeout", "_image", "_timeout", "_items", "_condition", "_allowSelfUse", "_healingValue", "_animationTime", "_workingParts", "_consumesItems", "_bleedingCureValue", "_bleedingCureMaxBleed"];
_name =					[_this, 0, "", [""]]		call BIS_fnc_param;
_fncName =				[_this, 1, {}, [{}, ""]]	call BIS_fnc_param;
_limitationName =		[_this, 2, "", [""]]		call BIS_fnc_param;
_animation =			[_this, 3, "", [""]]		call BIS_fnc_param;
_animationTime =		[_this, 4, -1, [0]]			call BIS_fnc_param;
_sound =				[_this, 5, "", [""]]		call BIS_fnc_param;
_soundTimeout =			[_this, 6, -1, [0]]			call BIS_fnc_param;
_image =				[_this, 7, "", [""]]		call BIS_fnc_param;
_items =				[_this, 8, [], [[]]]		call BIS_fnc_param;
_condition =			[_this, 9, {true}, [{}]]	call BIS_fnc_param;
_allowSelfUse =			[_this, 10, 0, [0]]			call BIS_fnc_param;
_healingValue =			[_this, 11, 0, ["", 0]]		call BIS_fnc_param;
_workingParts =			[_this, 12, [], [[]]]		call BIS_fnc_param;
_consumesItems =		[_this, 13, false, [false]]	call BIS_fnc_param;
_bleedingCureValue =	[_this, 14, 0, [0]]			call BIS_fnc_param;
_bleedingCureMaxBleed =	[_this, 15, 0, [0]]			call BIS_fnc_param;

if(_name == "")									exitWith {PRINT_ERROR("MedicalActions NEED a name!");};
if(!(ISCHARP(_fncName) || ISCODE(_fncName)))	exitWith {PRINT_ERROR("MedicalActions NEED a execution function!");};
if(ISCHARP(_fncName) && {_fncName == ""})		then {_fncName = {};};
//if(_limitationName == "")						exitWith {PRINT_ERROR("MedicalActions NEED a limitation name!");};
//if(_animation == "")							exitWith {PRINT_ERROR("MedicalActions NEED an animation!");};
//if(_sound == "")								exitWith {PRINT_ERROR("MedicalActions NEED a sound!");};
//if(_image == "")								exitWith {PRINT_ERROR("MedicalActions NEED an image!");};
_index = count X39_MS2_var_Internal_MedicalActions_actionArray;
X39_MS2_var_Internal_MedicalActions_actionArray set [_index, [
														_name,					//0
														_fncName,				//1
														_limitationName,		//2
														_animation,				//3
														_animationTime,			//4
														_sound,					//5
														_soundTimeout,			//6
														_image,					//7
														_items,					//8
														_condition,				//9
														_allowSelfUse,			//10
														_healingValue,			//11
														_workingParts,			//12
														_consumesItems,			//13
														_bleedingCureValue,		//14
														_bleedingCureMaxBleed	//15
													]];
_index