#include "\X39_MS2_Scripting\default.hpp"
/* 
 * Will return the maximum Pain a unit can reach
 * 
 * @Return - SCALAR
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
		_pain = _pain + (((missionNamespace getVariable format["X39_MS2_var_Damage_maxDamage%1", _x select HITZONE_NAME]) * (missionNamespace getVariable format["X39_MS2_var_Pain_DamagePainFor%1Modificator", _x select HITZONE_NAME])) * X39_MS2_var_Pain_DamagePainGlobalModificator);
		false
	}count X39_MS2_var_Internal_HitZones;
};
_pain





