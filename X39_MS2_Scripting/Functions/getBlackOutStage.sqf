#include "\X39_MS2_Scripting\default.hpp"
/* 
 *	!FUNCTION IS NOT CALLSAFE!
 *	Returns current BlackOutStage of given unit
 *	
 *	@Param1 - OBJECT - Unit to handle
 *	@Return - SCALAR - current blackOut stage or 0 if unit is not initialized
 */
(_this select 0) getVariable["X39_MS2_var_BlackOut_currentStage", 0];