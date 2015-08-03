#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	Checks if given unit is a XMS2 compmatible Unit
 *	
 *	@Param1 - OBJECT - Unit to check
 *	@Return - BOOL
 */
params[["_unit", objNullm [objNull]]];

if(isNull _unit) exitWith { false };
(_unit getVariable ["X39_MS2_var_UnitInitialized", false])