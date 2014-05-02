#define GUI_GRID_H (safezoneH * 0.0165)
class X39_MS2_MedicalUi {
	idd = 26485;
	onLoad = "uiNamespace setVariable['X39_MS2_var_UIs_MedicalUi', _this select 0];";
	onUnload = "uiNamespace setVariable['X39_MS2_var_UIs_MedicalUi', displayNull];";
	duration = 32000;
	fadeIn = 0;
	fadeOut = 0;
	enableSimulation = 1;
	controls[]=
	{
		IGUIBack_2202,
		RscText_1000,
		RscText_1001,
		RscText_1002,
		RscPicture_1200,
		RscPicture_1201,
		RscPicture_1202,
		RscPicture_1203,
		RscPicture_1204,
		RscPicture_1205,
		RscPicture_1207,
		RscButton_1600,
		RscButton_1601,
		RscButton_1602,
		RscButton_1603,
		RscButton_1604,
		RscButton_1605,
		RscButton_1607,
		RscEdit_1400,
		RscListbox_1500,	//Treatment options
		RscListbox_1501,	//Diagnosis entries (CheckUnit fills it)
		RscListbox_1502,	//TriageCard entries
		RscButton_1610,		//CheckUnit
		RscButton_1611,		//AddSelectedToTriageCard
		RscButton_1612,		//ApplyTriageCardChanges
		RscButton_1613,		//+ (AddToTriageCard)
		RscButton_1614,		//RemoveSelectedFromTriageCard
		RscButton_1615,		//ClearTriageCard
		RscCombo_2100,		//TriageCard add entry
		RscCombo_2101		//TriageCard Status
	};

	class IGUIBack_2202: IGUIBack
	{
		idc = 2202;
		x = 0.118438 * safezoneW + safezoneX;
		y = 0.225 * safezoneH + safezoneY;
		w = 0.752813 * safezoneW;
		h = 0.55 * safezoneH;
	};
	class RscText_1000: RscText
	{
		idc = 1000;
		text = $STR_X39_MS2_UIs_MedicalUi_RscText_1000;
		x = 0.12875 * safezoneW + safezoneX;
		y = 0.247 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.033 * safezoneH;
		colorText[] = {0,0,0,1};
		colorShadow[] = {0,0,0,0.5};
		colorBackground[] = {1,1,1,1};
		sizeEx = 1.5 * GUI_GRID_H;
	};
	class RscText_1001: RscText
	{
		idc = 1001;
		text = $STR_X39_MS2_UIs_MedicalUi_RscText_1001;
		x = 0.634062 * safezoneW + safezoneX;
		y = 0.412 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.033 * safezoneH;
		colorText[] = {0,0,0,1};
		colorShadow[] = {0,0,0,0.5};
		colorBackground[] = {1,1,1,1};
		sizeEx = 1.5 * GUI_GRID_H;
	};
	class RscText_1002: RscText
	{
		idc = 1002;
		text = $STR_X39_MS2_UIs_MedicalUi_RscText_1002;
		x = 0.12875 * safezoneW + safezoneX;
		y = 0.511 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.033 * safezoneH;
		colorText[] = {0,0,0,1};
		colorShadow[] = {0,0,0,0.5};
		colorBackground[] = {1,1,1,1};
		sizeEx = 1.5 * GUI_GRID_H;
	};
	class RscPicture_1200: RscPicture
	{
		idc = 1200;
		text = "\X39_MS2_Ressources\UI\MedicalUI\TriageSymbol";
		x = 0.634062 * safezoneW + safezoneX;
		y = 0.313 * safezoneH + safezoneY;
		w = 0.0515625 * safezoneW;
		h = 0.088 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class RscPicture_1201: RscPicture
	{
		idc = 1201;
		text = "\X39_MS2_Ressources\UI\MedicalUI\HumanBody_arms";
		x = 0.433438 * safezoneW + safezoneX;
		y = 0.316593 * safezoneH + safezoneY;
		w = 0.117604 * safezoneW;
		h = 0.187 * safezoneH;
	};
	class RscPicture_1202: RscPicture
	{
		idc = 1202;
		text = "\X39_MS2_Ressources\UI\MedicalUI\HumanBody_body";
		x = 0.463906 * safezoneW + safezoneX;
		y = 0.302 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.209 * safezoneH;
	};
	class RscPicture_1203: RscPicture
	{
		idc = 1203;
		text = "\X39_MS2_Ressources\UI\MedicalUI\HumanBody_legs";
		x = 0.463906 * safezoneW + safezoneX;
		y = 0.511 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.187 * safezoneH;
	};
	class RscPicture_1204: RscPicture
	{
		idc = 1204;
		text = "\X39_MS2_Ressources\UI\MedicalUI\HumanBody_head";
		x = 0.475417 * safezoneW + safezoneX;
		y = 0.235889 * safezoneH + safezoneY;
		w = 0.0339583 * safezoneW;
		h = 0.0658889 * safezoneH;
	};
	class RscPicture_1205: RscPicture
	{
		idc = 1205;
		text = "\X39_MS2_Ressources\UI\MedicalUI\MEDIC_WHITE";
		x = 0.561875 * safezoneW + safezoneX;
		y = 0.61 * safezoneH + safezoneY;
		w = 0.0464063 * safezoneW;
		h = 0.088 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class RscPicture_1207: RscPicture
	{
		idc = 1207;
		text = "\X39_MS2_Ressources\UI\MedicalUI\TEMPERATURE_WHITE";
		x = 0.381406 * safezoneW + safezoneX;
		y = 0.61 * safezoneH + safezoneY;
		w = 0.0464063 * safezoneW;
		h = 0.088 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class RscButton_1600: RscButton
	{
		idc = 1600;
		text = "10"; //--- ToDo: Localize;
		x = 0.634062 * safezoneW + safezoneX;
		y = 0.335 * safezoneH + safezoneY;
		w = 0.0515625 * safezoneW;
		h = 0.066 * safezoneH;
		colorText[] = {0,0,0,0};
		colorBackground[] = {0,0,0,0};
		colorActive[] = {0,0,0,0};
		colorDisabled[] = {0,0,0,0};
		colorBackgroundDisabled[] = {0,0,0,0};
		colorBackgroundActive[] = {0,0,0,0};
		colorFocused[] = {0,0,0,0};
		colorShadow[] = {0,0,0,0};
		colorBorder[] = {0,0,0,0};
	};
	class RscButton_1601: RscButton
	{
		idc = 1601;
		text = "ARMS"; //--- ToDo: Localize;
		x = 0.433438 * safezoneW + safezoneX;
		y = 0.316593 * safezoneH + safezoneY;
		w = 0.117604 * safezoneW;
		h = 0.187 * safezoneH;
		colorText[] = {0,0,0,0};
		colorBackground[] = {0,0,0,0};
		colorActive[] = {0,0,0,0};
		colorDisabled[] = {0,0,0,0};
		colorBackgroundDisabled[] = {0,0,0,0};
		colorBackgroundActive[] = {0,0,0,0};
		colorFocused[] = {0,0,0,0};
		colorShadow[] = {0,0,0,0};
		colorBorder[] = {0,0,0,0};
	};
	class RscButton_1602: RscButton
	{
		idc = 1602;
		text = "BODY"; //--- ToDo: Localize;
		x = 0.463906 * safezoneW + safezoneX;
		y = 0.302 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.209 * safezoneH;
		colorText[] = {0,0,0,0};
		colorBackground[] = {0,0,0,0};
		colorActive[] = {0,0,0,0};
		colorDisabled[] = {0,0,0,0};
		colorBackgroundDisabled[] = {0,0,0,0};
		colorBackgroundActive[] = {0,0,0,0};
		colorFocused[] = {0,0,0,0};
		colorShadow[] = {0,0,0,0};
		colorBorder[] = {0,0,0,0};
	};
	class RscButton_1603: RscButton
	{
		idc = 1603;
		text = "LEGS"; //--- ToDo: Localize;
		x = 0.463906 * safezoneW + safezoneX;
		y = 0.511 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.187 * safezoneH;
		colorText[] = {0,0,0,0};
		colorBackground[] = {0,0,0,0};
		colorActive[] = {0,0,0,0};
		colorDisabled[] = {0,0,0,0};
		colorBackgroundDisabled[] = {0,0,0,0};
		colorBackgroundActive[] = {0,0,0,0};
		colorFocused[] = {0,0,0,0};
		colorShadow[] = {0,0,0,0};
		colorBorder[] = {0,0,0,0};
	};
	class RscButton_1604: RscButton
	{
		idc = 1604;
		text = "HEAD"; //--- ToDo: Localize;
		x = 0.475417 * safezoneW + safezoneX;
		y = 0.235889 * safezoneH + safezoneY;
		w = 0.0339583 * safezoneW;
		h = 0.0658889 * safezoneH;
		colorText[] = {0,0,0,0};
		colorBackground[] = {0,0,0,0};
		colorActive[] = {0,0,0,0};
		colorDisabled[] = {0,0,0,0};
		colorBackgroundDisabled[] = {0,0,0,0};
		colorBackgroundActive[] = {0,0,0,0};
		colorFocused[] = {0,0,0,0};
		colorShadow[] = {0,0,0,0};
		colorBorder[] = {0,0,0,0};
	};
	class RscButton_1605: RscButton
	{
		idc = 1605;
		text = "GENERIC"; //--- ToDo: Localize;
		x = 0.561875 * safezoneW + safezoneX;
		y = 0.61 * safezoneH + safezoneY;
		w = 0.0464063 * safezoneW;
		h = 0.088 * safezoneH;
		colorText[] = {0,0,0,0};
		colorBackground[] = {0,0,0,0};
		colorActive[] = {0,0,0,0};
		colorDisabled[] = {0,0,0,0};
		colorBackgroundDisabled[] = {0,0,0,0};
		colorBackgroundActive[] = {0,0,0,0};
		colorFocused[] = {0,0,0,0};
		colorShadow[] = {0,0,0,0};
		colorBorder[] = {0,0,0,0};
	};
	class RscButton_1607: RscButton
	{
		idc = 1607;
		text = "TEMPERATURE"; //--- ToDo: Localize;
		x = 0.381406 * safezoneW + safezoneX;
		y = 0.61 * safezoneH + safezoneY;
		w = 0.0464063 * safezoneW;
		h = 0.088 * safezoneH;
		colorText[] = {0,0,0,0};
		colorBackground[] = {0,0,0,0};
		colorActive[] = {0,0,0,0};
		colorDisabled[] = {0,0,0,0};
		colorBackgroundDisabled[] = {0,0,0,0};
		colorBackgroundActive[] = {0,0,0,0};
		colorFocused[] = {0,0,0,0};
		colorShadow[] = {0,0,0,0};
		colorBorder[] = {0,0,0,0};
	};
	class RscEdit_1400: RscEdit
	{
		idc = 1400;
		x = 0.634062 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.195937 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscListbox_1500: RscListbox
	{
		idc = 1500;
		x = 0.12875 * safezoneW + safezoneX;
		y = 0.555 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.198 * safezoneH;
	};
	class RscListbox_1501: RscListbox
	{
		idc = 1501;
		x = 0.12875 * safezoneW + safezoneX;
		y = 0.291 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.154 * safezoneH;
	};
	class RscListbox_1502: RscListbox
	{
		idc = 1502;
		x = 0.634062 * safezoneW + safezoneX;
		y = 0.456 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.209 * safezoneH;
	};
	class RscButton_1610: RscButton
	{
		idc = 1610;
		text = $STR_X39_MS2_UIs_MedicalUi_RscButton_1610;
		x = 0.381406 * safezoneW + safezoneX;
		y = 0.72 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.033 * safezoneH;
	};
	class RscButton_1611: RscButton
	{
		idc = 1611;
		text = $STR_X39_MS2_UIs_MedicalUi_RscButton_1611;
		x = 0.12875 * safezoneW + safezoneX;
		y = 0.456 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.033 * safezoneH;
	};
	class RscButton_1612: RscButton
	{
		idc = 1612;
		text = $STR_X39_MS2_UIs_MedicalUi_RscButton_1612;
		x = 0.634062 * safezoneW + safezoneX;
		y = 0.72 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.033 * safezoneH;
	};
	class RscButton_1613: RscButton
	{
		idc = 1613;
		text = $STR_X39_MS2_UIs_MedicalUi_RscButton_1613;
		x = 0.835156 * safezoneW + safezoneX;
		y = 0.247 * safezoneH + safezoneY;
		w = 0.0257812 * safezoneW;
		h = 0.055 * safezoneH;
		sizeEx = 1.5 * GUI_GRID_H;
	};
	class RscButton_1614: RscButton
	{
		idc = 1614;
		text = $STR_X39_MS2_UIs_MedicalUi_RscButton_1614;
		x = 0.634062 * safezoneW + safezoneX;
		y = 0.676 * safezoneH + safezoneY;
		w = 0.108281 * safezoneW;
		h = 0.033 * safezoneH;
	};
	class RscButton_1615: RscButton
	{
		idc = 1615;
		text = $STR_X39_MS2_UIs_MedicalUi_RscButton_1615;
		x = 0.752656 * safezoneW + safezoneX;
		y = 0.676 * safezoneH + safezoneY;
		w = 0.108281 * safezoneW;
		h = 0.033 * safezoneH;
	};
	class RscCombo_2100: RscCombo
	{
		idc = 2100;
		x = 0.634062 * safezoneW + safezoneX;
		y = 0.247 * safezoneH + safezoneY;
		w = 0.195937 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscCombo_2101: RscCombo
	{
		idc = 2101;
		x = 0.70625 * safezoneW + safezoneX;
		y = 0.357 * safezoneH + safezoneY;
		w = 0.154687 * safezoneW;
		h = 0.022 * safezoneH;
	};

};