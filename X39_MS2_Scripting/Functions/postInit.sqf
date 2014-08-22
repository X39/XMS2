#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Sets the requirements automatically at mission start (postInit)
 *	(calling this function manually could lead into unexpected behaviour but should work)
 *
 *	@Return - NA
 */
if(isServer) then
{
	private["_id"];
	[] call X39_MS2_fnc_applyServerConfig;
	DEBUG_LOG_SC("Registering serverSide serverMessageSystem variable handler")
	_scriptHandle = [] spawn {
		"X39_MS2_var_Internal_Communication_ServerMessage" addPublicVariableEventHandler {
			_this call X39_MS2_fnc_serverMessageSystem;
		};
		X39_MS2_var_Internal_Communication_ServerReady = true;
		DEBUG_LOG_SC(format["Setting server ready at %1" COMMA time])
		publicVariable "X39_MS2_var_Internal_Communication_ServerReady";
	};
};
