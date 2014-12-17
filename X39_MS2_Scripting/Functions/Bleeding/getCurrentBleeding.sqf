#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * returns the current bleeding with aterial damage etc. calculated in
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - SCALAR - Current bleeding of the unit (> 0)
 */
if(!X39_MS2_var_Feature_EnableBlood) exitWith {0};
private["_val"];
_val = 0;
_unit = _this select 0;
{
	if(!([_unit, _x select HITZONE_NAME] call X39_MS2_fnc_getTournique)) then
	{
		_val = _val + (
						([_unit] call (missionNamespace getVariable format["X39_MS2_fnc_getBleedingOf%1", _x select HITZONE_NAME])) *
						( if(_x select HITZONE_HasAterie && {([_unit, _x select HITZONE_NAME] call X39_MS2_fnc_getAterialDamage)}) then {
								(missionNamespace getVariable format["X39_MS2_var_Bleeding_AterialDamageMultiplicator%1", _x select HITZONE_NAME])
							} else {
								1
							} )
					);
	};
	false
}count X39_MS2_var_Internal_HitZones;
_val