#include "\X39_MS2_Scripting\default.hpp"
/**
 *	Triggered every time an animation state changes.
 *	Unlike AnimChanged and AnimDone, it is triggered for all animation states in a sequence.
 *	It can be assigned to a remote unit but will only fire on the PC where the actual addEventHandler command was executed.
 *
 *	@ParamsCount - 5
 *	@Param1 - OBJECT (unit) - N/A
 *	@Param2 - STRING (animation) - N/A
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_unit", "_animation"];
_unit = _this select 0;
_animation = _this select 1;