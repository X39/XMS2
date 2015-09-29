#include "\X39_MS2_Scripting\default.hpp"
/**
 *	Loads the clientconfig
 *
 *	@Return - N/A
 *	@Author - X39
 */
private["_i", "_selectedEntry", "_name", "_value"];
if(isDedicated) exitWith { diag_log "you a dedicated server dude! You dont need a client config ..."; };
_searchClass = {
	private["_classIndex", "_entry"];
	for "_classIndex" from 0 to ((count (_this select 0)) - 1) do
	{
		_entry = (_this select 0) select _classIndex;
		if(isClass _entry) then
		{
			[_entry, format["%1_%2", _this select 1, configName _entry]] call _searchClass;
		}
		else
		{
			_name = format["%1_%2", _this select 1, configName _entry];
			_value = nil;
			if(!isNil _name) then
			{
				diag_log format["clientConfig error found! Variable '%1' is already defined!", _name];
			}
			else
			{
				if(isNumber _entry) then
				{
					_value = getNumber _entry;
					if(typeName (missionNamespace getVariable [_name, nil]) == "BOOL") then
					{
						_value = _value call X39_XLib_fnc_IntToBool;
					};
				}
				else
				{
					if(isText _entry) then
					{
						_value = getText _entry;
						if(_value == "false") then
						{
							_value = false;
						}
						else
						{
							if(_value == "true") then
							{
								_value = true;
							};
						};
					}
					else
					{
						if(isArray _entry) then
						{
							_value = getArray _entry;
						};
					};
				};
				missionNamespace setVariable [_name, _value];
			};
		};
	};
};
[(configFile >> "CfgSettings" >> "X39" >> "XMS2" >> "ClientConfig" >> "options"), "X39_MS2_options"] call _searchClass;