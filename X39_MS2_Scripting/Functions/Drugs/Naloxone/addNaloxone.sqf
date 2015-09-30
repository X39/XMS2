#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will add given value to given units naloxone value
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to add
 * @Return - SCALAR - Current naloxone of the unit
 */
if(!X39_MS2_var_Feature_EnableNaloxone) exitWith {};
FORCELOCAL(_this select 0);
private["_naloxone"];
_naloxone = [(_this select 0)] call X39_MS2_fnc_getNaloxone;
_naloxone = _naloxone + ((_this select 1) * X39_MS2_var_Drugs_Naloxone_NaloxoneGlobalMultiplicator);
if(_naloxone > X39_MS2_var_Drugs_Naloxone_maxNaloxone) then
{
	_naloxone = X39_MS2_var_Drugs_Naloxone_maxNaloxone;
};
if(_naloxone < 0) then
{
	_naloxone = 0;
};
[_this select 0, _naloxone] call X39_MS2_fnc_setNaloxone;
_naloxone