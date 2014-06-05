#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Creates a new entry inside of the MedcialActionArray (MAA)
 *
 *	@Param1		- STRING	- ItemID (no uniqueCheck is performed here!)
 *	@Param2		- STRING	- string to use for the localize command (action name
 *	@Param3		- STRING	- FunctionName to execute (function gets: [UNITEXECUTE:OBJECT, UNITTARGETED:OBJECT, EFFICENCY:SCALAR, PART:STRING])
 *								Function can use the following parent functions
 *								- _fncAdd	([UNIT:OBJECT, VALUE:SCALAR])
 *								- _fncSet	([UNIT:OBJECT, VALUE:SCALAR])
 *								- _fncGet	([UNIT:OBJECT, VALUE:SCALAR])
 *	@Param4		- STRING	- Limitation name
 *	@Param5		- STRING	- animation to play
 *	@Param6		- STRING	- soundfile to play
 *	@Param7		- STRING	- image of action
 *	@Param8		- STRING	- Variable name for the timeout before actual action will be applied
 *	@Param9		- ARRAY		- array containing item names which are valid for this medical action
 *	@Param10	- CODE		- condition when this action is valid to be executed
 *	@Param11	- SCALAR	- 0 = can be used for self and others, 1 = only self, 2 = only others
 *	@Param12	- STRING	- Variable name for the healing value
 *	@Param13	- ARRAY		- Array containing the parts where this action is accepted on
 *	@Param14	- ARRAY		- items to be consumed when this is applied
 *	@Param15	- SCALAR	- _bleedingCureValue
 *	@Param16	- SCALAR	- _bleedingCureMaxBleed
 *	@Param17	- ARRAY		- Items required for crafting (itemIDs)
 *	@Return		- SCALAR	- MAA ID
 *	@Author - X39|Cpt. HM Murdock
 */
private["_id", "_index", "_name", "_fncName", "_limitationName", "_animation", "_sound", "_soundTimeout", "_image", "_timeout", "_items", "_condition", "_allowSelfUse", "_healingValue", "_animationTime", "_itemsForCrafting", "_workingParts", "_consumesItems", "_bleedingCureValue", "_bleedingCureMaxBleed"];
_id =					[_this, 0	, str (count X39_MS2_var_Internal_MedicalActions_actionArray), [""]]	call BIS_fnc_param;
_name =					[_this, 1	, "", [""]]																call BIS_fnc_param;
_fncName =				[_this, 2	, {}, [{}, ""]]															call BIS_fnc_param;
_limitationName =		[_this, 3	, "", [""]]																call BIS_fnc_param;
_animation =			[_this, 4	, "", [""]]																call BIS_fnc_param;
_animationTime =		[_this, 5	, -1, [0]]																call BIS_fnc_param;
_sound =				[_this, 6	, "", [""]]																call BIS_fnc_param;
_soundTimeout =			[_this, 7	, -1, [0]]																call BIS_fnc_param;
_image =				[_this, 8	, "", [""]]																call BIS_fnc_param;
_items =				[_this, 9	, [], [[]]]																call BIS_fnc_param;
_condition =			[_this, 10	, {true}, [{}]]															call BIS_fnc_param;
_allowSelfUse =			[_this, 11	, 0, [0]]																call BIS_fnc_param;
_healingValue =			[_this, 12	, 0, ["", 0]]															call BIS_fnc_param;
_workingParts =			[_this, 13	, [], [[]]]																call BIS_fnc_param;
_consumesItems =		[_this, 14	, true, [true]]															call BIS_fnc_param;
_bleedingCureValue =	[_this, 15	, 0, [0]]																call BIS_fnc_param;
_bleedingCureMaxBleed =	[_this, 16	, 0, [0]]																call BIS_fnc_param;
_itemsForCrafting	 =	[_this, 17	, [], [[]]]																call BIS_fnc_param;

if(_name == "")									exitWith {PRINT_ERROR("MedicalActions NEED a name!");};
if(!(ISCHARP(_fncName) || ISCODE(_fncName)))	exitWith {PRINT_ERROR("MedicalActions NEED a execution function!");};
if(ISCHARP(_fncName) && {_fncName == ""})		then {_fncName = {};};
//if(_limitationName == "")						exitWith {PRINT_ERROR("MedicalActions NEED a limitation name!");};
//if(_animation == "")							exitWith {PRINT_ERROR("MedicalActions NEED an animation!");};
//if(_sound == "")								exitWith {PRINT_ERROR("MedicalActions NEED a sound!");};
if(_image == "")								exitWith {PRINT_ERROR("MedicalActions NEED an image!");};
_index = count X39_MS2_var_Internal_MedicalActions_actionArray;
for "_i" from 0 to ((count _workingParts) - 1) do
{
	_workingParts set[_i, toUpper (_workingParts select _i)];
};
X39_MS2_var_Internal_MedicalActions_actionArray set [_index, [
														toUpper _id,			//0
														_name,					//1
														_fncName,				//2
														_limitationName,		//3
														_animation,				//4
														_animationTime,			//5
														_sound,					//6
														_soundTimeout,			//7
														_image,					//8
														_items,					//9
														_condition,				//10
														_allowSelfUse,			//11
														_healingValue,			//12
														_workingParts,			//13
														_consumesItems,			//14
														_bleedingCureValue,		//15
														_bleedingCureMaxBleed,	//16
														_itemsForCrafting		//17
													]];
_index