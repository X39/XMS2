#include "\X39_MS2_Scripting\default.hpp"
#include "\X39_MS2_UIs\MedicalUi\ui.defs"
/**
 *	UI function 
 *
 *	@Param1	- SCALAR - Type
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_type"];
_type = _this select 0;
profileNamespace setVariable ["X39_MS2_var_MedicalUI_ViewType", _type];
if(_type == 0) exitWith	//HealthView
{
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEHEALTHVIEW) ctrlSetTextColor [0, 1, 0, 1];
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEBLOODVIEW) ctrlSetTextColor [1, 0, 0, 1];
};
if(_type == 1) exitWith	//BloodView
{
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEHEALTHVIEW) ctrlSetTextColor [1, 0, 0, 1];
	displayCtrl_MedicalUi(IDC_MEDICALUI_BTN_TOGGLEBLOODVIEW) ctrlSetTextColor [0, 1, 0, 1];
};
