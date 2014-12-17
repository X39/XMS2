class X39_MS2_MedicLab: Land_Research_HQ_F
{
	scope = 2;
	faction = "X39_MS2_Faction";
	vehicleClass = "X39_MS2_Vehicle";
	displayName = "Medical HQ";
	class EventHandlers
	{
		init = "(_this select 0) addAction ['Heal all units in range', {{if([_x] call X39_MS2_fnc_isUnitXms2Unit) then {[_x] call X39_MS2_fnc_unInitUnit; [_x] call X39_MS2_fnc_initUnit;}}forEach nearestObjects[player, ['CAManBase'], 15];}];";
	};
};