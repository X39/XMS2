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
 *		_blackOutStage			- get variable! Contains blackOutStage at the begining of the tickCircle
 *	
 *	@Param1 - OBJECT - Unit
 *	@Param2 - SCALAR - HandleID
 *	@Return - NA
 */
private["_unit"];
_unit = _this select 0;
if(X39_MS2_var_Feature_EnableAdrenaline) then {
	private["_adrenalineChange", "_adrenalineCurrent"];
	_adrenalineChange = 0;
	_adrenalineCurrent = [_unit] call X39_MS2_fnc_getAdrenaline;

	//Simulate Adrenaline
	if(_adrenalineCurrent > 0) then
	{
		_adrenalineChange = -X39_MS2_var_Drugs_Adrenaline_reductionPerTick;
	};

	_ppeRadialBlur = _ppeRadialBlur+ (_adrenalineCurrent + _adrenalineChange) / X39_MS2_var_Drugs_Adrenaline_maxAdrenaline;
	_ppeFocus = _ppeFocus + ((_adrenalineCurrent + _adrenalineChange) / X39_MS2_var_Drugs_Adrenaline_maxAdrenaline) * 2;

	if(_adrenalineChange > 0 && {_adrenalineCurrent + _adrenalineChange > X39_MS2_var_Drugs_Adrenaline_maxAdrenaline * X39_MS2_var_Drugs_Adrenaline_naturalAdrenalineP}) then
	{
		_adrenalineChange = 0;
	};
	if(_adrenalineChange != 0) then
	{
		[_unit, _adrenalineChange] call X39_MS2_fnc_addAdrenaline;
	};
};
if(X39_MS2_var_Feature_EnableMorphine) then {
	_morphineCalculationBase = ([_unit] call X39_MS2_fnc_getMorphine) / X39_MS2_var_Drugs_Morphine_maxMorphine;
	_changeMorphine = -X39_MS2_var_Drugs_Morphine_reductionPerTick;
	if(_morphineCalculationBase >= X39_MS2_var_Drugs_Morphine_morphineBlackOutPointP && {X39_MS2_var_Drugs_Morphine_morphineOverdoseCanKnockOut || X39_MS2_var_Drugs_Morphine_morphineOverdoseCanKill}) then
	{
		if(_morphineCalculationBase >= X39_MS2_var_Drugs_Morphine_morphineKillPointP && {X39_MS2_var_Drugs_Morphine_morphineOverdoseCanKill}) then
		{
			if(X39_MS2_var_Drugs_Morphine_morphineFakeKills) then
			{
				[_unit, 4, X39_MS2_var_Drugs_Morphine_morphineKillLifeTime, localize "STR_X39_MS2_Scripting_XMSTicks_MorphineSimulation_DeathThroughMorphineOverdose"] call X39_MS2_fnc_blackOutUnit;
			}
			else
			{
				[_unit, true, false] call X39_MS2_fnc_killUnit;
			};
		}
		else
		{
			if(X39_MS2_var_Drugs_Morphine_morphineOverdoseCanKnockOut) then
			{
				[_unit, 2, X39_MS2_var_Drugs_Morphine_morphineKillLifeTime, localize "STR_X39_MS2_Scripting_XMSTicks_MorphineSimulation_KnockOutThroughMorphineOverdose", "Drugs_Morphine_Overdose", {(([_this select 0] call X39_MS2_fnc_getMorphine) / X39_MS2_var_Drugs_Morphine_maxMorphine) >= X39_MS2_var_Drugs_Morphine_morphineBlackOutPointP}] call X39_MS2_fnc_blackOutUnit;
			};
		};
	};
	if(X39_MS2_var_Drugs_Morphine_morphineEffects) then
	{
		if(X39_MS2_var_Drugs_Morphine_morphineForceWalkPointP != -1) then
		{
			if(_morphineCalculationBase >= X39_MS2_var_Drugs_Morphine_morphineForceWalkPointP) then
			{
				_cfnForceWalk = _cfnForceWalk + 1;
			};
		};
		if(X39_MS2_var_Drugs_Morphine_morphineRandomDowningPointP != -1) then
		{
			if(_morphineCalculationBase >= X39_MS2_var_Drugs_Morphine_morphineRandomDowningPointP) then
			{
				if(floor random 100 < X39_MS2_var_Drugs_Morphine_morphineRandomDowningBaseValueP * 100) then
				{
					_unit playMove "down";
				};
			};
		};
		if(X39_MS2_var_Drugs_Morphine_morphineDisortionStartPointP != -1) then
		{
			if(_morphineCalculationBase >= X39_MS2_var_Drugs_Morphine_morphineForceWalkPointP) then
			{
				_ppeWetDisort_LeftStrength = _ppeWetDisort_LeftStrength + ((X39_MS2_var_Drugs_Morphine_morphineForceWalkPointP - _morphineCalculationBase) / (1 - X39_MS2_var_Drugs_Morphine_morphineForceWalkPointP));
			};
		};
	};
	if(_changeMorphine != 0) then
	{
		[_unit, _changeMorphine] call X39_MS2_fnc_addMorphine;
	};
};
if(X39_MS2_var_Feature_EnableNaloxone) then {
	if(_blackOutStage >= 1 && _blackOutStage < 3) then
	{
		_currentNaloxone = [_unit] call X39_MS2_fnc_getNaloxone;
		if((_currentNaloxone / X39_MS2_var_Drugs_Naloxone_maxNaloxone) >= X39_MS2_var_Drugs_Naloxone_wakeBlackedPersonValueP) then
		{
			[_unit, 0, -1, ""] call X39_MS2_fnc_blackOutUnit;
		};
	};
	[_unit, -X39_MS2_var_Drugs_Naloxone_ReductionPerTick] call X39_MS2_fnc_addNaloxone;
};