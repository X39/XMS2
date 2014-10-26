#include "\X39_MS2_Scripting\default.hpp"
#include "\X39_MS2_UIs\MedicalUi\ui.defs"
#define ACTIONMENUBUTTONS [ IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON1, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON2, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON3, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON4, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON5, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON6, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON7, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON8, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON9, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON10 ]
#define HITZONEINFOPICTURES [ IDC_MEDICALUI_IMG_HITZONEINFOPIC6, IDC_MEDICALUI_IMG_HITZONEINFOPIC5, IDC_MEDICALUI_IMG_HITZONEINFOPIC7, IDC_MEDICALUI_IMG_HITZONEINFOPIC4, IDC_MEDICALUI_IMG_HITZONEINFOPIC8, IDC_MEDICALUI_IMG_HITZONEINFOPIC3, IDC_MEDICALUI_IMG_HITZONEINFOPIC9, IDC_MEDICALUI_IMG_HITZONEINFOPIC2, IDC_MEDICALUI_IMG_HITZONEINFOPIC10, IDC_MEDICALUI_IMG_HITZONEINFOPIC1, IDC_MEDICALUI_IMG_HITZONEINFOPIC11 ]
#define HITZONES	 [ IDC_MEDICALUI_IMG_HEAD,									IDC_MEDICALUI_IMG_LEFTLOWERARM,									IDC_MEDICALUI_IMG_LEFTLOWERLEG,									IDC_MEDICALUI_IMG_LEFTUPPERARM,									IDC_MEDICALUI_IMG_LEFTUPPERLEG,									IDC_MEDICALUI_IMG_LOWERBODY,									IDC_MEDICALUI_IMG_RIGHTLOWERARM,									IDC_MEDICALUI_IMG_RIGHTLOWERLEG,									IDC_MEDICALUI_IMG_RIGHTUPPERARM,									IDC_MEDICALUI_IMG_RIGHTUPPERLEG,									IDC_MEDICALUI_IMG_UPPERBODY,									IDC_MEDICALUI_IMG_LEFTFOOT,										IDC_MEDICALUI_IMG_RIGHTFOOT]
#define HITZONENAMES [ X39_MS2_var_Internal_HitZones select HITZONE_IndexHead,	X39_MS2_var_Internal_HitZones select HITZONE_IndexLeftLowerArm,	X39_MS2_var_Internal_HitZones select HITZONE_IndexLeftLowerLeg,	X39_MS2_var_Internal_HitZones select HITZONE_IndexLeftUpperArm,	X39_MS2_var_Internal_HitZones select HITZONE_IndexLeftUpperLeg,	X39_MS2_var_Internal_HitZones select HITZONE_IndexLowerBody,	X39_MS2_var_Internal_HitZones select HITZONE_IndexRightLowerArm,	X39_MS2_var_Internal_HitZones select HITZONE_IndexRightLowerLeg,	X39_MS2_var_Internal_HitZones select HITZONE_IndexRightUpperArm,	X39_MS2_var_Internal_HitZones select HITZONE_IndexRightUpperLeg,	X39_MS2_var_Internal_HitZones select HITZONE_IndexUpperBody,	X39_MS2_var_Internal_HitZones select HITZONE_IndexLeftFoot,		X39_MS2_var_Internal_HitZones select HITZONE_IndexRightFoot ]
/**
 *	!UI FUNCTION!
 *	
 *	@Param1 - STRING	- hitzone name
 *	@Param2 - CONTROL	- EventArgs
 *	@Param3 - BOOL	- Enter (true) or Exit (false)
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
if(_this select 2) then
{//Mouse enter
	private["_hitzone", "_control", "_i"];
	_hitzone = _this select 0;
	_control = _this select 1;
	_i = 0;
	{
		if(_x select 2 select 0 == "*" || {_hitzone in (_x select 2)}) then
		{
			if([X39_MS2_var_Internal_DialogCommunication_MA_Target, _hitzone] call (_x select 1)) then
			{
				displayCtrl_MedicalUi(HITZONEINFOPICTURES select _i) ctrlShow true;
				displayCtrl_MedicalUi(HITZONEINFOPICTURES select _i) ctrlSetText (_x select 0);
				
				_i = _i + 1;
			};
		};
	} count X39_MS2_var_Internal_MedicalUi_RegisteredStatusEffects;
}
else
{//Mouse exit
	{displayCtrl_MedicalUi(_x) ctrlShow false; false}count HITZONEINFOPICTURES;
};
