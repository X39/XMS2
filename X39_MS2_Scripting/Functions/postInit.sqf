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
	_scriptHandle = [] spawn { //ArmA bug workaround ... suddenly ArmA somehow does not enjoys addPublicVariableEventHandler to be callen directly in postInit of modifications ...
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
			_arr pushBack (configName _currentConfig);
			_arr pushBack (getArray(_currentConfig >> "authors"));
			_arr pushBack (getText(_currentConfig >> "version"));
			_files = (getArray(_currentConfig >> "files"));
			_arr2 = [];
			for "_filesIndex" from 0 to ((count _files) - 1) do
			{
				_arr2 pushBack preprocessFileLineNumbers (_files select _filesIndex);
			};
			_arr pushBack _arr2;
			_arr pushBack (getArray(_currentConfig >> "requiredExtensions"));
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
	waitUntil {X39_MS2_var_Internal_Extensions_InitializationDone};
	_extensionEnabled = [];
	_extensionsToCheck = [];
	_extensionVariable = (if(isServer) then { "X39_MS2_var_Internal_Extensions_AvailableExtensionsServer" } else { "X39_MS2_var_Internal_Extensions_AvailableExtensionsClient" });
	_extensionsAvailable = [];
	_extensionsInitialCount = count (missionNamespace getVariable _extensionVariable);
	for "_extensionIndex" from 0 to ((count (missionNamespace getVariable _extensionVariable)) - 1 ) do
	{
		_extensionsAvailable pushBack ((missionNamespace getVariable _extensionVariable) select _extensionIndex select 0);
	};
	{
		//Lazy Extension Loop
		//ToDo: Improve the loop so that it not uses a lazy way to check required extensions are already enabled
		//		 so that extension load order is getting changed instead of extensions with missing requirements just get pushed back
		scopeName "countScope";
		if(count (missionNamespace getVariable _extensionVariable) > _extensionsInitialCount * 5) then
		{
			PRINT_ERROR("Could not initialize all extensions, some of them seem to have incorrect requirements (ext1 requires ext2 which requires ext1 for example)");
			PRINT_INFO("Exiting extension init because 'extensionCount > extensionCoundInitial * 5'");
			breakOut "countScope";
		};
		_files = _x select 3;
		_flag = false;
		_requiredExtensions = _x select 4;
		if(count _requiredExtensions == 0) then
		{
			_flag = true;
		}
		else
		{
			_notFound = false;
			_missingExtension = "";
			//Validate required extensions ARE existing
			for "_requiredExtensionIndex" from 0 to ((count _requiredExtensions) - 1) do
			{
				scopeName "out";
				if(!((_requiredExtensions select _requiredExtensionIndex) in _extensionsAvailable)) then
				{
					_notFound = true;
					_missingExtension = (_requiredExtensions select _requiredExtensionIndex);
					breakOut "out";
				};
			};
			if(!_notFound) then
			{
				//Validated Extensions are existing
				//Check if required extensions are already processed, if not push extension back again in the list
				_notFound = false;
				for "_requiredExtensionIndex" from 0 to ((count _requiredExtensions) - 1) do
				{
					scopeName "out";
					if(!((_requiredExtensions select _requiredExtensionIndex) in _extensionEnabled)) then
					{
						_notFound = true;
						breakOut "out";
					};
				};
				if(_notFound) then
				{
					(missionNamespace getVariable _extensionVariable) pushBack _x;
				}
				else
				{
					_flag = true;
				};
			}
			else
			{
				PRINT_ERROR(format["Extension '%1' has a missing requirement: '%2', cannot continue with this extension" COMMA _x select 0 COMMA _missingExtension]);
			};
		};
		if(_flag) then
		{
			_failFlag = false;
			for "_fileIndex" from 0 to ((count _files) - 1) do
			{
				scopeName "out";
				private "_return";
				_return = [] call compile (_files select _fileIndex);
				if(isNil "_return" || {!ISBOOL(_return) || {!_return}}) then
				{
					if(isNil "_return") then {_return = "NIL"};
					PRINT_ERROR(format["Failed to initialize XMS2 extension '%1', file '%2' exited with result '%3' instead of 'true'" COMMA _x select 0 COMMA _fileIndex COMMA _return]);
					_failFlag = true;
					breakOut "out";
				}
				else
				{
					PRINT_INFO(format["File '%2' of ExtensionPackage '%1' was loaded" COMMA _x select 0 COMMA _fileIndex]);
				};
			};
			if(_failFlag) then
			{
				PRINT_INFO(format["ExtensionPackage '%1' failed to load" COMMA _x select 0]);
			}
			else
			{
				PRINT_INFO(format["ExtensionPackage '%1' was fully loaded" COMMA _x select 0]);
			};
			_extensionEnabled pushBack (_x select 0);
		};
		false
	}count (missionNamespace getVariable _extensionVariable);
	
	PRINT_INFO("###################################");
	PRINT_INFO("# FOLLOWING EXTENSIONS ARE LOADED #");
	PRINT_INFO("###################################");
	
	{
		PRINT_INFO(format["- %1" COMMA _x]);
		false
	}count _extensionsAvailable;
	PRINT_INFO("##############################");
	PRINT_INFO("# Loading Extensions is done #");
	PRINT_INFO("##############################");
	//Add the Close action to the native context menu of XMS2
	["NA", "STR_X39_MS2_Scripting_MedicalUiActions_Close", "", {true}, {}, "NA", 0] call X39_MS2_fnc_registerAction;
	//nilify extension variables (we dont need them any more)
	X39_MS2_var_Internal_Extensions_AvailableExtensionsServer = nil;
	X39_MS2_var_Internal_Extensions_AvailableExtensionsClient = nil;
	X39_MS2_var_Initialized = true;
};