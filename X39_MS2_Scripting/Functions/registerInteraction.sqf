#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Creates a new entry inside of the MedcialActionArray (MAA)
 *
 *	@ParamCount 7
 *	@Param1		- STRING		- displayed text
 *	@Param2		- STRING		- limitation name (use "DUMMY" if you dont want/got one)
 *	@Param3		- BOOL			- allow usage inside of a vehicle
 *	@Param4		- CODE			- condition to display option
 *	@Param5		- STRING/CODE	- code to execute when action is performed
 *	@oParam6	- STRING/CODE	- "UpdateCode" see http://x39software.unitedtacticalforces.de/wiki/index.php?title=ArmA3_XActionUI_ActionsArray
 *	@oParam7	- ARRAY			- "SubActions" see http://x39software.unitedtacticalforces.de/wiki/index.php?title=ArmA3_XActionUI_ActionsArray
 *	@Return		- SCALAR		- ID
 *	@Author - X39|Cpt. HM Murdock
 */
private["_displayText", "_limitationName", "_allowUsageInVehicle", "_conditionToDisplay", "_executionCode", "_auUpdateCode", "_auSubActions", "_index", "_arr"];
_displayText			=	[_this, 0, "", [""]]				call BIS_fnc_param;
_limitationName			=	[_this, 1, "DUMMY", [""]]			call BIS_fnc_param;
_allowUsageInVehicle	=	[_this, 2, false, [false]]			call BIS_fnc_param;
_conditionToDisplay		=	[_this, 3, {true}, [{}]]			call BIS_fnc_param;
_executionCode			=	[_this, 4, {true}, [{}, ""]]		call BIS_fnc_param;
_auUpdateCode			=	[_this, 5, "", [{}, ""]]			call BIS_fnc_param;
_auSubActions			=	[_this, 6, [], [[]]]				call BIS_fnc_param;

_index = count X39_MS2_var_Internal_InteractionMenu_Entries;
_arr = [
			_displayText,
			_limitationName,
			_allowUsageInVehicle, 
			_conditionToDisplay,
			_executionCode
		];
if(_auUpdateCode != "") then
{
	_arr set[count _arr, _auUpdateCode];
};
if(count _auSubActions != 0) then
{
	_arr set[count _arr, _auSubActions];
};
X39_MS2_var_Internal_InteractionMenu_Entries set [_index, _arr];

_index