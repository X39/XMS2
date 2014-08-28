#include "\X39_MS2_Scripting\default.hpp"
#define DMG_CAL_BASE 10
#define DMG_VEL_BASE 500
#define DMG_SIZE_BASE 0.276019
/*
 *	Callback function for HitPart eventHandler
 *	@Param1	 - OBJECT	  - Object that got injured/damaged
 *	@Param2	 - OBJECT	  - Unit that inflicted the damage.
 *							If injured by a vehicle impact or a fall the target itself is returned,
 *							or,
 *							in case of explosions,
 *							the null object.
 *							In case of explosives that were planted by someone (e.g. satchel charges),
 *							that unit is returned.
 *	@Param3	 - OBJECT	  - Object that was fired.
 *	@Param4	 - ARRAY(POS) - Position the bullet impacted (ASL).
 *	@Param5	 - ARRAY(VEC) - 3D speed at which bullet impacted.
 *	@Param6	 - ARRAY	  - Array of Strings with named selection of the object that were hit.
 *	@Param7	 - ARRAY	  - Ammo info:
 *							[
 *								hit value,
 *								indirect hit value,
 *								indirect hit range,
 *								explosive damage,
 *								ammo class name
 *							]
 *							OR,
 *							if there is no shot object:
 *							[
 *								impulse value on object collided with,
 *								0,
 *								0,
 *								0
 *							]
 *	@Param8	 - ARRAY(VEC)- vector that is orthogonal (perpendicular) to the surface struck.
 *							For example,
 *							if a wall was hit,
 *							vector would be pointing out of the wall at a 90 degree angle.
 *	@Param9	 - SCALAR	  - Radius (size) of component hit.
 *	@Param10 - STRING	  - Surface type struck.
 *	@Param11 - BOOL		  - true if object was directly hit,
 *							false if it was hit by indirect/splash damage.
 *	@Return - NA
 */
FORCELOCAL(_this select 0 select 0);
private	[
			"_unit",
			"_firer",
			"_projectile",
//			"_projectileImpactPosition",
			"_projectileImpactVelocity",
			"_sectionsHit",
			"_ammoInfo_hitValue",
//			"_ammoInfo_indirectHitValue",
//			"_ammoInfo_indirectHitRange",
//			"_ammoInfo_explosiveDamage",
			"_ammoInfo_projectileClass",
			"_surfaceVector",
			"_sizeOfComponentHit",
			"_surfaceType",
			"_wasDirectHit",
			"_caliberMultiplicator",
			"_velocityMultiplicator",
			"_contusioDamage",
			"_dmgP"
		];
_this = _this select 0;
_unit = _this select 0;
_firer = _this select 1;
_projectile = _this select 2;
//_projectileImpactPosition = _this select 3;
_projectileImpactVelocity = _this select 4;
_sectionsHit = _this select 5;
_ammoInfo_hitValue = _this select 6 select 0;
//_ammoInfo_indirectHitValue = _this select 6 select 1;
//_ammoInfo_indirectHitRange = _this select 6 select 2;
//_ammoInfo_explosiveDamage = _this select 6 select 3;
_ammoInfo_projectileClass = _this select 6 select 4;
_surfaceVector = _this select 7;
_sizeOfComponentHit = _this select 8;
_surfaceType = _this select 9;
_wasDirectHit = _this select 10;

_caliberMultiplicator = _ammoInfo_hitValue / DMG_CAL_BASE;
_velocityMultiplicator = (vectorMagnitude _ammoInfo_hitValue) / DMG_VEL_BASE;
_sizeMultiplicator = DMG_SIZE_BASE / _sizeOfComponentHit;
_damage = _caliberMultiplicator * _velocityMultiplicator * _sizeMultiplicator;
//ToDo: Implement Contusio damage (trauma damage) ==> A seperated damage type which adds up with bullet/explosion/etc. damage
_isContusioDamage = (_unit == _firer);

_unit setVariable ["X39_MS2_var_Damage_LastHitter", _firer];

{
	private["_index"];
	//missionNamespace getVariable format["X39_MS2_fnc_addDamageTo%1", _x];
	//missionNamespace getVariable format["X39_MS2_fnc_addBleedingTo%1", _x];
	//missionNamespace getVariable format["X39_MS2_fnc_setAterialDamage%1", _x];
	_index = getHitzoneIndexByName(_x);
	if(_index != -1) then
	{
		//Damage related stuff
			[_unit, _damage] call (missionNamespace getVariable format["X39_MS2_fnc_addDamageTo%1", _x]);
		//Bleeding related stuff
		if(!_isContusioDamage) then
		{
			[_unit, _damage] call (missionNamespace getVariable format["X39_MS2_fnc_addBleedingTo%1", _x]);
			
			if(getHitzoneInfo(_index, HITZONE_HasAterie)) then
			{
				if(random 100 <= X39_MS2_var_Bleeding_ChanceForAterialDamageP * 100) then
				{
					[_unit, _x, true] call X39_MS2_fnc_setAterialDamage;
				};
			};
		};
	};
}count _sectionsHit;


_dmgP = ([_unit] call X39_MS2_fnc_getDamageTotal) / ([] call X39_MS2_fnc_getMaxDamageTotal);
if(_dmgP > X39_MS2_var_Damage_knockOutLimitP) then
{
	if(_dmgP > X39_MS2_var_Damage_DeathLimitP) then
	{
		if(X39_MS2_var_Damage_AllowRealKillingOnMaxDamage && _dmgP > 1) then
		{
			DEBUG_LOG_WFn_SC(format["Killing '%1' because X39_MS2_var_Damage_AllowRealKillingOnMaxDamage == true && _dmgP == %2" COMMA _unit COMMA _dmgP])
			[_unit, true] call X39_MS2_fnc_killUnit;
		}
		else
		{
			[_unit, 4, X39_MS2_var_Damage_DeathTime, localize "STR_X39_MS2_Scripting_cb_handleDamage_death"] call X39_MS2_fnc_blackOutUnit;
			[_unit, time, 5] call X39_MS2_fnc_setFlatLine;
		};
	}
	else
	{
		[_unit, 2, -1, localize "STR_X39_MS2_Scripting_cb_handleDamage_knockOut"] call X39_MS2_fnc_blackOutUnit;
	};
};

if(X39_MS2_var_Damage_AllowDeathThroughFullDamageAtHeadHitzone) then
{
	if(([_unit] call getFnc(X39_MS2_fnc_getDamageOf,HITZONE_Head)) >= getFnc(X39_MS2_var_Damage_maxDamage,HITZONE_Head)) then
	{
		[_unit, true] call X39_MS2_fnc_killUnit;
	};
};