#include "ui.defs"
#define GUI_GRID_H (safezoneH * 0.0165)



class X39_MS2_MedicalUi {
	idd = IDC_MEDICALUI_UIIDD;
	onLoad = "uiNamespace setVariable['X39_MS2_var_UIs_MedicalUi', _this select 0];";
	onUnload = "uiNamespace setVariable['X39_MS2_var_UIs_MedicalUi', displayNull];";
	duration = 32000;
	fadeIn = 0;
	fadeOut = 0;
	enableSimulation = 1;
	author = "X39|Cpt. HM Murdock";
	class controls {
		class back_MainFrame: IGUIBack
		{
			idc = IDC_MEDICALUI_BACK_MAINFRAME;
			x = 0.29475 * safezoneW + safezoneX;
			y = 0.127 * safezoneH + safezoneY;
			w = 0.4105 * safezoneW;
			h = 0.745 * safezoneH;
			colorBackground[] = {0,0,0,0.25};
		};
		class back_DiagnosticFrame: IGUIBack
		{
			idc = IDC_MEDICALUI_BACK_DIAGNOSTICFRAME;
			x = 0.0875 * safezoneW + safezoneX;
			y = 0.127 * safezoneH + safezoneY;
			w = 0.20525 * safezoneW;
			h = 0.352 * safezoneH;
			colorBackground[] = {0,0,0,0.25};
		};
		class back_TriageCardFrame: IGUIBack
		{
			idc = IDC_MEDICALUI_BACK_TRIAGECARDFRAME;
			x = 0.70725 * safezoneW + safezoneX;
			y = 0.127 * safezoneH + safezoneY;
			w = 0.20525 * safezoneW;
			h = 0.352 * safezoneH;
			colorBackground[] = {0,0,0,0.25};
		};
		class back_customTriageCardEntryBackground: IGUIBack
		{
			idc = IDC_MEDICALUI_BACK_CUSTOMTRIAGECARDENTRYBACKGROUND;
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.427 * safezoneH + safezoneY;
			w = 0.157844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class back_DrugsFrame: IGUIBack
		{
			idc = IDC_MEDICALUI_BACK_DRUGSFRAME;
			x = 0.0875 * safezoneW + safezoneX;
			y = 0.52 * safezoneH + safezoneY;
			w = 0.20525 * safezoneW;
			h = 0.352 * safezoneH;
			colorBackground[] = {0,0,0,0.25};
		};
		class back_QuickActionFrame: IGUIBack
		{
			idc = IDC_MEDICALUI_BACK_QUICKACTIONFRAME;
			x = 0.70725 * safezoneW + safezoneX;
			y = 0.52 * safezoneH + safezoneY;
			w = 0.20525 * safezoneW;
			h = 0.352 * safezoneH;
			colorBackground[] = {0,0,0,0.25};
		};
		class label_Drugs: RscText
		{
			idc = IDC_MEDICALUI_LABEL_DRUGS;
			text = "Drugs"; //--- ToDo: Localize;
			x = 0.0926562 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,1};
			class Attributes
			{
				font = "TahomaB";
				align = "center";
				valign = "middle";
				shadow = true;
				shadowColor = "#d2d2d2";
				size = "1";
			}
			style = 0x02;
		};
		class label_UnitName: RscText
		{
			idc = IDC_MEDICALUI_LABEL_UNITNAME;
			text = "NameLabel"; //--- ToDo: Localize;
			x = 0.37825 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.2435 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,1};
			class Attributes
			{
				font = "TahomaB";
				align = "center";
				valign = "middle";
				shadow = true;
				shadowColor = "#d2d2d2";
				size = "1";
			}
			style = 0x02;
		};
		class label_Diagnostic: RscText
		{
			idc = IDC_MEDICALUI_LABEL_DIAGNOSTIC;
			text = "Diagnostics"; //--- ToDo: Localize;
			x = 0.0926562 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,1};
			class Attributes
			{
				font = "TahomaB";
				align = "center";
				valign = "middle";
				shadow = true;
				shadowColor = "#d2d2d2";
				size = "1";
			}
			style = 0x02;
		};
		class label_TriageCard: RscText
		{
			idc = IDC_MEDICALUI_LABEL_TRIAGECARD;
			text = "TriageCardEntries"; //--- ToDo: Localize;
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,1};
			class Attributes
			{
				font = "TahomaB";
				align = "center";
				valign = "middle";
				shadow = true;
				shadowColor = "#d2d2d2";
				size = "1";
			}
			style = 0x02;
		};
		class label_QuickActions: RscText
		{
			idc = IDC_MEDICALUI_LABEL_QUICKACTIONS;
			text = "QuickActions"; //--- ToDo: Localize;
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,1};
			class Attributes
			{
				font = "TahomaB";
				align = "center";
				valign = "middle";
				shadow = true;
				shadowColor = "#d2d2d2";
				size = "1";
			}
			style = 0x02;
		};
		class lbtn_TriageCardBottom: RscText
		{
			idc = IDC_MEDICALUI_LBTN_TRIAGECARDBOTTOM;
			text = ""; //--- ToDo: Localize;
			x = 0.29475 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.4105 * safezoneW;
			h = 0.032 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.5,0.5,0.5,1};
			class Attributes
			{
				font = "TahomaB";
				align = "center";
				valign = "middle";
				shadow = false;
				shadowColor = "#d2d2d2";
				size = "1";
			}
			style = 0x02;
			shadow = 0;
		};
		class lbtn_TriageCardTop: RscText
		{
			idc = IDC_MEDICALUI_LBTN_TRIAGECARDTOP;
			text = ""; //--- ToDo: Localize;
			x = 0.29475 * safezoneW + safezoneX;
			y = 0.093 * safezoneH + safezoneY;
			w = 0.4105 * safezoneW;
			h = 0.032 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.5,0.5,0.5,1};
			class Attributes
			{
				font = "TahomaB";
				align = "center";
				valign = "middle";
				shadow = false;
				shadowColor = "#d2d2d2";
				size = "1";
			}
			style = 0x02;
			shadow = 0;
		};
		class btn_checkUnit: RscButton
		{
			idc = IDC_MEDICALUI_BTN_CHECKUNIT;
			text = "CheckUnitButton"; //--- ToDo: Localize;
			x = 0.191625 * safezoneW + safezoneX;
			y = 0.425 * safezoneH + safezoneY;
			w = 0.0969687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btn_AddSelectedDiagnosticsToTriageCard: RscButton
		{
			idc = IDC_MEDICALUI_BTN_ADDSELECTEDDIAGNOSTICSTOTRIAGECARD;
			text = "AddSelectedDiagnosticsToTriageCard"; //--- ToDo: Localize;
			x = 0.0926562 * safezoneW + safezoneX;
			y = 0.449 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btn_AddPredefinedMessageToTriageCard: RscButton
		{
			idc = IDC_MEDICALUI_BTN_ADDPREDEFINEDMESSAGETOTRIAGECARD;
			text = "+"; //--- ToDo: Localize;
			x = 0.897031 * safezoneW + safezoneX;
			y = 0.403 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btn_AddCustomMessageToTriageCard: RscButton
		{
			idc = IDC_MEDICALUI_BTN_ADDCUSTOMMESSAGETOTRIAGECARD;
			text = "+"; //--- ToDo: Localize;
			x = 0.897031 * safezoneW + safezoneX;
			y = 0.427 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btn_RemoveEntryFromTriageCard: RscButton
		{
			idc = IDC_MEDICALUI_BTN_REMOVEENTRYFROMTRIAGECARD;
			text = "RemoveEntry"; //--- ToDo: Localize;
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.451 * safezoneH + safezoneY;
			w = 0.0969687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btn_PruneTriageCard: RscButton
		{
			idc = IDC_MEDICALUI_BTN_PRUNETRIAGECARD;
			text = "PruneCard"; //--- ToDo: Localize;
			x = 0.810375 * safezoneW + safezoneX;
			y = 0.451 * safezoneH + safezoneY;
			w = 0.0969687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btn_ApplySelectedDrug: RscButton
		{
			idc = IDC_MEDICALUI_BTN_APPLYSELECTEDDRUG;
			text = "ApplyDrug"; //--- ToDo: Localize;
			x = 0.0926562 * safezoneW + safezoneX;
			y = 0.843 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btn_PerformQuickAction: RscButton
		{
			idc = IDC_MEDICALUI_BTN_PERFORMQUICKACTION;
			text = "PerformQuickAction"; //--- ToDo: Localize;
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.843 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class img_HitZoneInfoPic6: RscPicture
		{
			idc = IDC_MEDICALUI_IMG_HITZONEINFOPIC6;
			text = "#(argb,8,8,3)color(1,1,1,0.1)";
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class img_HitZoneInfoPic1: RscPicture
		{
			idc = IDC_MEDICALUI_IMG_HITZONEINFOPIC1;
			text = "#(argb,8,8,3)color(1,1,1,0.1)";
			x = 0.335 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class img_HitZoneInfoPic2: RscPicture
		{
			idc = IDC_MEDICALUI_IMG_HITZONEINFOPIC2;
			text = "#(argb,8,8,3)color(1,1,1,0.1)";
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class img_HitZoneInfoPic3: RscPicture
		{
			idc = IDC_MEDICALUI_IMG_HITZONEINFOPIC3;
			text = "#(argb,8,8,3)color(1,1,1,0.1)";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class img_HitZoneInfoPic4: RscPicture
		{
			idc = IDC_MEDICALUI_IMG_HITZONEINFOPIC4;
			text = "#(argb,8,8,3)color(1,1,1,0.1)";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class img_HitZoneInfoPic5: RscPicture
		{
			idc = IDC_MEDICALUI_IMG_HITZONEINFOPIC5;
			text = "#(argb,8,8,3)color(1,1,1,0.1)";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class img_HitZoneInfoPic7: RscPicture
		{
			idc = IDC_MEDICALUI_IMG_HITZONEINFOPIC7;
			text = "#(argb,8,8,3)color(1,1,1,0.1)";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class img_HitZoneInfoPic8: RscPicture
		{
			idc = IDC_MEDICALUI_IMG_HITZONEINFOPIC8;
			text = "#(argb,8,8,3)color(1,1,1,0.1)";
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class img_HitZoneInfoPic9: RscPicture
		{
			idc = IDC_MEDICALUI_IMG_HITZONEINFOPIC9;
			text = "#(argb,8,8,3)color(1,1,1,0.1)";
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class img_HitZoneInfoPic10: RscPicture
		{
			idc = IDC_MEDICALUI_IMG_HITZONEINFOPIC10;
			text = "#(argb,8,8,3)color(1,1,1,0.1)";
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class img_HitZoneInfoPic11: RscPicture
		{
			idc = IDC_MEDICALUI_IMG_HITZONEINFOPIC11;
			text = "#(argb,8,8,3)color(1,1,1,0.1)";
			x = 0.644375 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class lb_triageCardEntries: RscListbox
		{
			idc = IDC_MEDICALUI_LB_TRIAGECARDENTRIES;
			x = 0.711405 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.242 * safezoneH;
		};
		class lb_DiagnosticsList: RscListbox
		{
			idc = IDC_MEDICALUI_LB_DIAGNOSTICSLIST;
			x = 0.0926552 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.264 * safezoneH;
		};
		class lb_DrugsList: RscListbox
		{
			idc = IDC_MEDICALUI_LB_DRUGSLIST;
			x = 0.0926557 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.286 * safezoneH;
		};
		class lb_QuickActionList: RscListbox
		{
			idc = IDC_MEDICALUI_LB_QUICKACTIONLIST;
			x = 0.711405 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.154 * safezoneH;
		};
		class cb_checkUnitType: RscCombo
		{
			idc = IDC_MEDICALUI_CB_CHECKUNITTYPE;
			x = 0.0926562 * safezoneW + safezoneX;
			y = 0.425 * safezoneH + safezoneY;
			w = 0.0969687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class cb_preDefinedTriageCardMessages: RscCombo
		{
			idc = IDC_MEDICALUI_CB_PREDEFINEDTRIAGECARDMESSAGES;
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.403 * safezoneH + safezoneY;
			w = 0.183625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class cb_customTriageCardMessageColorSelection: RscCombo
		{
			idc = IDC_MEDICALUI_CB_CUSTOMTRIAGECARDMESSAGECOLORSELECTION;
			x = 0.87125 * safezoneW + safezoneX;
			y = 0.427 * safezoneH + safezoneY;
			w = 0.0237812 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tb_customTriageCardEntry: RscEdit
		{
			idc = IDC_MEDICALUI_TB_CUSTOMTRIAGECARDENTRY;
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.427 * safezoneH + safezoneY;
			w = 0.157844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tb_quickActionDescription: RscStructuredText
		{
			idc = IDC_MEDICALUI_TB_QUICKACTIONDESCRIPTION;
			x = 0.711405 * safezoneW + safezoneX;
			y = 0.711 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.13 * safezoneH;
		};
		class btn_ToggleDrugsFrame: RscButton
		{
			idc = IDC_MEDICALUI_BTN_TOGGLEDRUGSFRAME;
			text = ">"; //--- ToDo: Localize;
			x = 0.0771875 * safezoneW + safezoneX;
			y = 0.52 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.352 * safezoneH;
			colorBackground[] = {0,0,0,0.25};
		};
		class btn_ToggleDiagnosticFrame: RscButton
		{
			idc = IDC_MEDICALUI_BTN_TOGGLEDIAGNOSTICFRAME;
			text = ">"; //--- ToDo: Localize;
			x = 0.0771875 * safezoneW + safezoneX;
			y = 0.127 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.352 * safezoneH;
			colorBackground[] = {0,0,0,0.25};
		};
		class btn_ToggleTriageCardFrame: RscButton
		{
			idc = IDC_MEDICALUI_BTN_TOGGLETRIAGECARDFRAME;
			text = "<"; //--- ToDo: Localize;
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.127 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.352 * safezoneH;
			colorBackground[] = {0,0,0,0.25};
		};
		class btn_ToggleQuickActionFrame: RscButton
		{
			idc = IDC_MEDICALUI_BTN_TOGGLEQUICKACTIONFRAME;
			text = "<"; //--- ToDo: Localize;
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.52 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.352 * safezoneH;
			colorBackground[] = {0,0,0,0.25};
		};
		class img_head: RscPicture
		{
			idc = IDC_MEDICALUI_IMG_HEAD;
			text = "\X39_MS2_Resources\UI\MedicalUI\BodyPart_Head.paa";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.181926 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class img_leftLowerArm: RscPicture
		{
			idc = IDC_MEDICALUI_IMG_LEFTLOWERARM;
			text = "\X39_MS2_Resources\UI\MedicalUI\BodyPart_LeftLowerArm.paa";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.410148 * safezoneH + safezoneY;
			w = 0.0530729 * safezoneW;
			h = 0.146593 * safezoneH;
		};
		class img_leftLowerLeg: RscPicture
		{
			idc = IDC_MEDICALUI_IMG_LEFTLOWERLEG;
			text = "\X39_MS2_Resources\UI\MedicalUI\BodyPart_LeftLowerLeg.paa";
			x = 0.466979 * safezoneW + safezoneX;
			y = 0.66037 * safezoneH + safezoneY;
			w = 0.0283854 * safezoneW;
			h = 0.113371 * safezoneH;
		};
		class img_leftUpperArm: RscPicture
		{
			idc = IDC_MEDICALUI_IMG_LEFTUPPERARM;
			text = "\X39_MS2_Resources\UI\MedicalUI\BodyPart_LeftUpperArm.paa";
			x = 0.44125 * safezoneW + safezoneX;
			y = 0.292852 * safezoneH + safezoneY;
			w = 0.0247396 * safezoneW;
			h = 0.117075 * safezoneH;
		};
		class img_leftUpperLeg: RscPicture
		{
			idc = IDC_MEDICALUI_IMG_LEFTUPPERLEG;
			text = "\X39_MS2_Resources\UI\MedicalUI\BodyPart_LeftUpperLeg.paa";
			x = 0.461823 * safezoneW + safezoneX;
			y = 0.552113 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.110814 * safezoneH;
		};
		class img_lowerBody: RscPicture
		{
			idc = IDC_MEDICALUI_IMG_LOWERBODY;
			text = "\X39_MS2_Resources\UI\MedicalUI\BodyPart_LowerBody.paa";
			x = 0.459739 * safezoneW + safezoneX;
			y = 0.444074 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			h = 0.109185 * safezoneH;
		};
		class img_rightLowerArm: RscPicture
		{
			idc = IDC_MEDICALUI_IMG_RIGHTLOWERARM;
			text = "\X39_MS2_Resources\UI\MedicalUI\BodyPart_RightLowerArm.paa";
			x = 0.533541 * safezoneW + safezoneX;
			y = 0.410148 * safezoneH + safezoneY;
			w = 0.0535937 * safezoneW;
			h = 0.146704 * safezoneH;
		};
		class img_rightLowerLeg: RscPicture
		{
			idc = IDC_MEDICALUI_IMG_RIGHTLOWERLEG;
			text = "\X39_MS2_Resources\UI\MedicalUI\BodyPart_RightLowerLeg.paa";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.661408 * safezoneH + safezoneY;
			w = 0.0273437 * safezoneW;
			h = 0.112334 * safezoneH;
		};
		class img_rightUpperArm: RscPicture
		{
			idc = IDC_MEDICALUI_IMG_RIGHTUPPERARM;
			text = "\X39_MS2_Resources\UI\MedicalUI\BodyPart_RightUpperArm.paa";
			x = 0.533489 * safezoneW + safezoneX;
			y = 0.292852 * safezoneH + safezoneY;
			w = 0.0247395 * safezoneW;
			h = 0.121 * safezoneH;
		};
		class img_rightUpperLeg: RscPicture
		{
			idc = IDC_MEDICALUI_IMG_RIGHTUPPERLEG;
			text = "\X39_MS2_Resources\UI\MedicalUI\BodyPart_RightUpperLeg.paa";
			x = 0.501563 * safezoneW + safezoneX;
			y = 0.553482 * safezoneH + safezoneY;
			w = 0.0353646 * safezoneW;
			h = 0.107815 * safezoneH;
		};
		class img_upperBody: RscPicture
		{
			idc = IDC_MEDICALUI_IMG_UPPERBODY;
			text = "\X39_MS2_Resources\UI\MedicalUI\BodyPart_UpperBody.paa";
			x = 0.465416 * safezoneW + safezoneX;
			y = 0.269926 * safezoneH + safezoneY;
			w = 0.068177 * safezoneW;
			h = 0.175408 * safezoneH;
		};
		class btn_ToggleHealthView: RscButton
		{
			idc = IDC_MEDICALUI_BTN_TOGGLEHEALTHVIEW;
			text = "HealthView"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,1};
			colorActive[] = {1,1,1,0.5};
		};
		class btn_ToggleBloodView: RscButton
		{
			idc = IDC_MEDICALUI_BTN_TOGGLEBLOODVIEW;
			text = "BloodView"; //--- ToDo: Localize;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,1};
			colorActive[] = {1,1,1,0.5};
		};
		class img_leftFoot: RscPicture
		{
			idc = IDC_MEDICALUI_IMG_LEFTFOOT;
			text = "\X39_MS2_Resources\UI\MedicalUI\BodyPart_LeftFoot.paa";
			x = 0.473228 * safezoneW + safezoneX;
			y = 0.772222 * safezoneH + safezoneY;
			w = 0.0226562 * safezoneW;
			h = 0.0438889 * safezoneH;
		};
		class img_rightFoot: RscPicture
		{
			idc = IDC_MEDICALUI_IMG_RIGHTFOOT;
			text = "\X39_MS2_Resources\UI\MedicalUI\BodyPart_RightFoot.paa";
			x = 0.504114 * safezoneW + safezoneX;
			y = 0.774074 * safezoneH + safezoneY;
			w = 0.0231771 * safezoneW;
			h = 0.0420371 * safezoneH;
		};
		class lbtn_ActionMenuButton1: RscText
		{
			idc = IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON1;
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class lbtn_ActionMenuButton2: RscText
		{
			idc = IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON2;
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class lbtn_ActionMenuButton3: RscText
		{
			idc = IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON3;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class lbtn_ActionMenuButton4: RscText
		{
			idc = IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON4;
			x = 0.0204687 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class lbtn_ActionMenuButton5: RscText
		{
			idc = IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON5;
			x = 0.025625 * safezoneW + safezoneX;
			y = 0.049 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class lbtn_ActionMenuButton6: RscText
		{
			idc = IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON6;
			x = 0.0307812 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class lbtn_ActionMenuButton7: RscText
		{
			idc = IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON7;
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class lbtn_ActionMenuButton8: RscText
		{
			idc = IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON8;
			x = 0.0410937 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class lbtn_ActionMenuButton9: RscText
		{
			idc = IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON9;
			x = 0.04625 * safezoneW + safezoneX;
			y = 0.093 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class lbtn_ActionMenuButton10: RscText
		{
			idc = IDC_MEDICALUI_LBTN_ACTIONMENUBUTTON10;
			x = 0.0514062 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};