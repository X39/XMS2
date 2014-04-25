private["_i", "_selectedEntry", "_name", "_value"];
if(!isServer) exitWith { diag_log "you no server dude!"; };

_config = (configFile >> "CfgSettings" >> "X39" >> "XMS2" >> "ServerConfig");
for "_i" from 0 to ((count _config) - 1) do
{
	_selectedEntry = _config select _i;
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
					_value = _value call X39_MedSys_fnc_IntToBoolean;
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