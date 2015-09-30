#include "\X39_MS2_Scripting\default.hpp"
if(!X39_MS2_var_Pain_showDiagnosticsMessagesUnconscious) then
{
	["STR_X39_MS2_Scripting_MedicalMessages_Pain_Low",		[1, 1, 1, 1],		{_value = ([_this] call X39_MS2_fnc_getPain) / ([] call X39_MS2_fnc_getMaxPain); (!([_this] call X39_MS2_fnc_isBlackedOut) && (_value >= 0.1 && _value < 0.3))	}, 0] call X39_MS2_fnc_registerMedicalMessage;
	["STR_X39_MS2_Scripting_MedicalMessages_Pain_Middle",	[0.5, 0.5, 0, 1],{_value = ([_this] call X39_MS2_fnc_getPain) / ([] call X39_MS2_fnc_getMaxPain); (!([_this] call X39_MS2_fnc_isBlackedOut) && (_value >= 0.3 && _value < 0.6))	}, 0] call X39_MS2_fnc_registerMedicalMessage;
	["STR_X39_MS2_Scripting_MedicalMessages_Pain_High",		[1, 1, 0, 1],		{_value = ([_this] call X39_MS2_fnc_getPain) / ([] call X39_MS2_fnc_getMaxPain); (!([_this] call X39_MS2_fnc_isBlackedOut) && (_value >= 0.6 && _value < 0.7))	}, 0] call X39_MS2_fnc_registerMedicalMessage;
	["STR_X39_MS2_Scripting_MedicalMessages_Pain_Extreme",	[1, 0, 0, 1],		{_value = ([_this] call X39_MS2_fnc_getPain) / ([] call X39_MS2_fnc_getMaxPain); (!([_this] call X39_MS2_fnc_isBlackedOut) && (_value >= 0.7))					}, 0] call X39_MS2_fnc_registerMedicalMessage;
}
else
{
	["STR_X39_MS2_Scripting_MedicalMessages_Pain_Low",		[1, 1, 1, 1],		{_value = ([_this] call X39_MS2_fnc_getPain) / ([] call X39_MS2_fnc_getMaxPain); (_value >= 0.1 && _value < 0.3)	}, 0] call X39_MS2_fnc_registerMedicalMessage;
	["STR_X39_MS2_Scripting_MedicalMessages_Pain_Middle",	[0.5, 0.5, 0, 1],{_value = ([_this] call X39_MS2_fnc_getPain) / ([] call X39_MS2_fnc_getMaxPain); (_value >= 0.3 && _value < 0.6)	}, 0] call X39_MS2_fnc_registerMedicalMessage;
	["STR_X39_MS2_Scripting_MedicalMessages_Pain_High",		[1, 1, 0, 1],		{_value = ([_this] call X39_MS2_fnc_getPain) / ([] call X39_MS2_fnc_getMaxPain); (_value >= 0.6 && _value < 0.7)	}, 0] call X39_MS2_fnc_registerMedicalMessage;
	["STR_X39_MS2_Scripting_MedicalMessages_Pain_Extreme",	[1, 0, 0, 1],		{_value = ([_this] call X39_MS2_fnc_getPain) / ([] call X39_MS2_fnc_getMaxPain); (_value >= 0.7)						}, 0] call X39_MS2_fnc_registerMedicalMessage;

};
true
