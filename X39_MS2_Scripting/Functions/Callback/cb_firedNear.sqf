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
private["_unit", "_firerer", "_distance", "_usedWeapon", "_usedMuzzle", "_usedFiremode", "_usedAmmo", "_usedAmmoClass", "_valHit", "_valCal", "_fixVal"];

_unit = _this select 0;
_firerer = _this select 1;
_distance = _this select 2;
_usedWeapon = _this select 3;
_usedMuzzle = _this select 4;
_usedFiremode = _this select 5;
_usedAmmo = _this select 6;
_usedAmmoClass = (configFile >> "CfgAmmo" >> _usedAmmo);

//Check if damage source was an AT weapon
if(X39_MS2_var_Feature_EnableBackBlast && {[_projectile, "AT", false] call BIS_fnc_inString || {[_usedWeapon, "LAUNCH", false] call BIS_fnc_inString}}) then
{
//TODO: FUCKING CRAPPY BACKBLAST _._
	////if(_unit == _firerer) exitWith {};
	//if(_unit distance _firerer < X39_MS2_var_BackBlast_Range) then
	//{
	//	_ovUnit =	[
	//					(position _firerer select 0) - (position _unit select 0),
	//					(position _firerer select 1) - (position _unit select 1),
	//					(position _firerer select 2) - (position _unit select 2)
	//				];
	//	_dirFirerer180 = (direction _firerer) - 180;
	//	_v180 = [cos _dirFirerer180, sin _dirFirerer180];
	//	_sp_ovUnit_v180 = ((_ovUnit select 0) * (_v180 select 0)) + ((_ovUnit select 1) * (_v180 select 1));
	//	_l_sp_ovUnit_v180 = aCos _sp_ovUnit_v180 / ( sqrt( ((_ovUnit select 0) ^ 2) + ((_ovUnit select 1) ^ 2) ) + ((_v180 select 0) ^ 2) + ((_v180 select 1) ^ 2) ) );
	//	if(180 + X39_MS2_var_BackBlast_maxAngle > _l_sp_ovUnit_v180 && 180 - X39_MS2_var_BackBlast_maxAngle < _l_sp_ovUnit_v180) then
	//	{
	//		systemChat "GOT DAMNED! YOUVE GOT HIT BY A BACKBLAST";
	//		systemChat str [_ovUnit, _v180, _sp_ovUnit_v180, _l_sp_ovUnit_v180];
	//	};
	//};
};
if(!(_unit getVariable ["X39_MS2_var_hasEarplugs", false]) && _usedFiremode != "Throw") then
{
	private["_distance"];
	_distance = 1 - ((_this select 2) / 69);
	_valHit = getNumber (_ammoClass >> "hit");
	_valCal = getNumber (_ammoClass >> "caliber");
	_fixVal = (_valHit * _valCal * _distance);
	
	[_unit, if(_fixVal == 0) then { 0 } else { 0.1 / _fixVal} ] call X39_MS2_fnc_addHearing;
};
[_unit, X39_MS2_var_Adrenaline_adrenalineAddedThroughShooting, true] call X39_MS2_fnc_addAdrenaline;
