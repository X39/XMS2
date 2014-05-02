#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	Callback function for HandleDamage eventHandler
 *	@Param1 - OBJECT - Object the event handler is assigned to.
 *	@Param2 - STRING - Name of the selection where the unit was damaged. "" for over-all structural damage, "?" for unknown selections.
 *	@Param3 - SCALAR - Resulting level of damage for the selection.
 *	@Param4 - OBJECT - The source unit that caused the damage.
 *	@Param5 - STRING - Classname of the projectile that caused inflicted the damage. ("" for unknown, such as falling damage.)
 *	@Return - SCALAR - New damage value (always 0)
 */
private["_unit", "_sectionHit", "_damage", "_source", "_projectile", "_isExplosion", "_dmgP"];

_unit = _this select 0;
_sectionHit = _this select 1;
_damage = (_this select 2) * X39_MS2_var_Damage_GlobalModificator;
_source = _this select 3;
_projectile = _this select 4;

_isExplosion = false;

_unit setVariable ["X39_MS2_var_Damage_LastHitter", _source];

//Check if damage source was an explosive
if(_projectile == "GrenadeHand" || {[_projectile, "AT", false] call BIS_fnc_inString}) then
{
	_damage = _damage * X39_MS2_var_Damage_ExplosionModificator;
	_isExplosion = true;
};

[] call
{
	if(_sectionHit == "head") exitWith
	{
		[_unit, _damage] call X39_MS2_fnc_addDamageToHead;
		if(_damage > X39_MS2_var_Bleeding_minDamageRequiredForHead) then
		{
			[_unit, _damage * X39_MS2_var_Bleeding_GlobalModificator * (if(_isExplosion) then {X39_MS2_var_Bleeding_ExplosionModificator} else {1})] call X39_MS2_fnc_addBleedingToHead;
		};
		0
	};
	if(_sectionHit == "body") exitWith
	{
		[_unit, _damage] call X39_MS2_fnc_addDamageToBody;
		if(_damage > X39_MS2_var_Bleeding_minDamageRequiredForBody) then
		{
			[_unit, _damage * X39_MS2_var_Bleeding_GlobalModificator * (if(_isExplosion) then {X39_MS2_var_Bleeding_ExplosionModificator} else {1})] call X39_MS2_fnc_addBleedingToBody;
		};
		0
	};
	if(_sectionHit == "hands") exitWith
	{
		[_unit, _damage] call X39_MS2_fnc_addDamageToHands;
		if(_damage > X39_MS2_var_Bleeding_minDamageRequiredForHands) then
		{
			[_unit, _damage * X39_MS2_var_Bleeding_GlobalModificator * (if(_isExplosion) then {X39_MS2_var_Bleeding_ExplosionModificator} else {1})] call X39_MS2_fnc_addBleedingToHands;
		};
		0
	};
	if(_sectionHit == "legs") exitWith
	{
		[_unit, _damage] call X39_MS2_fnc_addDamageToLegs;
		if(_damage > X39_MS2_var_Bleeding_minDamageRequiredForLegs) then
		{
			[_unit, _damage * X39_MS2_var_Bleeding_GlobalModificator * (if(_isExplosion) then {X39_MS2_var_Bleeding_ExplosionModificator} else {1})] call X39_MS2_fnc_addBleedingToLegs;
		};
		0
	};
	if(_sectionHit == "") exitWith
	{
		[_unit, _damage] call X39_MS2_fnc_addDamageToGeneric;
		if(_damage > X39_MS2_var_Bleeding_minDamageRequiredForGeneric) then
		{
			[_unit, _damage * X39_MS2_var_Bleeding_GlobalModificator * (if(_isExplosion) then {X39_MS2_var_Bleeding_ExplosionModificator} else {1})] call X39_MS2_fnc_addBleedingToGeneric;
		};
		0
	};
};
_dmgP = ([_unit] call X39_MS2_fnc_getDamageTotal) / ([] call X39_MS2_fnc_getMaxDamageTotal);
if(_dmgP > X39_MS2_var_Damage_knockOutLimitP) then
{
	if(_dmgP > X39_MS2_var_Damage_DeathLimitP) then
	{
		if(X39_MS2_var_Damage_AllowRealKillingOnMaxDamage && _dmgP > 1) then
		{
			[_unit, true] call X39_MS2_fnc_killUnit;
		}
		else
		{
			[_unit, 4, -1, localize "STR_X39_MS2_Scripting_cb_handleDamage_death"] call X39_MS2_fnc_blackOutUnit;
			[_unit, time] call X39_MS2_fnc_setFlatLine;
		};
	}
	else
	{
		[_unit, 2, -1, localize "STR_X39_MS2_Scripting_cb_handleDamage_knockOut"] call X39_MS2_fnc_blackOutUnit;
	};
};
0