#include "\X39_MS2_Scripting\default.hpp"
{
	[compile format["format[localize 'STR_X39_MS2_Scripting_MedicalMessages_Bleeding_AterialDamage', name (_this select 0), %1]", str (_x select HITZONE_CommonName)],		[1, 0, 0, 1],		compile format["[_this, %1] call X39_MS2_fnc_getAterialDamage",  str (_x select HITZONE_NAME)], 1] call X39_MS2_fnc_registerMedicalMessage;
	false
}count X39_MS2_var_Internal_HitZones;
[{format[localize "STR_X39_MS2_Scripting_MedicalMessages_Bleeding_BloodPresure", name (_this select 0), [(_this select 0)] call X39_MS2_fnc_getBloodPresure]},		[1, 1, 1, 1],		{_flag = false; if(X39_MS2_var_CheckUnit_sphygmomanometerIsRequiredToGetBloodPresureInfo) then {_flag = ("x39_xms2_sphygmomanometer" in items X39_XLib_var_ActionDialog_Executor)} else {_flag = true;}; _flag}, 2] call X39_MS2_fnc_registerMedicalMessage;

{
	[compile format["format[localize 'STR_X39_MS2_Scripting_MedicalMessages_Bleeding_Low'		, name (_this select 0), %1]", str (_x select HITZONE_CommonName)],	[1, 1, 1, 1],		compile format["_value = ([_this] call X39_MS2_fnc_getBleedingOf%1) / X39_MS2_var_Bleeding_maxBleeding%1;	(_value >= 0.1 && _value < 0.3)	", _x select HITZONE_NAME], 0] call X39_MS2_fnc_registerMedicalMessage;
	[compile format["format[localize 'STR_X39_MS2_Scripting_MedicalMessages_Bleeding_Middle'	, name (_this select 0), %1]", str (_x select HITZONE_CommonName)],	[0.5, 0.5, 0, 1],	compile format["_value = ([_this] call X39_MS2_fnc_getBleedingOf%1) / X39_MS2_var_Bleeding_maxBleeding%1;	(_value >= 0.3 && _value < 0.6)	", _x select HITZONE_NAME], 0] call X39_MS2_fnc_registerMedicalMessage;
	[compile format["format[localize 'STR_X39_MS2_Scripting_MedicalMessages_Bleeding_High'		, name (_this select 0), %1]", str (_x select HITZONE_CommonName)],	[1, 1, 0, 1],		compile format["_value = ([_this] call X39_MS2_fnc_getBleedingOf%1) / X39_MS2_var_Bleeding_maxBleeding%1;	(_value >= 0.6 && _value < 0.7)	", _x select HITZONE_NAME], 0] call X39_MS2_fnc_registerMedicalMessage;
	[compile format["format[localize 'STR_X39_MS2_Scripting_MedicalMessages_Bleeding_Extreme'	, name (_this select 0), %1]", str (_x select HITZONE_CommonName)],	[1, 0, 0, 1],		compile format["_value = ([_this] call X39_MS2_fnc_getBleedingOf%1) / X39_MS2_var_Bleeding_maxBleeding%1;	(_value >= 0.7)					", _x select HITZONE_NAME], 0] call X39_MS2_fnc_registerMedicalMessage;
	
	[compile format["format[localize 'STR_X39_MS2_Scripting_MedicalMessages_Damage_Low'			, name (_this select 0), %1]", str (_x select HITZONE_CommonName)],	[1, 1, 1, 1],		compile format["_value = ([_this] call X39_MS2_fnc_getDamageOf%1) / X39_MS2_var_Damage_maxDamage%1;			(_value >= 0.1 && _value < 0.3)	", _x select HITZONE_NAME], 0] call X39_MS2_fnc_registerMedicalMessage;
	[compile format["format[localize 'STR_X39_MS2_Scripting_MedicalMessages_Damage_Middle'		, name (_this select 0), %1]", str (_x select HITZONE_CommonName)],	[0.5, 0.5, 0, 1],	compile format["_value = ([_this] call X39_MS2_fnc_getDamageOf%1) / X39_MS2_var_Damage_maxDamage%1;			(_value >= 0.3 && _value < 0.6)	", _x select HITZONE_NAME], 0] call X39_MS2_fnc_registerMedicalMessage;
	[compile format["format[localize 'STR_X39_MS2_Scripting_MedicalMessages_Damage_High'		, name (_this select 0), %1]", str (_x select HITZONE_CommonName)],	[1, 1, 0, 1],		compile format["_value = ([_this] call X39_MS2_fnc_getDamageOf%1) / X39_MS2_var_Damage_maxDamage%1;			(_value >= 0.6 && _value < 0.7)	", _x select HITZONE_NAME], 0] call X39_MS2_fnc_registerMedicalMessage;
	[compile format["format[localize 'STR_X39_MS2_Scripting_MedicalMessages_Damage_Extreme'		, name (_this select 0), %1]", str (_x select HITZONE_CommonName)],	[1, 0, 0, 1],		compile format["_value = ([_this] call X39_MS2_fnc_getDamageOf%1) / X39_MS2_var_Damage_maxDamage%1;			(_value >= 0.7)					", _x select HITZONE_NAME], 0] call X39_MS2_fnc_registerMedicalMessage;
	false
}count X39_MS2_var_Internal_HitZones;
true
