#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	Callback function for Explosion eventHandler
 *	@Param1 - OBJECT - Object the event handler is assigned to
 *	@Param2 - SCALAR - Damage inflicted to the object
 *	@Return - NA
 */
private["_unit", "_sectionHit", "_damage", "_source", "_projectile"];

_unit = _this select 0;
_damage = (_this select 1) * X39_MS2_var_Damage_GlobalModificator * X39_MS2_var_Damage_ExplosionModificator;

//Check if damage source was an explosive
if(_projectile == "GrenadeHand" || {[_projectile, "AT", false] call BIS_fnc_inString}) then
{
	
};

0