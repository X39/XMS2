#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	XMSTick Handler
 *	Description will not be available as this is not intended to be callen by anyone but the XMSTicker
 *	Available parent variables:
 *		_ppeDynamicBlur			- range 0 - 1 | ammount of blur over entire screen
 *		_ppeRadialBlur			- range 0 - 1 | ammount of blur (needs _ppeFocus to actually work)
 *		_ppeFocus				- range 0 - 1 | how focused the player will be (where 0 is not focused and 1 is full focus) (needs _ppeRadialBlur to actually work)
 *		_ppeFilmGrain			- range 0 - 1 | how strong the film grain effect will be (confusion)
 *		_ppeChromAberration		- range 0 - 1 | how strong the chromAberration will be (see things twice>)
 *		_ppeGreyScreen			- range 0 - 1 | 0 means normal 1 means totally grey
 *	
 *		_cfnDisableFatigue		- range 0 - n | >0 will disable fatigue
 *		_cfnForceWalk			- range 0 - n | >0 will force walk
 *	
 *	@Param1 - OBJECT - Unit
 *	@Param2 - SCALAR - HandleID
 *	@Return - NA
 */
if(!X39_MS2_var_Feature_EnableBlood) exitWith {};
private["_unit", "_handleID"];
_unit = _this select 0;
//_handleID = _this select 1;
if(X39_MS2_var_Bleeding_BleedingCurePerTick > 0) then
{
	[_unit, -X39_MS2_var_Bleeding_BleedingCurePerTick] call X39_MS2_fnc_addBleedingToBody;
	[_unit, -X39_MS2_var_Bleeding_BleedingCurePerTick] call X39_MS2_fnc_addBleedingToGeneric;
	[_unit, -X39_MS2_var_Bleeding_BleedingCurePerTick] call X39_MS2_fnc_addBleedingToHands;
	[_unit, -X39_MS2_var_Bleeding_BleedingCurePerTick] call X39_MS2_fnc_addBleedingToHead;
	[_unit, -X39_MS2_var_Bleeding_BleedingCurePerTick] call X39_MS2_fnc_addBleedingToLegs;
};

[_unit, -(([_unit] call X39_MS2_fnc_getBleedingOfBody) + ([_unit] call X39_MS2_fnc_getBleedingOfGeneric) + ([_unit] call X39_MS2_fnc_getBleedingOfHands) + ([_unit] call X39_MS2_fnc_getBleedingOfHead) + ([_unit] call X39_MS2_fnc_getBleedingOfLegs))] call X39_MS2_fnc_addBlood;
//TODO: implement bloodloss
//TODO: implement knockOut condition