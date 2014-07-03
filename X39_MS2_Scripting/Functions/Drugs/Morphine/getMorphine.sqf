#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will return current damage value of given unit for the GENERIC hitzone
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - ANY - if provided (count _this > 1) then will return the TRUE morphine value instead of the calculated one
 * @Return - SCALAR - Current damage of the unit
 */
private["_val"];

_val = (_this select 0) getVariable ["X39_MS2_var_Drugs_Morphine_value", -1];
if(count _this < 2) then
{
	if(X39_MS2_var_Drugs_Naloxone_hasImpactOnMorphine) then
	{
		private["_naloxone"];
		_naloxone = X39_MS2_var_Drugs_Naloxone_MorphineImpactMultiplicator * (1 - (([(_this select 0)] call X39_MS2_fnc_getNaloxone) / X39_MS2_var_Drugs_Naloxone_maxNaloxone));
		if(_naloxone > 1) then
		{
			_naloxone = 1;
		}
		else
		{
			if(_naloxone < 0) then
			{
				_naloxone = 0;
			};
		};
		_val = _val * _naloxone;
	};
};
_val