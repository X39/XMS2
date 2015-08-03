#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	!FUNCTION WILL BE EXECUTED LOCAL TO PARAM1 UNIT!
 *	
 *	Code variables get following input:
 *	[[], CUSTOMARGS]
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
params [
	["_target", objNull, [objNull]],
	["_animationsOK", [], [[]]],
	["_animationsLockRemove", [], [[]]],
	["_lockSealBroken", {}, [{}]],
	["_beforeLock", {}, [{}]],
	"_customArgs"
];

if(isNull _target) exitWith {PRINT_ERROR("AnimationLock function received NULL unit!");};
FORCELOCAL(_target);
if({ISCHARP(_x)}count _animationsOK != count _animationsOK) exitWith {PRINT_ERROR("AnimationLock function received invalid AnimationsOK array!");};
if({ISCHARP(_x)}count _animationsLockRemove != count _animationsLockRemove) exitWith {PRINT_ERROR("AnimationLock function received invalid AnimationsLockRemove array!");};
[[], _customArgs] call _beforeLock;
X39_MS2_var_Internal_AnimLock_AllowedAnimations = _animationsOK;
X39_MS2_var_Internal_AnimLock_ExitAnimations = _animationsLockRemove;
X39_MS2_var_Internal_AnimLock_SealBrokenCode = _lockSealBroken;
X39_MS2_var_Internal_AnimLock_CustomArgs = _customArgs;