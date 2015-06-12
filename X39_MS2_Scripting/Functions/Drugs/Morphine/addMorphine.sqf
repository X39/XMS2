#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will add given value to given units morphine value
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to add
 * @Return - SCALAR - Current morphine of the unit
 */
if(!X39_MS2_var_Feature_EnableMorphine) exitWith {};
FORCELOCAL(_this select 0);
private["_morphine"];
_morphine = [(_this select 0), true] call X39_MS2_fnc_getMorphine;
_morphine = _morphine + ((_this select 1) * X39_MS2_var_Drugs_Morphine_GlobalMorphineModificator);
if(_morphine > X39_MS2_var_Drugs_Morphine_maxMorphine) then
{
	_morphine = X39_MS2_var_Drugs_Morphine_maxMorphine;
}
else
{
	if(_morphine < 0) then
	{
		_morphine = 0;
	};
};
[_this select 0, _morphine] call X39_MS2_fnc_setMorphine;
_morphine