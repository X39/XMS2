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
	_pain = _pain + (((X39_MS2_var_Damage_maxDamageHead		* X39_MS2_var_Pain_DamagePainForGenericModificator)	* X39_MS2_var_Pain_DamagePainForGlobalModificator);
	_pain = _pain + (((X39_MS2_var_Damage_maxDamageBody		* X39_MS2_var_Pain_DamagePainForHeadModificator)	* X39_MS2_var_Pain_DamagePainForGlobalModificator);
	_pain = _pain + (((X39_MS2_var_Damage_maxDamageHands	* X39_MS2_var_Pain_DamagePainForBodyModificator)	* X39_MS2_var_Pain_DamagePainForGlobalModificator);
	_pain = _pain + (((X39_MS2_var_Damage_maxDamageLegs		* X39_MS2_var_Pain_DamagePainForHandsModificator)	* X39_MS2_var_Pain_DamagePainForGlobalModificator);
	_pain = _pain + (((X39_MS2_var_Damage_maxDamageGeneric	* X39_MS2_var_Pain_DamagePainForLegsModificator)	* X39_MS2_var_Pain_DamagePainForGlobalModificator);
};
_pain





