#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Hook function
 *	
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
_this call X39_XLib_fnc_ActionDialog_registerAction;
X39_MS2_var_Internal_XLibActionArrays pushBack _this;