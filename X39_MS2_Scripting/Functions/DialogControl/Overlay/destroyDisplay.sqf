#include "\X39_MS2_Scripting\default.hpp"
/**
 *	UI function to destroy the overlay display
 *
 *	@ParamsCount - 0
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_version"];
if(isNull(uiNamespace getVariable['X39_MS2_var_UIs_XMS2_Overlay', displayNull])) exitWith { DEBUG_LOG("Overlay was not created yet."); };
("X39_MS2_var_UIs_XMS2_Overlay" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];