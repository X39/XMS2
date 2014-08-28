#include "\X39_MS2_Scripting\default.hpp"
/* 
 * Will return the maximum Pain a unit can reach
 * 
 * @Return - SCALAR - Current damage of the unit
 */
private["_pain"];
_pain = 0;
if(X39_MS2_var_Pain_useExtraPain) then
{
	_pain = _pain + X39_MS2_var_Pain_maxPain;
};
if(X39_MS2_var_Pain_useCurrentDamageValues) then
{
	{
		_pain = _pain + (((missionNamespace getVariable format["X39_MS2_var_Damage_maxDamageHead%1", _x select HITZONE_Name]) * (missionNamespace getVariable format["X39_MS2_var_Pain_DamagePainFor%1Modificator", _x select HITZONE_Name])) * X39_MS2_var_Pain_DamagePainGlobalModificator);
	}count X39_MS2_var_Internal_HitZones;
};
_pain





