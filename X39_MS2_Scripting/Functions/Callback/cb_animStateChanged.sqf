#include "\X39_MS2_Scripting\default.hpp"
/**
 *	Triggered every time an animation state changes.
 *	Unlike AnimChanged and AnimDone, it is triggered for all animation states in a sequence.
 *	It can be assigned to a remote unit but will only fire on the PC where the actual addEventHandler command was executed.
 *
 *	@ParamsCount - 2
 *	@Param1 - OBJECT (unit) - N/A
 *	@Param2 - STRING (animation) - N/A
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_unit", "_animation"];
//TODO: Make independent from unit so that the animationLock can also be used for AI
_unit = _this select 0;
_animation = _this select 1;
if(count X39_MS2_var_Internal_AnimLock_AllowedAnimations == 0) exitWith {DEBUG_LOG_WFn_SC("No lock in place")};
//X39_MS2_var_Internal_AnimLock_AllowedAnimations
//X39_MS2_var_Internal_AnimLock_ExitAnimations
//X39_MS2_var_Internal_AnimLock_SealBrokenCode
if(!(_animation in X39_MS2_var_Internal_AnimLock_AllowedAnimations) && {!(_animation in X39_MS2_var_Internal_AnimLock_ExitAnimations)}) then
{
	[_this, X39_MS2_var_Internal_AnimLock_CustomArgs] call X39_MS2_var_Internal_AnimLock_SealBrokenCode;
};
if(_animation in X39_MS2_var_Internal_AnimLock_ExitAnimations) then
{
	[] call X39_MS2_fnc_clearAnimationLock;
};