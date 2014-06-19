#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Checks if given unit is bleeding
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - BOOL - true/false depending on if the unit is bleeding or not
 */
if(X39_MS2_var_Feature_EnableBlood) exitWith {false};
if(	 (_this call X39_MS2_fnc_getBleedingOfBody)		<= 0 &&
	{(_this call X39_MS2_fnc_getBleedingOfGeneric)	<= 0 &&
	{(_this call X39_MS2_fnc_getBleedingOfHands)	<= 0 &&
	{(_this call X39_MS2_fnc_getBleedingOfHead)		<= 0 &&
	{(_this call X39_MS2_fnc_getBleedingOfLegs)		<= 0 }}}}) exitWith { false };
true