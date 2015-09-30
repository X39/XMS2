#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * returns current morphine value of given unit
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - ANY - if provided (count _this > 1) then will return the TRUE morphine value instead of the calculated one
 * @Return - SCALAR - Current morphine value of the unit
 */
private["_val"];

_val = (_this select 0) getVariable ["X39_MS2_var_Drugs_Morphine_value", -1];
if(count _this < 2) then
{
	if(X39_MS2_var_Drugs_naloxone_hasImpactOnMorphine) then
	{
		private["_naloxone"];
		_naloxone = X39_MS2_var_Drugs_Naloxone_MorphineImpactMultiplicator * ((([(_this select 0), true] call X39_MS2_fnc_getNaloxone) / X39_MS2_var_Drugs_naloxone_maxNaloxone));
		if(_naloxone > X39_MS2_var_Drugs_naloxone_maxNaloxone) then { _naloxone = X39_MS2_var_Drugs_Naloxone_maxNaloxone; };
		if(_naloxone < 0) then { _naloxone = 0; };
		_val = _val - _naloxone;
	};
};


if(_val > X39_MS2_var_Drugs_Morphine_maxMorphine) then { _val = X39_MS2_var_Drugs_Morphine_maxMorphine; };
if(_val < 0) then { _val = 0; };
_val