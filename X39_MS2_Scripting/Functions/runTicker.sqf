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
	private["_ticks", "_startTime", "_sleep", "_handleListFsm", "_handleListSpawn"];
	DEBUG_CODE(private["_randomID"];_randomID = random 20000);
	params [["_unit", objNull, [objNull]]];
	_unit setVariable ["X39_MS2_var_Internal_Ticker_cfnDisableFatigueLast", str (0 > 0)];
	_unit setVariable ["X39_MS2_var_Internal_Ticker_cfnForceWalkLast", str (0 > 0)];
	_ticks = 0;
	_isLocalPlayer = (_unit == player);
	if(isNull _unit) exitWith {["XMS2 had a FATAL ERROR when the XMSTicker got started! isNull _unit => true. Please respawn/reconnect/restart. If this error persists, please contact the mod Author."] call BIS_fnc_HALT;};
	while { alive _unit } do
	{
		_startTime = diag_tickTime;
		_unit setVariable ["X39_MS2_var_Internal_Ticker_ppeDynamicBlur", 0];
		_unit setVariable ["X39_MS2_var_Internal_Ticker_ppeRadialBlur", 0];
		_unit setVariable ["X39_MS2_var_Internal_Ticker_ppeFocus", 0];
		_unit setVariable ["X39_MS2_var_Internal_Ticker_ppeChromAberration", 0];
		_unit setVariable ["X39_MS2_var_Internal_Ticker_ppeGreyScreen", 0];
		_unit setVariable ["X39_MS2_var_Internal_Ticker_ppeColorInversion", 0];
		_unit setVariable ["X39_MS2_var_Internal_Ticker_ppeFilmGrain", 0];
		_unit setVariable ["X39_MS2_var_Internal_Ticker_ppeWetDisort_LeftStrength", 0];
		_unit setVariable ["X39_MS2_var_Internal_Ticker_ppeWetDisort_RightStrength", 0];
		_unit setVariable ["X39_MS2_var_Internal_Ticker_ppeFilmGrain", 0];
		_unit setVariable ["X39_MS2_var_Internal_Ticker_cfnDisableFatigue", 0];
		_unit setVariable ["X39_MS2_var_Internal_Ticker_cfnForceWalk", 0];
		_unit setVariable ["X39_MS2_var_Internal_Ticker_redScreenAlpha", 0]; //special, FOR PAIN ONLY variable to create the redscreen
		_unit setVariable ["X39_MS2_var_Internal_Ticker_blackOutStage", [_unit] call X39_MS2_fnc_getBlackOutStage];

		//TickHandling
		_handleListFsm = [];
		_handleListSpawn = [];
		{
			if(_ticks % (_x select 1) == 0) then
			{
				if(!alive _unit) exitWith { PRINT_INFO(format["'%1' died while XMSTick handling was in progress" COMMA _unit]); };
				switch(_x select 2) do
				{
					case 1: {
						_handleListFsm pushBack [[_unit, _forEachIndex], _x select 0] execFSM "\X39_MS2_Scripting\callCode.fsm";
					};
					case 2: {
						private "_handle";
						_handle = [[_unit, _forEachIndex], _x select 0] execFSM "\X39_MS2_Scripting\callCode.fsm";
						waitUntil {sleep 0.0001; completedFSM  _handle;};
					};
					case 4: {
						_handleListSpawn pushBack [_unit, _forEachIndex] spawn (_x select 0);
					};
					case 5: {
						private "_handle";
						_handle = [_unit, _forEachIndex] spawn (_x select 0);
						waitUntil {sleep 0.0001; scriptDone _handle;};
					};
					default {
						[_unit, _forEachIndex] call (_x select 0);
					};
				};
			};
			false
		} foreach X39_MS2_var_Internal_ticker_tickHandlers;
		DEBUG_CODE_SC({waitUntil {completedFSM  _x;};}count _handleListFsm)
		DEBUG_CODE_SC({waitUntil {scriptDone _x;};}count _handleListSpawn)

		_ticks = _ticks + 1;
		if(_ticks >= (_unit getVariable "X39_MS2_var_Internal_ticker_maxTicksTimeout")) then
		{
			_ticks = 0;
		};
		if(_isLocalPlayer) then
		{
			//Dynamic call handling
			_unit setVariable ["X39_MS2_var_Internal_Ticker_ppeGreyScreen", 1 - (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeGreyScreen")];
			if((_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFocus") < 0) then						{ _unit setVariable ["X39_MS2_var_Internal_Ticker_ppeFocus", 0]; } else						{	if((_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFocus") > 1)							then { _unit setVariable ["X39_MS2_var_Internal_Ticker_ppeFocus", 1]; };						};
			if((_unit getVariable "X39_MS2_var_Internal_Ticker_ppeWetDisort_LeftStrength") < 0) then	{ _unit setVariable ["X39_MS2_var_Internal_Ticker_ppeWetDisort_LeftStrength", 0]; } else	{	if((_unit getVariable "X39_MS2_var_Internal_Ticker_ppeWetDisort_LeftStrength") > 2)		then { _unit setVariable ["X39_MS2_var_Internal_Ticker_ppeWetDisort_LeftStrength", 2]; };	};
			if((_unit getVariable "X39_MS2_var_Internal_Ticker_ppeWetDisort_RightStrength") < 0) then	{ _unit setVariable ["X39_MS2_var_Internal_Ticker_ppeWetDisort_RightStrength", 0]; } else	{	if((_unit getVariable "X39_MS2_var_Internal_Ticker_ppeWetDisort_RightStrength") > 2)	then { _unit setVariable ["X39_MS2_var_Internal_Ticker_ppeWetDisort_RightStrength", 2]; };	};
			if((_unit getVariable "X39_MS2_var_Internal_Ticker_ppeColorInversion") < 0) then				{ _unit setVariable ["X39_MS2_var_Internal_Ticker_ppeColorInversion", 0]; } else				{	if((_unit getVariable "X39_MS2_var_Internal_Ticker_ppeColorInversion") > 1)				then { _unit setVariable ["X39_MS2_var_Internal_Ticker_ppeColorInversion", 1]; };			};
			if((_unit getVariable "X39_MS2_var_Internal_Ticker_ppeGreyScreen") < 0) then					{ _unit setVariable ["X39_MS2_var_Internal_Ticker_ppeGreyScreen", 0]; } else					{	if((_unit getVariable "X39_MS2_var_Internal_Ticker_ppeGreyScreen") > 1)					then { _unit setVariable ["X39_MS2_var_Internal_Ticker_ppeGreyScreen", 1]; };				};
			if((_unit getVariable "X39_MS2_var_Internal_Ticker_ppeChromAberration") < 0) then			{ _unit setVariable ["X39_MS2_var_Internal_Ticker_ppeChromAberration", 0]; } else			{	if((_unit getVariable "X39_MS2_var_Internal_Ticker_ppeChromAberration") > 1)				then { _unit setVariable ["X39_MS2_var_Internal_Ticker_ppeChromAberration", 1];};			};
			if((_unit getVariable "X39_MS2_var_Internal_Ticker_ppeDynamicBlur") < 0) then				{ _unit setVariable ["X39_MS2_var_Internal_Ticker_ppeDynamicBlur", 0] } else					{	if((_unit getVariable "X39_MS2_var_Internal_Ticker_ppeDynamicBlur") > 1)					then { _unit setVariable ["X39_MS2_var_Internal_Ticker_ppeDynamicBlur", 1]; };				};
			if((_unit getVariable "X39_MS2_var_Internal_Ticker_ppeRadialBlur") < 0) then					{ _unit setVariable ["X39_MS2_var_Internal_Ticker_ppeRadialBlur", 0] } else					{	if((_unit getVariable "X39_MS2_var_Internal_Ticker_ppeRadialBlur") > 1)					then { _unit setVariable ["X39_MS2_var_Internal_Ticker_ppeRadialBlur", 1]; };				};
			_unit call X39_MS2_fnc_applyPPEffects;
		};
		if(str ((_unit getVariable "X39_MS2_var_Internal_Ticker_cfnDisableFatigue") > 0) != (_unit getVariable "X39_MS2_var_Internal_Ticker_cfnDisableFatigueLast")) then
		{
			_unit setVariable ["X39_MS2_var_Internal_Ticker_cfnDisableFatigueLast", str ((_unit getVariable "X39_MS2_var_Internal_Ticker_cfnDisableFatigue") > 0)];
			if((_unit getVariable "X39_MS2_var_Internal_Ticker_cfnDisableFatigue") > 0) then
			{
				_unit enableFatigue false;
			}
			else
			{
				_unit enableFatigue true;
			};
		};
		if(str ((_unit getVariable "X39_MS2_var_Internal_Ticker_cfnForceWalk") > 0) != (_unit getVariable "X39_MS2_var_Internal_Ticker_cfnForceWalkLast")) then
		{
			_unit setVariable ["X39_MS2_var_Internal_Ticker_cfnForceWalkLast", str ((_unit getVariable "X39_MS2_var_Internal_Ticker_cfnForceWalk") > 0)];
			if((_unit getVariable "X39_MS2_var_Internal_Ticker_cfnForceWalk") > 0) then
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
		_sleep = X39_MS2_var_Internal_ticker_minTickRate - (diag_tickTime - _startTime);
		if(_sleep > 0) then
		{
			DEBUG_LOG(format["XMSTicker will sleep for %1s" COMMA _sleep]);
			sleep _sleep;
		}
		else
		{
			PRINT_WARNING(format["Ticker lost time! Time lost: %1" COMMA -_sleep]);
			DEBUG_CODE_SC(systemChat format["Ticker lost time! Time lost: %1" COMMA -_sleep])
		};
	};

}];
