#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * Will return current damage value of given unit for the GENERIC hitzone
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - SCALAR - Current damage of the unit
 */
private["_unit", "_pain"];
_unit = _this select 0;
_pain = 0;
if(X39_MS2_var_Pain_useExtraPain) then
{
	_pain = _pain + (_unit getVariable ["X39_MS2_var_Pain_value", -1]);
};
if(X39_MS2_var_Pain_useCurrentDamageValues) then
{
	_pain = _pain + ((([_unit] call X39_MS2_fnc_getDamageOfGeneric)	* X39_MS2_var_Pain_DamagePainForGenericModificator)	* X39_MS2_var_Pain_DamagePainForGlobalModificator);
	_pain = _pain + ((([_unit] call X39_MS2_fnc_getDamageOfHead)	* X39_MS2_var_Pain_DamagePainForHeadModificator)	* X39_MS2_var_Pain_DamagePainForGlobalModificator);
	_pain = _pain + ((([_unit] call X39_MS2_fnc_getDamageOfBody)	* X39_MS2_var_Pain_DamagePainForBodyModificator)	* X39_MS2_var_Pain_DamagePainForGlobalModificator);
	_pain = _pain + ((([_unit] call X39_MS2_fnc_getDamageOfHands)	* X39_MS2_var_Pain_DamagePainForHandsModificator)	* X39_MS2_var_Pain_DamagePainForGlobalModificator);
	_pain = _pain + ((([_unit] call X39_MS2_fnc_getDamageOfLegs)	* X39_MS2_var_Pain_DamagePainForLegsModificator)	* X39_MS2_var_Pain_DamagePainForGlobalModificator);
};



if(X39_MS2_var_Drugs_Morphine_useMorphineForPain) then //NEEDS TO BE EXECUTED LAST!
{
	_morphCalcBase = (([_unit] call X39_MS2_fnc_getMorphine) / (X39_MS2_var_Pain_maxPain * X39_MS2_var_Drugs_Morphine_morphinePainMinForFullCureP)) * X39_MS2_var_Drugs_Morphine_morphinePainCureValueP;
	if(_morphCalcBase > 1) then
	{
		_morphCalcBase = 1;
	};
	if(_morphCalcBase < 0) then
	{
		_morphCalcBase = 0;
	};
	_pain = _pain - (_pain * _morphCalcBase);
};
if(_pain < 0) then
{
	_pain = 0;
};
_pain