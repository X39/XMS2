#include "\X39_MS2_Scripting\default.hpp"
#include "\X39_MS2_UIs\MedicalUi\ui.defs"
#define ACTIONMENUBUTTONS [ IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON1, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON2, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON3, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON4, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON5, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON6, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON7, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON8, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON9, IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON10 ]
#define HITZONEINFOPICTURES [ IDC_MEDICALUI_IMG_HITZONEINFOPIC6, IDC_MEDICALUI_IMG_HITZONEINFOPIC5, IDC_MEDICALUI_IMG_HITZONEINFOPIC7, IDC_MEDICALUI_IMG_HITZONEINFOPIC4, IDC_MEDICALUI_IMG_HITZONEINFOPIC8, IDC_MEDICALUI_IMG_HITZONEINFOPIC3, IDC_MEDICALUI_IMG_HITZONEINFOPIC9, IDC_MEDICALUI_IMG_HITZONEINFOPIC2, IDC_MEDICALUI_IMG_HITZONEINFOPIC10, IDC_MEDICALUI_IMG_HITZONEINFOPIC1, IDC_MEDICALUI_IMG_HITZONEINFOPIC11 ]
#define HITZONES	 [ IDC_MEDICALUI_IMG_HEAD,									IDC_MEDICALUI_IMG_LEFTLOWERARM,									IDC_MEDICALUI_IMG_LEFTLOWERLEG,									IDC_MEDICALUI_IMG_LEFTUPPERARM,									IDC_MEDICALUI_IMG_LEFTUPPERLEG,									IDC_MEDICALUI_IMG_LOWERBODY,									IDC_MEDICALUI_IMG_RIGHTLOWERARM,									IDC_MEDICALUI_IMG_RIGHTLOWERLEG,									IDC_MEDICALUI_IMG_RIGHTUPPERARM,									IDC_MEDICALUI_IMG_RIGHTUPPERLEG,									IDC_MEDICALUI_IMG_UPPERBODY,									IDC_MEDICALUI_IMG_LEFTFOOT,										IDC_MEDICALUI_IMG_RIGHTFOOT]
#define HITZONENAMES [ X39_MS2_var_Internal_HitZones select HITZONE_IndexHead,	X39_MS2_var_Internal_HitZones select HITZONE_IndexLeftLowerArm,	X39_MS2_var_Internal_HitZones select HITZONE_IndexLeftLowerLeg,	X39_MS2_var_Internal_HitZones select HITZONE_IndexLeftUpperArm,	X39_MS2_var_Internal_HitZones select HITZONE_IndexLeftUpperLeg,	X39_MS2_var_Internal_HitZones select HITZONE_IndexLowerBody,	X39_MS2_var_Internal_HitZones select HITZONE_IndexRightLowerArm,	X39_MS2_var_Internal_HitZones select HITZONE_IndexRightLowerLeg,	X39_MS2_var_Internal_HitZones select HITZONE_IndexRightUpperArm,	X39_MS2_var_Internal_HitZones select HITZONE_IndexRightUpperLeg,	X39_MS2_var_Internal_HitZones select HITZONE_IndexUpperBody,	X39_MS2_var_Internal_HitZones select HITZONE_IndexLeftFoot,		X39_MS2_var_Internal_HitZones select HITZONE_IndexRightFoot ]
/**
 *	!UI FUNCTION!
 *	
 *	@Param1 - STRING - hitzone name
 *	@Param2 - ARRAY - [MousePosX:SCALAR, MousePosY:SCALAR]
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_hitZone", "_mousePos", "_i", "_arr", "_isAllowedToUseResult"];
_hitZone = _this select 0;
_mousePos = _this select 1;
_i = 0;
_arr = ACTIONMENUBUTTONS;
if (
		({([X39_MS2_var_Internal_DialogCommunication_MA_Caller, X39_MS2_var_Internal_DialogCommunication_MA_Target, _hitZone] call (_x select 3))}count X39_MS2_var_Internal_MedicalActions_actionArray) >
		({displayCtrl_MedicalUi(_x) ctrlShow false; true}count _arr)
	) exitWith { ["Available MedicalActions outOfRange (>10)"] call BIS_fnc_HALT; };
{
	_isAllowedToUseResult = [X39_MS2_var_Internal_DialogCommunication_MA_Caller, _x select 5] call X39_MS2_fnc_ls_isAllowedToUse;
	if(_isAllowedToUseResult select 0) then
	{
		if([X39_MS2_var_Internal_DialogCommunication_MA_Caller, X39_MS2_var_Internal_DialogCommunication_MA_Target, _hitZone] call (_x select 3)) then
		{
			if((_mousePos select 1) < ((safeZoneY + safeZoneH) / 2)) then
			{//Top half
				displayCtrl_MedicalUi(_arr select _i) ctrlSetPosition [_mousePos select 0, (_mousePos select 1) + (((0.022 * safezoneH) + 0.002) * (_i + 1)), 0.12375 * safezoneW, 0.022 * safezoneH];
			}
			else
			{//Bottom half
				displayCtrl_MedicalUi(_arr select _i) ctrlSetPosition [_mousePos select 0, (_mousePos select 1) - (((0.022 * safezoneH) + 0.002) * (_i + 1)), 0.12375 * safezoneW, 0.022 * safezoneH];
			};
			displayCtrl_MedicalUi(_arr select _i) ctrlSetFade 1;
			displayCtrl_MedicalUi(_arr select _i) ctrlCommit 0;
			displayCtrl_MedicalUi(_arr select _i) ctrlShow true;
			displayCtrl_MedicalUi(_arr select _i) ctrlSetFade 0;
			displayCtrl_MedicalUi(_arr select _i) ctrlCommit (MEDICALUI_ANIMATIONTIME / (count X39_MS2_var_Internal_Dialog_TriageCard_States));
			displayCtrl_MedicalUi(_arr select _i) ctrlSetEventHandler["MouseButtonDown", format[QUOTATIONMARK
								if(!(X39_MS2_var_Internal_MedicalActions_actionArray select %4 select 7)) then
								{
									X39_MS2_var_Internal_DialogCommunication_MA_preventActions = true;
									X39_XLib_var_ActionDialog_preventMenuOpening = true;
								};
								_res = [] spawn {
									{
										((uiNamespace getVariable 'X39_MS2_var_UIs_MedicalUi') displayCtrl (_x)) ctrlSetFade 1;
										((uiNamespace getVariable 'X39_MS2_var_UIs_MedicalUi') displayCtrl (_x)) ctrlCommit (%3 / (count X39_MS2_var_Internal_Dialog_TriageCard_States));
										uiSleep (%3 / (count X39_MS2_var_Internal_Dialog_TriageCard_States));
										((uiNamespace getVariable 'X39_MS2_var_UIs_MedicalUi') displayCtrl (_x)) ctrlShow false;
										true
									}count %2;
									X39_MS2_var_Internal_Handles_ActionHandle = _this spawn {
										private['_timeout'];
										_timeout = [] call (X39_MS2_var_Internal_MedicalActions_actionArray select %4 select 6);
										if(_timeout > 0) then
										{
											if(vehicle X39_MS2_var_Internal_DialogCommunication_MA_Caller == X39_MS2_var_Internal_DialogCommunication_MA_Caller) then
											{
												[
													X39_MS2_var_Internal_DialogCommunication_MA_Caller,
													['ainvpknlmstpsnonwrfldnon_medic', 'ainvpknlmstpsnonwrfldnon_medic0s', 'ainvpknlmstpsnonwrfldnon_ainvpknlmstpsnonwrfldnon_medic'],
													['ainvpknlmstpsnonwrfldnon_medicend'],
													{
														terminate X39_MS2_var_Internal_Handles_ActionHandle;
														if(!(X39_MS2_var_Internal_MedicalActions_actionArray select %4 select 7)) then
														{
															X39_MS2_var_Internal_DialogCommunication_MA_preventActions = false;
															X39_XLib_var_ActionDialog_preventMenuOpening = false;
														};
														[] call X39_MS2_fnc_clearProgressBarTimeout;
														[] call X39_MS2_fnc_clearAnimationLock;
													},
													{
														if(vehicle (_this select 1 select 0) == (_this select 1 select 0)) then
														{
															(_this select 1 select 0) playAction 'MedicStart';
														};
														[_this select 1 select 2] call X39_MS2_fnc_setProgressBarTimeout;
													},
													[X39_MS2_var_Internal_DialogCommunication_MA_Caller, X39_MS2_var_Internal_DialogCommunication_MA_Target, _timeout]
												] call X39_MS2_fnc_setAnimationLock;
											};
											uiSleep _timeout;
											if(vehicle X39_MS2_var_Internal_DialogCommunication_MA_Caller == X39_MS2_var_Internal_DialogCommunication_MA_Caller) then
											{
												X39_MS2_var_Internal_DialogCommunication_MA_Caller playAction 'MedicStop';
											};
										};
										[X39_MS2_var_Internal_DialogCommunication_MA_Caller, X39_MS2_var_Internal_DialogCommunication_MA_Target, %1, %5] call (X39_MS2_var_Internal_MedicalActions_actionArray select %4 select 4);
										if(!(X39_MS2_var_Internal_MedicalActions_actionArray select %4 select 7)) then
										{
											X39_MS2_var_Internal_DialogCommunication_MA_preventActions = false;
											X39_XLib_var_ActionDialog_preventMenuOpening = false;
										};
									};
								}; QUOTATIONMARK , str _hitZone, _arr, MEDICALUI_ANIMATIONTIME, _forEachIndex, _isAllowedToUseResult select 1]];
			displayCtrl_MedicalUi(_arr select _i) ctrlSetForegroundColor [0, 0, 0, 1];
			displayCtrl_MedicalUi(_arr select _i) ctrlSetBackgroundColor [0, 0, 0, 1];
			displayCtrl_MedicalUi(_arr select _i) ctrlSetActiveColor [0, 0, 0, 1];
			displayCtrl_MedicalUi(_arr select _i) ctrlSetTextColor [1, 1, 1, 1];
			displayCtrl_MedicalUi(_arr select _i) ctrlSetText localize (_x select 1);
			uiSleep (MEDICALUI_ANIMATIONTIME / (count X39_MS2_var_Internal_Dialog_TriageCard_States));
			_i = _i + 1;
		};
	};
} forEach X39_MS2_var_Internal_MedicalActions_actionArray;
