#include "\X39_MS2_Scripting\default.hpp"
#include "\X39_MS2_UIs\MedicalUi\ui.defs"
/**
 *	!FUNCTION IS NOT CALLSAFE!
 *	returns the triageCard entries of given unit
 *
 *	@Param1 - OBJECT	- targeted unit
 *	@Return - ARRAY		- Array containing all triageCardEntries
 *	@Author - X39|Cpt. HM Murdock
 */
_this select 0 setVariable["X39_MS2_var_triageCard", []];