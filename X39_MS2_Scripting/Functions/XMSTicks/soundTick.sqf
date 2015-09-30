#include "\X39_MS2_Scripting\default.hpp"
///*	
// *	XMSTick Handler
// *	Description will not be available as this is not intended to be callen by anyone but the XMSTicker
// *	Available parent variables:
// *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeDynamicBlur")			- range 0 - 1 | ammount of blur over entire screen
// *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeRadialBlur")			- range 0 - 1 | ammount of blur (needs (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFocus") to actually work)
// *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFocus")				- range 0 - 1 | how focused the player will be (where 0 is not focused and 1 is full focus) (needs (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeRadialBlur") to actually work)
// *		X39_MS2_var_Internal_Ticker(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFilmGrain")			- range 0 - 1 | how strong the film grain effect will be (confusion)
// *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeChromAberration")		- range 0 - 1 | how strong the chromAberration will be (see things twice>)
// *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeGreyScreen")			- range 0 - 1 | 0 means normal 1 means totally grey
// *	
// *		(_unit getVariable "X39_MS2_var_Internal_Ticker_cfnDisableFatigue")		- range 0 - n | >0 will disable fatigue
// *		(_unit getVariable "X39_MS2_var_Internal_Ticker_cfnForceWalk")			- range 0 - n | >0 will force walk
// *	
// *	@Param1 - OBJECT - Unit
// *	@Param2 - SCALAR - HandleID
// *	@Return - NA
// */
//private["_unit", "_pulseCurrent"];
//_unit = _this select 0;
//
//_pulseCurrent = [_unit] call X39_MS2_fnc_getHeartPulse;
//_pulseVal = round (_pulseCurrent / (X39_MS2_var_Heart_deadlyMaxHeartPulsePerSecond / 5));
//if(_pulseCurrent >= X39_MS2_var_Heart_normalMaxHeartPulsePerSecond) then
//{
//	playSound "XMS2_SoundFiles_breathing_1";
//};
//[] call 
//{
//	if(_pulseVal == 0) exitWith { playSound "XMS2_SoundFiles_heart_analog_80bpm"; };
//	if(_pulseVal == 1) exitWith { playSound "XMS2_SoundFiles_heart_analog_95bpm"; };
//	if(_pulseVal == 2) exitWith { playSound "XMS2_SoundFiles_heart_analog_110bpm"; };
//	if(_pulseVal == 3) exitWith { playSound "XMS2_SoundFiles_heart_analog_140bpm"; };
//	if(_pulseVal >= 4) exitWith { playSound "XMS2_SoundFiles_heart_analog_irregular"; };
//};
//
////if((_unit getVariable "X39_MS2_var_Internal_Ticker_blackOutStage") >= 1 && (_unit getVariable "X39_MS2_var_Internal_Ticker_blackOutStage") <= 2) then
////{
////	if((([_unit] call X39_MS2_fnc_getDamageTotal) / ([] call X39_MS2_fnc_getMaxDamageTotal)) >=) then
////	{
////		//Moan sound is broken ...
////		//TODO: FIX sounds
////	};
////};
//if(X39_MS2_var_Sound_playExtremePainSounds && {(_unit getVariable "X39_MS2_var_Internal_Ticker_redScreenAlpha") > X39_MS2_var_Sound_playExtremePainSounds_startPointP}) then
//{
//	if((_unit getVariable "X39_MS2_var_Internal_Ticker_blackOutStage") == 0 && random 10 < 1) then
//	{
//		playSound3D [format["\X39_MS2_Resources\sounds\XMS2_SoundFiles_pain_short_%1.ogg", floor (random 6)], _unit, false, position _unit, 1, 1, 0];
//	};
//};