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
private["_unit", "_handleID", "_currentPain"];
_unit = _this select 0;
//_handleID = _this select 1;

_currentPain = [_unit] call X39_MS2_fnc_getPain;
_morphineCalculationBase = ([_unit] call X39_MS2_fnc_getMorphine) / X39_MS2_var_Pain_maxMorphine;
_maxPain = [] call X39_MS2_fnc_getMaxPain;
_changePain = -X39_MS2_var_Pain_painReductionPerTick;
_changeMorphine = -X39_MS2_var_Pain_morphineReductionPerTick;

_redScreenAlpha = _currentPain / _maxPain;
_ppeDynamicBlur = _redScreenAlpha;


if(_morphineCalculationBase >= X39_MS2_var_Pain_MorphineKillPointP && {X39_MS2_var_Pain_MorphineOverdoseCanKill}) then
{
	if(X39_MS2_var_Pain_MorphineFakeKills) then
	{
		[_unit, 4, X39_MS2_var_Pain_MorphineKillLifeTime, localize "STR_X39_MS2_Scripting_XMSTicks_PainTick_DeathThroughMorphineOverdose"] call X39_MS2_fnc_blackOutUnit;
	}
	else
	{
		[_unit, true, false] call X39_MS2_fnc_killUnit;
	};
};
if(X39_MS2_var_Pain_morphineEffects) then
{
	if(X39_MS2_var_Pain_morphineForceWalkPointP != -1) then
	{
		if(_morphineCalculationBase >= X39_MS2_var_Pain_morphineForceWalkPointP) then
		{
			_cfnForceWalk = _cfnForceWalk + 1;
		};
	};
	if(X39_MS2_var_Pain_morphineRandomDowningPointP != -1) then
	{
		if(_morphineCalculationBase >= X39_MS2_var_Pain_morphineRandomDowningPointP) then
		{
			if(floor random X39_MS2_var_Pain_morphineRandomDowningBaseValue == 0) then
			{
				_unit playMove "down";
			};
		};
	};
	if(X39_MS2_var_Pain_morphineDisortionStartPointP != -1) then
	{
		if(_morphineCalculationBase >= X39_MS2_var_Pain_morphineForceWalkPointP) then
		{
			_ppeWetDisort_LeftStrength = _ppeWetDisort_LeftStrength + ((X39_MS2_var_Pain_morphineForceWalkPointP - _morphineCalculationBase) / (1 - X39_MS2_var_Pain_morphineForceWalkPointP));
		};
	};
};

if(_changePain != 0) then
{
	[_unit, _changePain] call X39_MS2_fnc_addPain;
};
if(_changeMorphine != 0) then
{
	[_unit, _changeMorphine] call X39_MS2_fnc_addMorphine;
};