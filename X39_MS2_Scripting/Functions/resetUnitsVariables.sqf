#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	Resets ALL player variables back to default (patches a unit up to 100%)
 *	
 *	@Param1 - OBJECT - Unit
 *	@Return - NA
 */
FORCELOCAL(_this select 0);
params [["_unit", objNull, [objNull]]];
if(isNull _unit) exitWith {PRINT_ERROR("Cannot reset NULL unit");};
{
	if(!(_x select 4)) then
	{
		_unit setVariable[_x select 0, [] call (_x select 1), true];
	};
	false
}count X39_MS2_var_Internal_UnitVariables;
_unit setVariable ["X39_MS2_var_UnitInitialized", true];