#include "\X39_MS2_Scripting\default.hpp"
/* 
 * Will return the maximum damage a unit can receive
 * 
 * @Return - SCALAR - total maximum damage a unit can receive
 */
private["_damage"];

_damage = 0;

_damage = _damage + X39_MS2_var_Damage_maxDamageHead;
_damage = _damage + X39_MS2_var_Damage_maxDamageBody;
_damage = _damage + X39_MS2_var_Damage_maxDamageHands;
_damage = _damage + X39_MS2_var_Damage_maxDamageLegs;
_damage = _damage + X39_MS2_var_Damage_maxDamageGeneric;

_damage