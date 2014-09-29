#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	Callback function for HandleDamage eventHandler
 *	@Param1 - OBJECT - Object the event handler is assigned to
 *	@Param2 - OBJECT - Object which fires a weapon near the unit
 *	@Param3 - NUMBER - Distance in meters between the unit and firer (max. distance ~69m)
 *	@Param4 - STRING - Fired weapon
 *	@Param5 - STRING - Muzzle that was used
 *	@Param6 - STRING - Current mode of the fired weapon
 *	@Param7 - STRING - Ammo used
 *	@Return - NA
 */
private["_unit", "_firerer", "_distance", "_usedWeapon", "_usedMuzzle", "_usedFiremode", "_usedAmmo", "_usedAmmoClass", "_valHit", "_valCal", "_fixVal", "_distance", "_damage"];

_unit = _this select 0;
_firerer = _this select 1;
_distance = _this select 2;
_usedWeapon = _this select 3;
_usedMuzzle = _this select 4;
_usedFiremode = _this select 5;
_usedAmmo = _this select 6;
_usedAmmoClass = (configFile >> "CfgAmmo" >> _usedAmmo);

//Check if damage source was an AT weapon
if(X39_MS2_var_Feature_EnableBackBlast && {[_usedWeapon, "LAUNCH", false] call BIS_fnc_inString}) then
{
	{
		if(_x != _firerer && {lineIntersects [eyePos _firerer, eyePos _x, _firerer] && {[position _firerer, (direction _firerer) - 180, X39_MS2_var_BackBlast_maxAngle / 2, position _x] call BIS_fnc_inAngleSector}}) then
		{
			_distance = (_x distance _firerer) - X39_MS2_var_BackBlast_RangeMaxDamage;
			if(_distance < 0) then
			{
				_damage = X39_MS2_var_BackBlast_MaxDamage;
			}
			else
			{
				_damage = (1 - (_distance / X39_MS2_var_BackBlast_DamageFalloffRange)) * X39_MS2_var_BackBlast_MaxDamage;
			};
			{
				[_unit, _damage] call (missionNamespace getVariable format["X39_MS2_fnc_addDamageTo%1", _x select HITZONE_NAME]);
				false
			}count X39_MS2_var_Internal_HitZones;
		};
	}forEach (_firerer nearEntities ["Man", X39_MS2_var_BackBlast_RangeMaxDamage + X39_MS2_var_BackBlast_DamageFalloffRange]);	
};
if(!(_unit getVariable ["X39_MS2_var_hasEarplugs", false]) && _usedFiremode != "Throw") then
{
	
	private["_distance"];
	_distance = 1 - ((_this select 2) / 69);
	_valHit = getNumber (_usedAmmoClass >> "hit");
	_valCal = getNumber (_usedAmmoClass >> "caliber");
	_fixVal = (_valHit * _valCal * _distance);
	DEBUG_LOG_WFn_SC(format["Hearing calculation: _distance => %1" COMMA _distance])
	DEBUG_LOG_WFn_SC(format["Hearing calculation: _valHit => %1" COMMA _valHit])
	DEBUG_LOG_WFn_SC(format["Hearing calculation: _valCal => %1" COMMA _valCal])
	DEBUG_LOG_WFn_SC(format["Hearing calculation: _fixVal => %1" COMMA _fixVal])
	DEBUG_LOG_WFn_SC(format["Hearing calculation: adding to current hearing => %1" COMMA -(0.1 / _fixVal)])
	if(_fixVal != 0) then
	{
		[_unit,  -(0.1 / _fixVal) ] call X39_MS2_fnc_addHearing;
	};
};
[_unit, X39_MS2_var_Drugs_Adrenaline_adrenalineAddedThroughShooting, true] call X39_MS2_fnc_addAdrenaline;
