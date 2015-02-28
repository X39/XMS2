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
		if(configName _currentConfig != "extensionBase") then
		{
			_arr = [];
			_arr pushBack (getText(_currentConfig >> "name"));
			_arr pushBack (getArray(_currentConfig >> "authors"));
			_arr pushBack (getText(_currentConfig >> "version"));
			_files = (getArray(_currentConfig >> "files"));
			_arr2 = [];
			for "_filesIndex" from 0 to ((count _files) - 1) do
			{
				_arr2 pushBack preprocessFileLineNumbers (_files select _filesIndex);
			};
			_arr pushBack _arr2;
			if(getNumber(_currentConfig >> "serverOnly") == 0) then
			{
				X39_MS2_var_Internal_Extensions_AvailableExtensionsClient pushBack _arr;
			};
			X39_MS2_var_Internal_Extensions_AvailableExtensionsServer pushBack _arr;
		};
	};
	publicVariable "X39_MS2_var_Internal_Extensions_AvailableExtensionsClient";
	X39_MS2_var_Internal_Extensions_InitializationDone = true;
	publicVariable "X39_MS2_var_Internal_Extensions_InitializationDone";
};
[] spawn {
	if(isServer) then
	{
		{
			_extensions = _x select 3;
			for "_extIndex" from 0 to ((count _extensions) - 1) do
			{
				scopeName "out";
				_return = [] call compile (_extensions select _extIndex);
				if(isNil "_return" || {!ISBOOL(_return) || {!_return}}) then
				{
					PRINT_ERROR(format["Failed to initialize XMS2 extension '%1', file '%2' exited with result '%3' instead of 'true'" COMMA _x select 0 COMMA _extIndex COMMA _return]);
					breakOut "out";
				}
				else
				{
					PRINT_INFO(format["File '%2' of ExtensionPackage '%1' was loaded" COMMA _x select 1 COMMA _extIndex]);
				};
			};
			false
		}count X39_MS2_var_Internal_Extensions_AvailableExtensionsServer;
	}
	else
	{
		waitUntil{X39_MS2_var_Internal_Extensions_InitializationDone};
		{
			_extensions = _x select 3;
			for "_extIndex" from 0 to ((count _extensions) - 1) do
			{
				scopeName "out";
				_return = [] call compile (_extensions select _extIndex);
				if(isNil "_return" || {!ISBOOL(_return) || {!_return}}) then
				{
					PRINT_ERROR(format["Failed to initialize XMS2 extension '%1', file '%2' exited with result '%3' instead of 'true'" COMMA _x select 0 COMMA _extIndex COMMA _return]);
					breakOut "out";
				}
				else
				{
					PRINT_INFO(format["File '%2' of ExtensionPackage '%1' was loaded" COMMA _x select 1 COMMA _extIndex]);
				};
			};
			false
		}count X39_MS2_var_Internal_Extensions_AvailableExtensionsClient;
	};
	//Add the Close action to the first native context menu of XMS2
	["NA", "STR_X39_MS2_Scripting_MedicalUiActions_Close", "", {true}, {}, "NA", 0] call X39_MS2_fnc_registerAction;
};