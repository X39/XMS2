#include "\X39_MS2_Scripting\default.hpp"
/**
 *	Creates a small progressbar at the very top position
 *	(only one can be active at once! So check before using the X39_MS2_var_Internal_Overlay_ProgressBarRunning variable)
 *	!FUNCTION IS NOT CALLSAFE!
 *	
 *	@ParamsCount - 1
 *	@Param1 - SCLALAR - TimeOut (if timeout < 0, progress bar will be showed until clearProgressBarTimeout is callen)
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_res"];
if(X39_MS2_var_Internal_Overlay_ProgressBarRunning) exitWith {PRINT_ERROR("X39_MS2_var_Internal_Overlay_ProgressBarRunning == true!")};
X39_MS2_var_Internal_Overlay_ProgressBarRunning = true;
X39_MS2_var_Internal_Overlay_ProgressBarHandle = (_this select 0) spawn {
	if(_this >= 0) then
	{
		displayCtrl_Overlay(1295) ctrlSetPosition [safezoneX, safezoneY, 0, 0.01];
		displayCtrl_Overlay(1295) ctrlSetFade 0;
		displayCtrl_Overlay(1295) ctrlCommit 0;
		displayCtrl_Overlay(1295) ctrlShow true;
		displayCtrl_Overlay(1295) ctrlSetPosition [safezoneX, safezoneY, safezoneW, 0.01];
		displayCtrl_Overlay(1295) ctrlCommit _this;
		uiSleep _this;
		displayCtrl_Overlay(1295) ctrlSetFade 1;
		displayCtrl_Overlay(1295) ctrlCommit MEDICALUI_ANIMATIONTIME;
		uiSleep MEDICALUI_ANIMATIONTIME;
		displayCtrl_Overlay(1295) ctrlShow false;
		X39_MS2_var_Internal_Overlay_ProgressBarRunning = false;
	}
	else
	{
		displayCtrl_Overlay(1295) ctrlSetPosition [safezoneX, safezoneY, safezoneW, 0.01];
		displayCtrl_Overlay(1295) ctrlCommit 0;
		displayCtrl_Overlay(1295) ctrlShow true;
		displayCtrl_Overlay(1295) ctrlSetFade 0;
		displayCtrl_Overlay(1295) ctrlCommit MEDICALUI_ANIMATIONTIME;
	};
};