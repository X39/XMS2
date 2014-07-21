#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	Initializes a unit
 *	!WARNING!
 *	Depending on if the unit is still in JIP or not this can and will lead in unexpected
 *	behaviour when other initialization methods are also used!
 *	Please only call this function if you KNOW what youre doing!
 *	
 *	Errors will use https://community.bistudio.com/wiki/throw
 *	
 *	Function supports tryCatch for errors (warnings will be ignored)
 *	
 *	@Param1 - OBJECT - Unit to initialize
 *	@Return - NA
 */
_handle = _this spawn {
	DEBUG_CODE_SC(_fnc_scriptName = "X39_MS2_fnc_initUnit")
	private["_unit"];
	_unit = [_this, 0, objNull, [objNull, {}]] call BIS_fnc_param;
	if(ISCODE(_unit)) then
	{
		waitUntil{!isNil _unit};
		waitUntil{!isNull ([] call _unit)};
		_unit = [] call _unit;
	};

	if(!ISOBJECT(_unit)) exitWith
	{
		PRINT_ERROR(EX_INV_ARG);
		throw EX_INF_ARG;
	};
	waitUntil{alive _unit};
	DEBUG_LOG_WFn_SC(format["Initializing '%1's variables" COMMA _unit])
	if(_unit getVariable ["X39_MS2_var_UnitInitialized", false]) then
	{
		PRINT_WARNING(EX_INV_ARG);
	}
	else
	{
		//initialize variables
		{
			_unit setVariable[_x select 0, [] call (_x select 1), true];
			false
		}count X39_MS2_var_Internal_UnitVariables;
		//set triggers
		if((_unit getVariable ["X39_MS2_var_EH_HandleDamage", -1]) == -1)		then { _unit setVariable["X39_MS2_var_EH_HandleDamage",		_unit addEventHandler["HandleDamage",		{_this call X39_MS2_fnc_cb_HandleDamage}], true];		};
		if((_unit getVariable ["X39_MS2_var_EH_FiredNear", -1]) == -1)			then { _unit setVariable["X39_MS2_var_EH_FiredNear",		_unit addEventHandler["FiredNear",			{_this call X39_MS2_fnc_cb_FiredNear}], true];			};
		if((_unit getVariable ["X39_MS2_var_EH_Explosion", -1]) == -1)			then { _unit setVariable["X39_MS2_var_EH_Explosion",		_unit addEventHandler["Explosion",			{_this call X39_MS2_fnc_cb_Explosion}], true];			};
		if((_unit getVariable ["X39_MS2_var_EH_AnimStateChanged", -1]) == -1)	then { _unit setVariable["X39_MS2_var_EH_AnimStateChanged",	_unit addEventHandler["AnimStateChanged",	{_this call X39_MS2_fnc_cb_AnimStateChanged}], true];	};
		if((_unit getVariable ["X39_MS2_var_EH_Respawn", -1]) == -1)			then { _unit setVariable["X39_MS2_var_EH_Respawn",			_unit addEventHandler["Respawn",			{_this call X39_MS2_fnc_cb_Respawn}], true];			};
		
		DEBUG_LOG_WFn_SC(format["X39_MS2_var_EH_HandleDamage = %1" COMMA (_unit getVariable ["X39_MS2_var_EH_HandleDamage" COMMA "NA"])])
		DEBUG_LOG_WFn_SC(format["X39_MS2_var_EH_FiredNear = %1" COMMA (_unit getVariable ["X39_MS2_var_EH_FiredNear" COMMA "NA"])])
		DEBUG_LOG_WFn_SC(format["X39_MS2_var_EH_Explosion = %1" COMMA (_unit getVariable ["X39_MS2_var_EH_Explosion" COMMA "NA"])])
		DEBUG_LOG_WFn_SC(format["X39_MS2_var_EH_AnimStateChanged = %1" COMMA (_unit getVariable ["X39_MS2_var_EH_AnimStateChanged" COMMA "NA"])])
		DEBUG_LOG_WFn_SC(format["X39_MS2_var_EH_Respawn = %1" COMMA (_unit getVariable ["X39_MS2_var_EH_Respawn" COMMA "NA"])])
		
		_unit setVariable ["X39_MS2_var_UnitInitialized", true];
		[_unit, "X39_MS2_fnc_runTicker", _unit, false] spawn BIS_fnc_MP;
	};
	//Initialize ppEffects if current entity hasInterface and they are -1
	DEBUG_LOG_WFn_SC(format["Initializing '%1's ppEffectHandles + other client related stuff if target is a player computer" COMMA _unit])
	if(hasInterface && {_unit == player}) then
	{
		DEBUG_LOG_WFn_SC("X39_MS2_var_Internal_ppe_radialBlur")
		if(X39_MS2_var_Internal_ppe_radialBlur == -1) then
		{
			X39_MS2_var_Internal_ppe_radialBlur = ppEffectCreate ["radialBlur", 470];
			X39_MS2_var_Internal_ppe_radialBlur ppEffectEnable true;
		};
		DEBUG_LOG_WFn_SC("X39_MS2_var_Internal_ppe_chromAberration")
		if(X39_MS2_var_Internal_ppe_chromAberration == -1) then
		{
			X39_MS2_var_Internal_ppe_chromAberration = ppEffectCreate ["chromAberration", 5010];
			X39_MS2_var_Internal_ppe_chromAberration ppEffectEnable true;
		};
		DEBUG_LOG_WFn_SC("X39_MS2_var_Internal_ppe_wetDistortion")
		if(X39_MS2_var_Internal_ppe_wetDistortion == -1) then
		{
			X39_MS2_var_Internal_ppe_wetDistortion = ppEffectCreate ["wetDistortion", 1140];
			X39_MS2_var_Internal_ppe_wetDistortion ppEffectEnable true;
		};
		DEBUG_LOG_WFn_SC("X39_MS2_var_Internal_ppe_colorCorrections")
		if(X39_MS2_var_Internal_ppe_colorCorrections == -1) then
		{
			X39_MS2_var_Internal_ppe_colorCorrections = ppEffectCreate ["colorCorrections", 1160];
			X39_MS2_var_Internal_ppe_colorCorrections ppEffectEnable true;
		};
		DEBUG_LOG_WFn_SC("X39_MS2_var_Internal_ppe_dynamicBlur")
		if(X39_MS2_var_Internal_ppe_dynamicBlur == -1) then
		{
			X39_MS2_var_Internal_ppe_dynamicBlur = ppEffectCreate ["dynamicBlur", 460];
			X39_MS2_var_Internal_ppe_dynamicBlur ppEffectEnable true;
		};
		DEBUG_LOG_WFn_SC("X39_MS2_var_Internal_ppe_filmGrain")
		if(X39_MS2_var_Internal_ppe_filmGrain == -1) then
		{
			X39_MS2_var_Internal_ppe_filmGrain = ppEffectCreate ["filmGrain", 2060];
			X39_MS2_var_Internal_ppe_filmGrain ppEffectEnable true;
		};
		DEBUG_LOG_WFn_SC("X39_MS2_var_Internal_ppe_colorInversion")
		if(X39_MS2_var_Internal_ppe_colorInversion == -1) then
		{
			X39_MS2_var_Internal_ppe_colorInversion = ppEffectCreate ["colorInversion", 2510];
			X39_MS2_var_Internal_ppe_colorInversion ppEffectEnable true;
		};
		DEBUG_LOG_WFn_SC("reseting all effects")
		[] call X39_MS2_fnc_overlay_createDisplay;
	};
	[] call X39_MS2_fnc_resetPPEffects;
};