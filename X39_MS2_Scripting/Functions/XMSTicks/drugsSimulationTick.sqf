#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	XMSTick Handler
 *	Description will not be available as this is not intended to be callen by anyone but the XMSTicker
 *	Available parent variables:
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeDynamicBlur")			- range 0 - 1 | ammount of blur over entire screen
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeRadialBlur")			- range 0 - 1 | ammount of blur (needs (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFocus") to actually work)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFocus")				- range 0 - 1 | how focused the player will be (where 0 is not focused and 1 is full focus) (needs (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeRadialBlur") to actually work)
 *		X39_MS2_var_Internal_Ticker(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFilmGrain")			- range 0 - 1 | how strong the film grain effect will be (confusion)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeChromAberration")		- range 0 - 1 | how strong the chromAberration will be (see things twice>)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeGreyScreen")			- range 0 - 1 | 0 means normal 1 means totally grey
 *	
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_cfnDisableFatigue")		- range 0 - n | >0 will disable fatigue
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_cfnForceWalk")			- range 0 - n | >0 will force walk
 *
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_blackOutStage")			- get variable! Contains blackOutStage at the begining of the tickCircle
 *	
 *	@Param1 - OBJECT - Unit
 *	@Param2 - SCALAR - HandleID
 *	@Return - NA
 */
MT_START
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

	_unit setVariable["X39_MS2_var_Internal_Ticker_ppeRadialBlur", (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeRadialBlur") + (_adrenalineCurrent + _adrenalineChange) / X39_MS2_var_Drugs_Adrenaline_maxAdrenaline];
	_unit setVariable["X39_MS2_var_Internal_Ticker_ppeFocus", (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFocus") + ((_adrenalineCurrent + _adrenalineChange) / X39_MS2_var_Drugs_Adrenaline_maxAdrenaline) * 2];

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
	if(_morphineCalculationBase >= X39_MS2_var_Drugs_Morphine_BlackOutPointP && {X39_MS2_var_Drugs_Morphine_OverdoseCanKnockOut || X39_MS2_var_Drugs_Morphine_OverdoseCanKill}) then
	{
		if(_morphineCalculationBase >= X39_MS2_var_Drugs_Morphine_KillPointP && {X39_MS2_var_Drugs_Morphine_OverdoseCanKill}) then
		{
			if(X39_MS2_var_Drugs_Morphine_FakeKills) then
			{
				[_unit, 4, X39_MS2_var_Drugs_Morphine_KillLifeTime, localize "STR_X39_MS2_Scripting_XMSTicks_MorphineSimulation_DeathThroughMorphineOverdose"] call X39_MS2_fnc_blackOutUnit;
			}
			else
			{
				[_unit, true, false] call X39_MS2_fnc_killUnit;
			};
		}
		else
		{
			if(X39_MS2_var_Drugs_Morphine_OverdoseCanKnockOut) then
			{
				[_unit, 2, X39_MS2_var_Drugs_Morphine_KillLifeTime, localize "STR_X39_MS2_Scripting_XMSTicks_MorphineSimulation_KnockOutThroughMorphineOverdose", "Drugs_Morphine_Overdose", {(([_this select 0] call X39_MS2_fnc_getMorphine) / X39_MS2_var_Drugs_Morphine_maxMorphine) >= X39_MS2_var_Drugs_Morphine_BlackOutPointP}] call X39_MS2_fnc_blackOutUnit;
			};
		};
	};
	if(X39_MS2_var_Drugs_Morphine_Effects) then
	{
		if(X39_MS2_var_Drugs_Morphine_ForceWalkPointP != -1) then
		{
			if(_morphineCalculationBase >= X39_MS2_var_Drugs_Morphine_ForceWalkPointP) then
			{
				_unit setVariable["X39_MS2_var_Internal_Ticker_cfnForceWalk", (_unit getVariable "X39_MS2_var_Internal_Ticker_cfnForceWalk") + 1];
			};
		};
		if(X39_MS2_var_Drugs_Morphine_RandomDowningPointP != -1) then
		{
			if(_morphineCalculationBase >= X39_MS2_var_Drugs_Morphine_RandomDowningPointP) then
			{
				if(stance _unit != "PRONE") then
				{
					if((random 1 < X39_MS2_var_Drugs_Morphine_RandomDowningBaseValueP) && (random 1 < X39_MS2_var_Drugs_Morphine_RandomDowningBaseValueP)) then
					{
						_unit playMove "down";
					};
				};
			};
		};
		if(X39_MS2_var_Drugs_Morphine_DisortionStartPointP != -1) then
		{
			if(_morphineCalculationBase >= X39_MS2_var_Drugs_Morphine_DisortionStartPointP) then
			{
				_unit setVariable["X39_MS2_var_Internal_Ticker_ppeWetDisort_LeftStrength", (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeWetDisort_LeftStrength") + (_morphineCalculationBase - X39_MS2_var_Drugs_Morphine_DisortionStartPointP) / (1 - X39_MS2_var_Drugs_Morphine_DisortionStartPointP)];
				_unit setVariable["X39_MS2_var_Internal_Ticker_ppeWetDisort_RightStrength", (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeWetDisort_RightStrength") + (_morphineCalculationBase - X39_MS2_var_Drugs_Morphine_DisortionStartPointP) / (1 - X39_MS2_var_Drugs_Morphine_DisortionStartPointP)];
			};
		};
	};
	if(_changeMorphine != 0) then
	{
		[_unit, _changeMorphine] call X39_MS2_fnc_addMorphine;
	};
};
if(X39_MS2_var_Feature_EnableNaloxone) then {
	if(X39_MS2_var_Drugs_Naloxone_allowWakeUnconscious) then
	{
		if((_unit getVariable "X39_MS2_var_Internal_Ticker_blackOutStage") >= 1 && (_unit getVariable "X39_MS2_var_Internal_Ticker_blackOutStage") < 3) then
		{
			_currentNaloxone = [_unit] call X39_MS2_fnc_getNaloxone;
			if((_currentNaloxone / X39_MS2_var_Drugs_Naloxone_maxNaloxone) >= X39_MS2_var_Drugs_Naloxone_wakeBlackedPersonValueP) then
			{
				[_unit, 0, -1, ""] call X39_MS2_fnc_blackOutUnit;
			};
		};
	};
	[_unit, -X39_MS2_var_Drugs_Naloxone_ReductionPerTick] call X39_MS2_fnc_addNaloxone;
};
if(X39_MS2_var_Feature_EnableAspirin) then {
	[_unit, -X39_MS2_var_Drugs_Aspirin_ReductionPerTick] call X39_MS2_fnc_addAspirin;
};
MT_END
MT_DEBUG(_times pushBack [_fnc_scriptName COMMA MT_TIME])