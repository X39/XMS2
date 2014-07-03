#include "\X39_MS2_Scripting\default.hpp"
#include "\X39_MS2_UIs\MedicalUi\ui.defs"
/**
 *	!FUNCTION IS NOT CALLSAFE!
 *	sets the triageCard state local to the given unit
 *
 *	@Param1 - OBJECT - targeted unit
 *	@Param2 - SCALAR - TriageCard state
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
FORCELOCAL(_this select 0);
_this select 0 setVariable["X39_MS2_var_triageState", _this select 1];