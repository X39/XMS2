#include "\X39_MS2_Scripting\default.hpp"
/**
 *	Loads the serverconfig
 *
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_i", "_selectedEntry", "_name", "_value"];
if(!isServer) exitWith { diag_log "you no server dude!"; };

_config = (configFile >> "CfgSettings" >> "X39" >> "XMS2" >> "ServerConfig");
for "_serverConfigOption" from 0 to ((count _config) - 1) do
{
	_currentConfig = _config select _serverConfigOption;
	if(toUpper (configName _currentConfig) == toUpper ("Variables")) then
	{
		for "_i" from 0 to ((count _currentConfig) - 1) do
		{
			_selectedEntry = _currentConfig select _i;
			_name = configName _selectedEntry;
			_value = nil;
			if(!isClass _selectedEntry) then
			{
				if(isNil _name) then
				{
					diag_log format["serverconfig error found! Variable '%1' is not defined!", _name];
				}
				else
				{
					if(isNumber _selectedEntry) then
					{
						_value = getNumber _selectedEntry;
						if(typeName (missionNamespace getVariable [_name, nil]) == "BOOL") then
						{
							_value = _value call X39_XLib_fnc_IntToBool;
						};
					}
					else
					{
						if(isText _selectedEntry) then
						{
							_value = getText _selectedEntry;
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
							if(isArray _selectedEntry) then
							{
								_value = getArray _selectedEntry;
							};
						};
					};
					missionNamespace setVariable [_name, _value];
					publicVariable _name;
				};
			};
		};
	}
	else
	{
	
		if(toUpper (configName _currentConfig) == toUpper ("TriageCard")) then
		{
			for "_i" from 0 to ((count _currentConfig) - 1) do
			{
				_currentConfig2 = _currentConfig select _i;
				if(toUpper (configName _currentConfig2) == toUpper ("States")) then
				{
					DEBUG_LOG_WFn(format["Located States entry in config, Handling ..."]);
					for "_j" from 0 to ((count _currentConfig2) - 1) do
					{
						_selectedEntry = _currentConfig2 select _j;
						DEBUG_LOG_WFn(format["Handle %1" COMMA _selectedEntry]);
						if(getNumber (_selectedEntry >> "scope") == 2) then
						{
							_name = getText (_selectedEntry >> "name");
							_description = getText (_selectedEntry >> "description");
							_color = getArray (_selectedEntry >> "color");
							{
								if(ISCHARP(_x)) then
								{
									_color set [_forEachIndex, [] call compile _x];
								};
								false
							}forEach _color;
							_textColor = getArray (_selectedEntry >> "textColor");
							{
								if(ISCHARP(_x)) then
								{
									_textColor set [_forEachIndex, [] call compile _x];
								};
								false
							}forEach _textColor;
							_rating = getNumber (_selectedEntry >> "rating");
							X39_MS2_var_Internal_Dialog_TriageCard_States set[count X39_MS2_var_Internal_Dialog_TriageCard_States, [_name, _description, _color, _rating, _textColor]];
						};
					};
					DEBUG_LOG_WFn(format["Handled States entry"]);
				};
				if(toUpper (configName _currentConfig2) == toUpper ("PreDefinedMessages")) then
				{
					DEBUG_LOG_WFn(format["Located PreDefinedMessages entry in config, Handling ..."]);
					for "_j" from 0 to ((count _currentConfig2) - 1) do
					{
						_selectedEntry = _currentConfig2 select _j;
						DEBUG_LOG_WFn(format["Handle %1" COMMA _selectedEntry]);
						if(getNumber (_selectedEntry >> "scope") == 2) then
						{
							_name = getText (_selectedEntry >> "name");
							_text = getText (_selectedEntry >> "text");
							_color = getArray (_selectedEntry >> "color");
							{
								if(ISCHARP(_x)) then
								{
									_color set [_forEachIndex, [] call compile _x];
								};
								false
							}forEach _color;
							X39_MS2_var_Internal_Dialog_TriageCard_PreDefinedMessages set[count X39_MS2_var_Internal_Dialog_TriageCard_PreDefinedMessages, [_name, _text, _color]];
						};
					};
					DEBUG_LOG_WFn(format["Handled PreDefinedMessages entry"]);
				};
			};
		};
	};
};
publicVariable "X39_MS2_var_Internal_Dialog_TriageCard_States";
publicVariable "X39_MS2_var_Internal_Dialog_TriageCard_PreDefinedMessages";