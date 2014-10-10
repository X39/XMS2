#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will add given value to given units Aspirin value
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - Value to add
 * @Return - SCALAR - Current Aspirin of the unit
 */
if(!X39_MS2_var_Feature_EnableAspirin) exitWith {};
FORCELOCAL(_this select 0);
private["_Aspirin"];
_Aspirin = [(_this select 0)] call X39_MS2_fnc_getAspirin;
_Aspirin = _Aspirin + ((_this select 1) * X39_MS2_var_Drugs_Aspirin_GlobalAspirinModificator);
if(_Aspirin > X39_MS2_var_Drugs_Aspirin_maxAspirin) then
{
	_Aspirin = X39_MS2_var_Drugs_Aspirin_maxAspirin;
}
else
{
	if(_Aspirin < 0) then
	{
		_Aspirin = 0;
	};
};
[_this select 0, _Aspirin] call X39_MS2_fnc_setAspirin;
_Aspirin