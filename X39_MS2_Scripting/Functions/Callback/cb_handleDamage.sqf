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

//Check for environmental dmg damag
if((_this select 4) == "") then
{
	private ["_damage", "_unit", "_currentDamage"];
	_unit = _this select 0;
	_damage = _this select 2;
	//Ad now the damage to the parts
	{
		_currentDamage = _damage * (missionNamespace getVariable format["X39_MS2_var_FallDamage_%1Modificator", _x]);
		[_unit, _currentDamage] call (missionNamespace getVariable format["X39_MS2_fnc_addDamageTo%1", _x]);
		false
	} count [
		stringify(HITZONE_LeftFoot),
		stringify(HITZONE_RightFoot),
		stringify(HITZONE_LeftLowerLeg),
		stringify(HITZONE_RightLowerLeg),
		stringify(HITZONE_LeftUpperLeg),
		stringify(HITZONE_RightUpperLeg),
		stringify(HITZONE_LowerBody),
		stringify(HITZONE_UpperBody)
	];

};

//Keep player at 0 ArmA damage to make custom damage system handling possible
0