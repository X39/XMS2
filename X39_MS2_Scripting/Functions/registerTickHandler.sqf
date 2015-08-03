#include "\X39_MS2_Scripting\default.hpp"
/**
 *	
 *	Register a new tickHandler which will be executed each XMSTick
 *	Effect is LOCAL
 *	
 *	@ParamsCount - 1
 *	@Param1 - CODE	- Handler
 *	@Param2 - SCALAR	- TickRate (1 = each tick)
 *	@Param3 - SCALAR	- Use mode:	1 --> via FSM script in synchron space (wont wait for completeness)
 *										2 --> via FSM script in synchron space (will wait for completeness)
 *										3 --> via a simple call in asynchron space
 *										4 --> via spawn (wont wait for completeness)
 *										5 --> via spawn (will wait for completeness)
 *	@Author - X39|Cpt. HM Murdock
 */
scopeName "function";
params [
	["_handler", "", [{}, "", text ""]],
	["_tickRate", 1, [1]],
	["_mode", "", 2, [1]]
];
if(typeName _handler == "STRING" || typeName _handler == "TEXT") then
{
	if(_handler == "") then
	{
		diag_log format["handler '%1' cannot be registered for new ticks!", _handler];
		breakOut "function";
	}
	else
	{
		_handler = missionNamespace getVariable _handler;
	};
};
if(_tickRate >= (_unit getVariable "X39_MS2_var_Internal_ticker_maxTicksTimeout")) exitWith { diag_log "wanted tickRate is to high!"; };
if(_tickRate <= 0) exitWith { diag_log "wanted tickRate needs to be larger then 0!"; };
X39_MS2_var_Internal_ticker_tickHandlers pushBack [_handler, _tickRate, _mode];