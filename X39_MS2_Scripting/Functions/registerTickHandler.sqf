#include "\X39_MS2_Scripting\default.hpp"
/**
 *	
 *	Register a new tickHandler which will be executed each XMSTick
 *	
 *	@ParamsCount - 1
 *	@Param1 - Code	- Handler
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_handler", "_tickRate", "_exit"];
_handler = [_this, 0, "", [{}, "", text ""]] call BIS_fnc_param;
_tickRate = [_this, 1, 1, [1]] call BIS_fnc_param;
_exit = false;
if(typeName _handler == "STRING" || typeName _handler == "TEXT") then
{
	if(_handler == "") then
	{
		diag_log format["handler '%1' cannot be registered for new ticks!", _handler];
		_exit = true;
	}
	else
	{
		_handler = missionNamespace getVariable _handler;
	};
};
if(_exit) exitWith {diag_log "No tickhandler has been registered";};
if(_tickRate >= X39_MS2_var_Internal_ticker_maxTicksTimeout) exitWith { diag_log "wanted tickRate is to high!"; };
if(_tickRate <= 0) exitWith { diag_log "wanted tickRate needs to be larger then 0!"; };
X39_MS2_var_Internal_ticker_tickHandlers set[count X39_MS2_var_Internal_ticker_tickHandlers, [_handler, _tickRate]];