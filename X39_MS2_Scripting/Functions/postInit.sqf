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
	DEBUG_LOG_SC("Registering serverSide serverMessageSystem variable handler")
	_scriptHandle = [] spawn {
		"X39_MS2_var_Internal_Communication_ServerMessage" addPublicVariableEventHandler {
			_this call X39_MS2_fnc_serverMessageSystem;
		};
		X39_MS2_var_Internal_Communication_ServerReady = true;
		DEBUG_LOG_SC(format["Setting server ready at %1" COMMA time])
		publicVariable "X39_MS2_var_Internal_Communication_ServerReady";
	};
	_config = (configFile >> "CfgSettings" >> "X39" >> "XMS2" >> "Extensions");
	for "_serverConfigOption" from 0 to ((count _config) - 1) do
	{
		_currentConfig = _config select _serverConfigOption;
		_arr = [];
		_arr pushBack (getText(_currentConfig >> "name"));
		_arr pushBack (getArray(_currentConfig >> "author"));
		_arr pushBack (getText(_currentConfig >> "version"));
		_arr pushBack (getText(_currentConfig >> "code"));
		if(getNumber(_currentConfig >> "serverOnly") == 0) then{
			X39_MS2_var_Internal_Extensions_AvailableExtensionsClient pushBack _arr;
		};
		X39_MS2_var_Internal_Extensions_AvailableExtensionsServer pushBack _arr;
	};
	publicVariable "X39_MS2_var_Internal_Extensions_AvailableExtensionsClient";
	X39_MS2_var_Internal_Extensions_InitializationDone = true;
	publicVariable "X39_MS2_var_Internal_Extensions_InitializationDone";
};
[] spawn {
	if(isServer) then
	{
		{
			_return = [] call compile (_x select 3);
			if(!ISBOOL(_return) || {!_return}) then
			{
				PRINT_ERROR(format["Failed to initialize XMS2 extension '%1', exited with result '%2' instead of 'true'" COMMA _x select 0 COMMA _return]);
			};
			false
		}count X39_MS2_var_Internal_Extensions_AvailableExtensionsServer;
	}
	else
	{
		waitUntil{X39_MS2_var_Internal_Extensions_InitializationDone};
		{
			_return = [] call compile (_x select 3);
			if(!ISBOOL(_return) || {!_return}) then
			{
				PRINT_ERROR(format["Failed to initialize XMS2 extension '%1', exited with result '%2' instead of 'true'" COMMA _x select 0 COMMA _return]);
			};
			false
		}count X39_MS2_var_Internal_Extensions_AvailableExtensionsClient;
	};
	[] call X39_MS2_fnc_IMH_registerMedicalActions;
	[] call X39_MS2_fnc_IMH_addMedicalMessages;
	[] call X39_MS2_fnc_IMH_addInteractionMenuEntries;
	[] call X39_MS2_fnc_IMH_registerDrugs;
	[] call X39_MS2_fnc_IMH_registerMedicalUiStatusEffects;
	[] call X39_MS2_fnc_IMH_registerHallucinations;
};