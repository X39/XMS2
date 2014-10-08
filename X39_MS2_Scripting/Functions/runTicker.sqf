#include "\X39_MS2_Scripting\default.hpp"
/*
 *	creates the XMSTicker which handles all dynamic parts of XMS
 *	
 *	@Param1 - OBJECT - Unit to handle
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
if(!scriptDone (_this getVariable ["X39_MS2_var_UnitTickHandle", scriptNull])) exitWith {PRINT_ERROR("XMS2 TICKER IS ALREADY RUNNING!");};
_this setVariable ["X39_MS2_var_UnitTickHandle", _this spawn {
	private["_unit", "_ticks", "_startTime", "_blackOutStage", "_sleep", "_ppeDynamicBlur", "_ppeRadialBlur", "_ppeFocus", "_ppeFilmGrain", "_ppeChromAberration", "_ppeGreyScreen", "_ppeColorInversion", "_ppeWetDisort_LeftStrength", "_ppeWetDisort_RightStrength", "_cfnDisableFatigue", "_cfnDisableFatigueLast", "_cfnForceWalk", "_cfnForceWalkLast", "_redScreenAlpha"];
	DEBUG_CODE(private["_randomID"];_randomID = random 20000);
	_cfnDisableFatigueLast = str (0 > 0);
	_cfnForceWalkLast = str (0 > 0);
	_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_ticks = 0;
	_isLocalPlayer = (_unit == player);
	if(isNull _unit) exitWith {["XMS2 had a FATAL ERROR when the XMSTicker got started! isNull _unit => true. Please respawn/reconnect/restart. If this error persists, please contact the mod Author."] call BIS_fnc_HALT;};
	while { alive _unit } do
	{
		_startTime = time;
		_ppeDynamicBlur = 0;
		_ppeRadialBlur = 0;
		_ppeFocus = 0;
		_ppeChromAberration = 0;
		_ppeGreyScreen = 0;
		_ppeColorInversion = 0;
		_ppeFilmGrain = 0;
		_ppeWetDisort_LeftStrength = 0;
		_ppeWetDisort_RightStrength = 0;
		_ppeFilmGrain = 0;
		
		_cfnDisableFatigue = 0;
		_cfnForceWalk = 0;
		_redScreenAlpha = 0; //special, FOR PAIN ONLY variable to create the redscreen
		_blackOutStage = [_unit] call X39_MS2_fnc_getBlackOutStage;
		//TickHandling
		{
			if(_ticks % (_x select 1) == 0) then
			{
				if(!alive _unit) exitWith { PRINT_INFO(format["'%1' died while XMSTick handling was in progress" COMMA _unit]); };
				[_unit, _forEachIndex] call (_x select 0);
			};
			false
		} foreach X39_MS2_var_Internal_ticker_tickHandlers;
		_ticks = _ticks + 1;
		if(_ticks >= X39_MS2_var_Internal_ticker_maxTicksTimeout) then
		{
			_ticks = 0;
		};
		if(_isLocalPlayer) then
		{
			//Dynamic call handling
			_ppeGreyScreen = 1 - _ppeGreyScreen;
			if(_ppeFocus < 0) then { _ppeFocus = 0; } else { if(_ppeFocus > 1) then { _ppeFocus = 1; }; };
			if(_ppeWetDisort_LeftStrength < 0) then { _ppeWetDisort_LeftStrength = 0; } else { if(_ppeWetDisort_LeftStrength > 2) then { _ppeWetDisort_LeftStrength = 2; }; };
			if(_ppeWetDisort_RightStrength < 0) then { _ppeWetDisort_RightStrength = 0; } else { if(_ppeWetDisort_RightStrength > 2) then { _ppeWetDisort_RightStrength = 2; }; };
			if(_ppeColorInversion < 0) then { _ppeColorInversion = 0; } else { if(_ppeColorInversion > 1) then { _ppeColorInversion = 1; }; };
			if(_ppeGreyScreen < 0) then { _ppeGreyScreen = 0; } else { if(_ppeGreyScreen > 1) then { _ppeGreyScreen = 1; }; };
			if(_ppeChromAberration < 0) then { _ppeChromAberration = 0; } else { if(_ppeChromAberration > 1) then { _ppeChromAberration = 1; }; };
			if(_ppeDynamicBlur < 0) then { _ppeDynamicBlur = 0 } else { if(_ppeDynamicBlur > 1) then { _ppeDynamicBlur = 1; }; };
			if(_ppeRadialBlur < 0) then { _ppeRadialBlur = 0 } else { if(_ppeRadialBlur > 1) then { _ppeRadialBlur = 1; }; };
			[] call X39_MS2_fnc_applyPPEffects;
		};
		if(str (_cfnDisableFatigue > 0) != _cfnDisableFatigueLast) then
		{
			_cfnDisableFatigueLast = str (_cfnDisableFatigue > 0);
			if(_cfnDisableFatigue > 0) then
			{
				_unit enableFatigue false;
			}
			else
			{
				_unit enableFatigue true;
			};
		};
		if(str (_cfnForceWalk > 0) != _cfnForceWalkLast) then
		{
			_cfnForceWalkLast = str (_cfnForceWalk > 0);
			if(_cfnForceWalk > 0) then
			{
				_unit forceWalk true;
			}
			else
			{
				_unit forceWalk false;
			};
		};
		
		//Finalize tick
		DEBUG_CODE(diag_log format["XMSTicker %1: %2, %3" COMMA _randomID COMMA _unit COMMA alive _unit]);
		_sleep = X39_MS2_var_Internal_ticker_minTickRate - (time - _startTime);
		if(_sleep > 0) then
		{
			DEBUG_LOG(format["XMSTicker will sleep for %1s" COMMA _sleep]);
			sleep _sleep;
		}
		else
		{
			PRINT_WARNING(format["ticker might have skipped some XMSTicks! Time lost: %1" COMMA _sleep]);
		};
	};
	
}];