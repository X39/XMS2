#include "ui.defs"

#ifndef GUI_GRID_H
	#define GUI_GRID_H (safezoneH * 0.0165)
#endif



class X39_MS2_UnitSelectionUi {
	idd = 26385;
	onLoad = "uiNamespace setVariable['X39_MS2_UnitSelectionUi', _this select 0];";
	onUnload = "uiNamespace setVariable['X39_MS2_UnitSelectionUi', displayNull];";
	duration = 32000;
	fadeIn = 0;
	fadeOut = 0;
	enableSimulation = 1;

	class controls
	{
		class mclb_UnitSelection: RscListNBox
		{
			idc = IDC_UNITSELECTIONUI_MCLB_UNITSELECTION;
			x = 0.345311 * safezoneW + safezoneX;
			y = 0.319 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.33 * safezoneH;
			
			// number of columns used, and their left positions
			// if using side buttons, space has to be reserved for those,
			// at a width of roughly 120% of rowHeight
			columns[] = {0, 0.1, 0.3};
			colorBackground[] = {0,0,0,0.4};
			// height of each row
			rowHeight = 0.05;
			sizeEx = 1.4 * GUI_GRID_H;
			drawSideArrows = 0;
			toolTip = "";
		};
		class IGUIBack_2201: IGUIBack
		{
			idc = IDC_UNITSELECTIONUI_IGUIBACK_2201;
			x = 0.345311 * safezoneW + safezoneX;
			y = 0.319 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.33 * safezoneH;
			colorBackground[] = {0,0,0,0.2};
		};
		class label_UnitSelection: X39_XLib_modProperties_RscText
		{
			idc = IDC_UNITSELECTIONUI_LABEL_UNITSELECTION;
			text = "Unit selection"; //--- ToDo: Localize;
			x = 0.345311 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,1};
		};
		class RscButtonMenuOK_2600: RscButtonMenuOK
		{
			idc = IDC_UNITSELECTIONUI_RSCBUTTONMENUOK_2600;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
			action = "[] spawn {closeDialog 26385;sleep 0.1; if(!isNull(missionNamespace getVariable ""X39_MS2_var_Internal_DialogCommunication_US_TargetedUnit"")) then {[missionNamespace getVariable ""X39_MS2_var_Internal_DialogCommunication_US_TargetedUnit""] call X39_MS2_fnc_MedicalActionMenu_createDialog; missionNamespace setVariable [""X39_MS2_var_Internal_DialogCommunication_US_TargetedUnit"", nil];};}";
		};
		class RscButtonMenuCancel_2700: RscButtonMenuCancel
		{
			idc = IDC_UNITSELECTIONUI_RSCBUTTONMENUCANCEL_2700;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
			action = "closeDialog 26385;";
		};
	};
};