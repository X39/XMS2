#include "\X39_MS2_Scripting\default.hpp"
#include "\X39_MS2_UIs\MedicalUi\ui.defs"
/**
 *	!FUNCTION IS NOT CALLSAFE!
 *	returns the triageCard entries of given unit
 *
 *	@Param1 - OBJECT	- targeted unit
 *	@Return - ARRAY		- Array containing all triageCardEntries
 *	@Author - X39
 */
_this select 0 getVariable["X39_MS2_var_triageCard", []];