#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	!FUNCTION WILL BE EXECUTED LOCAL TO PARAM1 UNIT!
 *	
 *	@Param1 - OBJECT - Unit to create the animation lock on
 *	@Param2 - ARRAY - Animations which are OK (wont trigger abort)
 *	@Param3 - ARRAY - Animations which remove the lock
 *	@Param4 - CODE - Code to be executed when lock gets broken by a different animation
 *	@Param5 - CODE - Code to be executed before the actual animation lock (use this to change the animation)
 *	@Param6 - ANY - Custom args passed to each code
 *	@Return - NA
 *	@Author	- X39|Cpt. HM Murdock
 */
private["_target", "_animationsOK", "_animationsLockRemove", "_lockSealBroken", "_beforeLock", "_customArgs"];
_target =				[_this, 0, objNull, [objNull]] call BIS_fnc_param;
_animationsOK =			[_this, 1, [], [[]]] call BIS_fnc_param;
_animationsLockRemove =	[_this, 2, [], [[]]] call BIS_fnc_param;
_lockSealBroken =		[_this, 3, {}, [{}]] call BIS_fnc_param;
_beforeLock =			[_this, 4, {}, [{}]] call BIS_fnc_param;
_customArgs =			[_this, 5] call BIS_fnc_param;
if(isNull _target) exitWith {PRINT_ERROR("AnimationLock function received NULL unit!");};
FORCELOCAL(_target);
if({ISCHARP(_x)}count _animationsOK != count _animationsOK) exitWith {PRINT_ERROR("AnimationLock function received invalid AnimationsOK array!");};
if({ISCHARP(_x)}count _animationsLockRemove != count _animationsLockRemove) exitWith {PRINT_ERROR("AnimationLock function received invalid AnimationsLockRemove array!");};
[[], _customArgs] call _beforeLock;
X39_MS2_var_Internal_AnimLock_AllowedAnimations = _animationsOK;
X39_MS2_var_Internal_AnimLock_ExitAnimations = _animationsLockRemove;
X39_MS2_var_Internal_AnimLock_SealBrokenCode = _lockSealBroken;
X39_MS2_var_Internal_AnimLock_CustomArgs = _customArgs;