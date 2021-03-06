#include "\X39_MS2_Scripting\default.hpp"
/**
 *	Creates a small progressbar at the very top position
 *	(only one can be active at once! So check before using the X39_MS2_var_Internal_Overlay_ProgressBarRunning variable)
 *	!FUNCTION IS NOT CALLSAFE!
 *	
 *	@ParamsCount - 1
 *	@Param1 - SCLALAR - TimeOut
 *	@Return - N/A
 *	@Author - X39
 */
private["_res"];
if(!X39_MS2_var_Internal_Overlay_ProgressBarRunning) exitWith {PRINT_ERROR("X39_MS2_var_Internal_Overlay_ProgressBarRunning == false!")};
terminate X39_MS2_var_Internal_Overlay_ProgressBarHandle;
X39_MS2_var_Internal_Overlay_ProgressBarRunning = false;
_res = [] spawn {
	displayCtrl_Overlay(1295) ctrlSetFade 1;
	displayCtrl_Overlay(1295) ctrlCommit MEDICALUI_ANIMATIONTIME;
	uiSleep MEDICALUI_ANIMATIONTIME;
	displayCtrl_Overlay(1295) ctrlShow false;
};