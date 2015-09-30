#include "\X39_MS2_Scripting\default.hpp"
/* 
 * !FUNCTION IS NOT CALLSAVE!
 * returns current units pain value
 * 
 * @Param1 - OBJECT - XMS Unit to handle
 * @Return - SCALAR
 * @Author - X39
 */
private["_unit", "_pain", "_calcBase"];
_unit = _this select 0;
_pain = 0;
if(X39_MS2_var_Pain_useExtraPain) then
{
	_pain = _pain + (_unit getVariable ["X39_MS2_var_Pain_value", -1]);
};
if(X39_MS2_var_Pain_useCurrentDamageValues) then
{
	{
		_pain = _pain + ((([_unit] call (missionNamespace getVariable format["X39_MS2_fnc_getDamageOf%1", _x select HITZONE_NAME])) * (missionNamespace getVariable format["X39_MS2_var_Pain_DamagePainFor%1Modificator", _x select HITZONE_NAME])) * X39_MS2_var_Pain_DamagePainGlobalModificator);
		false
	}count X39_MS2_var_Internal_HitZones;
};



if(X39_MS2_var_Drugs_Morphine_useForPain) then
{
	_calcBase = (([_unit] call X39_MS2_fnc_getMorphine) / (X39_MS2_var_Pain_maxPain * X39_MS2_var_Drugs_Morphine_PainMinForFullCureP)) * X39_MS2_var_Drugs_Morphine_PainCureValueP;
	if(_calcBase > 1) then { _calcBase = 1; };
	if(_calcBase < 0) then { _calcBase = 0; };
	_pain = _pain - (_pain * _calcBase);
};
if(X39_MS2_var_Drugs_Adrenaline_useForPain) then
{
	_calcBase = (([_unit] call X39_MS2_fnc_getAdrenaline) / (X39_MS2_var_Drugs_Adrenaline_maxAdrenaline * X39_MS2_var_Drugs_Adrenaline_PainMinForFullCureP)) * X39_MS2_var_Drugs_Adrenaline_PainCureValueP;
	if(_calcBase > 1) then { _calcBase = 1; };
	if(_calcBase < 0) then { _calcBase = 0; };
	_pain = _pain - (_pain * _calcBase);
};
if(X39_MS2_var_Drugs_Aspirin_useForPain) then
{
	_calcBase = (([_unit] call X39_MS2_fnc_getAspirin) / (X39_MS2_var_Drugs_Aspirin_maxAspirin * X39_MS2_var_Drugs_Aspirin_PainMinForFullCureP)) * X39_MS2_var_Drugs_Aspirin_PainCureValueP;
	if(_calcBase > 1) then { _calcBase = 1; };
	if(_calcBase < 0) then { _calcBase = 0; };
	_pain = _pain - (_pain * _calcBase);
};
if(_pain < 0) then { _pain = 0; };
_pain