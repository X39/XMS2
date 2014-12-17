#include "\X39_MS2_Scripting\default.hpp"
/*
 * Adds a new Hallucination to the list which will later then get picked and spawned
 *
 *	@Param1 - STRING/CODE	- logic that will be called (using SPAWN) for the hallucination
 *									!MAKE SURE YOU DISABLE ANY DAMAGE COMMING FROM HOSTILE UNITS!
 *									!YOUR HANDLE NEEDS TO DESTROY ANY UNITS IT SPAWNED BEFORE THE FUNCTION ENDS!
 *									Params:
 *									 - PlayerUnit:OBJECT
 *									 - CustomArgs:ANY
 *	@Param2 - ANY				- Custom args for your logic
 *	@Param3 - SCALAR/CODE	- Chance this hallucination will be started (0.00 -> 1.00)
 *	@Param4 - STRING/CODE	- Condition that this hallucination needs before it will be fired
 *									Params:
 *									 - PlayerUnit:OBJECT
 *									 - CustomArgs:ANY
 *	@Return - NA
 */
