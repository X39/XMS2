#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	Callback function for HitPart eventHandler
 *	@Param1 - OBJECT - Object the event handler is assigned to.
 *	@Param2 - STRING - Name of the selection where the unit was damaged. "" for over-all structural damage, "?" for unknown selections.
 *	@Param3 - SCALAR - Resulting level of damage for the selection.
 *	@Param4 - OBJECT - The source unit that caused the damage.
 *	@Param5 - STRING - Classname of the projectile that caused inflicted the damage. ("" for unknown, such as falling damage.)
 *	@Return - NA
 */
systemChat format["PONG!!! %1", _this];