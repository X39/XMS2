#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/* 
 * Will blackOut the unit depending on the inputs (current blackOut stage needs to be higher then the current or 0)
 * Available stages:
 *	(0) OK
 *	(1) Temporary black out
 *	(2) Perma black out
 *	(3) Dead without timer
 *	(4) Dead with timer
 *	
 * @Param1 - OBJECT - XMS Unit to handle
 * @Param2 - SCALAR - blackOut stage to set
 * @Param3 - SCALAR - time knockedOut (for stage 1)
 * @Return - BOOL - true when unit was blacked out, false when not
 */
private["_unit", "_stage", "_s2TimeBeforeBack"];
DEBUG_CODE(systemChat format["You have been blacked out. Parameters: %1", _this]);

//TODO