#include "\X39_MS2_Scripting\default.hpp"
/*
 *	THIS FUNCTION IS NOT INTENDED TO BE CALLEN BY ANY USERSCRIPT!
 *	
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
if(!isServer) exitWith {};
{
	[compile format["format[localize 'STR_X39_MS2_Scripting_MedicalMessages_Bleeding_Low'		, name (_this select 0), %1]", _x select HITZONE_CommonName],	[1, 1, 1, 1],		compile format["_value = ([_this] call X39_MS2_fnc_getBleedingOf%1) / X39_MS2_var_Bleeding_maxBleeding%1;	(_value >= 0.1 && _value < 0.3)	", _x select HITZONE_NAME], 0] call X39_MS2_fnc_registerMedicalMessage;
	[compile format["format[localize 'STR_X39_MS2_Scripting_MedicalMessages_Bleeding_Middle'	, name (_this select 0), %1]", _x select HITZONE_CommonName],	[0.5, 0.5, 0, 1],	compile format["_value = ([_this] call X39_MS2_fnc_getBleedingOf%1) / X39_MS2_var_Bleeding_maxBleeding%1;	(_value >= 0.3 && _value < 0.6)	", _x select HITZONE_NAME], 0] call X39_MS2_fnc_registerMedicalMessage;
	[compile format["format[localize 'STR_X39_MS2_Scripting_MedicalMessages_Bleeding_High'		, name (_this select 0), %1]", _x select HITZONE_CommonName],	[1, 1, 0, 1],		compile format["_value = ([_this] call X39_MS2_fnc_getBleedingOf%1) / X39_MS2_var_Bleeding_maxBleeding%1;	(_value >= 0.6 && _value < 0.7)	", _x select HITZONE_NAME], 0] call X39_MS2_fnc_registerMedicalMessage;
	[compile format["format[localize 'STR_X39_MS2_Scripting_MedicalMessages_Bleeding_Extreme'	, name (_this select 0), %1]", _x select HITZONE_CommonName],	[1, 0, 0, 1],		compile format["_value = ([_this] call X39_MS2_fnc_getBleedingOf%1) / X39_MS2_var_Bleeding_maxBleeding%1;	(_value >= 0.7)					", _x select HITZONE_NAME], 0] call X39_MS2_fnc_registerMedicalMessage;

	[compile format["format[localize 'STR_X39_MS2_Scripting_MedicalMessages_Damage_Low'			, name (_this select 0), %1]", _x select HITZONE_CommonName],	[1, 1, 1, 1],		compile format["_value = ([_this] call X39_MS2_fnc_getDamageOf%1) / X39_MS2_var_Damage_maxDamage%1;			(_value >= 0.1 && _value < 0.3)	", _x select HITZONE_NAME], 0] call X39_MS2_fnc_registerMedicalMessage;
	[compile format["format[localize 'STR_X39_MS2_Scripting_MedicalMessages_Damage_Middle'		, name (_this select 0), %1]", _x select HITZONE_CommonName],	[0.5, 0.5, 0, 1],	compile format["_value = ([_this] call X39_MS2_fnc_getDamageOf%1) / X39_MS2_var_Damage_maxDamage%1;			(_value >= 0.3 && _value < 0.6)	", _x select HITZONE_NAME], 0] call X39_MS2_fnc_registerMedicalMessage;
	[compile format["format[localize 'STR_X39_MS2_Scripting_MedicalMessages_Damage_High'		, name (_this select 0), %1]", _x select HITZONE_CommonName],	[1, 1, 0, 1],		compile format["_value = ([_this] call X39_MS2_fnc_getDamageOf%1) / X39_MS2_var_Damage_maxDamage%1;			(_value >= 0.6 && _value < 0.7)	", _x select HITZONE_NAME], 0] call X39_MS2_fnc_registerMedicalMessage;
	[compile format["format[localize 'STR_X39_MS2_Scripting_MedicalMessages_Damage_Extreme'		, name (_this select 0), %1]", _x select HITZONE_CommonName],	[1, 0, 0, 1],		compile format["_value = ([_this] call X39_MS2_fnc_getDamageOf%1) / X39_MS2_var_Damage_maxDamage%1;			(_value >= 0.7)					", _x select HITZONE_NAME], 0] call X39_MS2_fnc_registerMedicalMessage;
	false
}count X39_MS2_var_Internal_HitZones;
if(X39_MS2_var_Pain_showDiagnosticsMessagesUnconscious) then
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
["STR_X39_MS2_Scripting_MedicalMessages_Pulse_NoPulse",					[1, 0, 0, 1],		{[_this] call X39_MS2_fnc_hasFlatLine}, 0] call X39_MS2_fnc_registerMedicalMessage;
["STR_X39_MS2_Scripting_MedicalMessages_Respiration_NotBreathing",	[0, 1, 1, 1],		{([_this] call X39_MS2_fnc_getArrestPresent) || ([_this] call X39_MS2_fnc_getToungeBlock)}, 0] call X39_MS2_fnc_registerMedicalMessage;
["STR_X39_MS2_Scripting_MedicalMessages_Respiration_ToungeBlocks",	[0, 1, 1, 1],		{[_this] call X39_MS2_fnc_getToungeBlock}, 1] call X39_MS2_fnc_registerMedicalMessage;
[{format[localize "STR_X39_MS2_Scripting_MedicalMessages_Drugs_ConcentrationMessage", "Adrenaline",	([_this select 0] call X39_MS2_fnc_getAdrenaline)/ X39_MS2_var_Drugs_Adrenaline_maxAdrenaline * 100, "%"]},	[1, 1, 1, 1],		{X39_MS2_var_CheckUnit_showDrugsConcentrationInDiagnostics}, 0] call X39_MS2_fnc_registerMedicalMessage;
[{format[localize "STR_X39_MS2_Scripting_MedicalMessages_Drugs_ConcentrationMessage", "Morphine",		([_this select 0] call X39_MS2_fnc_getMorphine)	/ X39_MS2_var_Drugs_Morphine_maxMorphine * 100, "%"]},		[1, 1, 1, 1],		{X39_MS2_var_CheckUnit_showDrugsConcentrationInDiagnostics}, 0] call X39_MS2_fnc_registerMedicalMessage;
[{format[localize "STR_X39_MS2_Scripting_MedicalMessages_Drugs_ConcentrationMessage", "Naloxone",		([_this select 0] call X39_MS2_fnc_getNaloxone)	/ X39_MS2_var_Drugs_Naloxone_maxNaloxone * 100, "%"]},		[1, 1, 1, 1],		{X39_MS2_var_CheckUnit_showDrugsConcentrationInDiagnostics}, 0] call X39_MS2_fnc_registerMedicalMessage;
[{format[localize "STR_X39_MS2_Scripting_MedicalMessages_Drugs_ConcentrationMessage", "Aspirin",		([_this select 0] call X39_MS2_fnc_getAspirin)	/ X39_MS2_var_Drugs_Aspirin_maxAspirin * 100, "%"]},		[1, 1, 1, 1],		{X39_MS2_var_CheckUnit_showDrugsConcentrationInDiagnostics}, 0] call X39_MS2_fnc_registerMedicalMessage;

{
	[compile format["format[localize 'STR_X39_MS2_Scripting_MedicalMessages_Bleeding_AterialDamage', name (_this select 0), %1]", _x select HITZONE_CommonName],		[1, 0, 0, 1],		compile format["[_this, %1] call X39_MS2_fnc_getAterialDamage", _x select HITZONE_NAME], 1] call X39_MS2_fnc_registerMedicalMessage;
	false
}count X39_MS2_var_Internal_HitZones;
[{format[localize "STR_X39_MS2_Scripting_MedicalMessages_Bleeding_BloodPresure", name (_this select 0), [(_this select 0)] call X39_MS2_fnc_getBloodPresure]},		[1, 1, 1, 1],		{_flag = false; if(X39_MS2_var_CheckUnit_sphygmomanometerIsRequiredToGetBloodPresureInfo) then {_flag = ("x39_xms2_sphygmomanometer" in items X39_XLib_var_ActionDialog_Executor)} else {_flag = true;}; _flag}, 2] call X39_MS2_fnc_registerMedicalMessage;

publicVariable "X39_MS2_var_Internal_MedicalMessages";