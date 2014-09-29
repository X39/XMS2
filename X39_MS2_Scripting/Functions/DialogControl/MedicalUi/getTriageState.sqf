#include "\X39_MS2_Scripting\default.hpp"
#include "\X39_MS2_UIs\MedicalUi\ui.defs"
/**
 *	!FUNCTION IS NOT CALLSAFE!
 *	returns the triageCard state of given unit
 *
 *	@Param1 - OBJECT - targeted unit
 *	@Return - SCALAR - TriageCard state
 *	@Author - X39|Cpt. HM Murdock
 */
_this select 0 getVariable["X39_MS2_var_triageState", -1];