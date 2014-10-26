#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will return current clotting value of given unit
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - ANY - if provided (count _this > 1) then will return the TRUE clotting value instead of the calculated one
 * @Return - SCALAR - Current clotting value of the unit
 */
private["_val"];
if(!X39_MS2_var_Bleeding_EnableClotting) exitWith {1};
_val = (_this select 0) getVariable ["X39_MS2_var_Bleeding_Clotting", 1];
if(count _this == 1) exitWith { _val };
if(X39_MS2_var_Drugs_Aspirin_hasImpactOnBloodClotting) then
{
	
};
if(_val > 2) then { _val = 2; };
if(_val < 0) then { _val = 0; };

_val