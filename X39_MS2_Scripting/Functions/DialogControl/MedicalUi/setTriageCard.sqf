#include "\X39_MS2_Scripting\default.hpp"
#include "\X39_MS2_UIs\MedicalUi\ui.defs"
/**
 *	!FUNCTION IS NOT CALLSAFE!
 *	sets the triageCard entries local to the given unit
 *
 *	@Param1 - OBJECT - targeted unit
 *	@Param2 - ARRAY - TriageCard entries
 *	@Return - N/A
 *	@Author - X39
 */
FORCELOCAL(_this select 0);
_this select 0 setVariable["X39_MS2_var_triageCard", _this select 1];