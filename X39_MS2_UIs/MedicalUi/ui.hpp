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
		IGUIBack_2200,
		RscPicture_1201,
		RscPicture_1202,
		RscPicture_1203,
		RscPicture_1204,
		RscPicture_1205,
		RscPicture_1206,
		RscPicture_1207,
		RscPicture_1208,
		RscButton_1600,
		RscButton_1601,
		RscButton_1602,
		RscButton_1603,
		RscButton_1604,
		RscButton_1605,
		RscButton_1606,
		RscButton_1607,
		RscButton_1608,
		RscListbox_1500,
		IGUIBack_2201,
		RscStructuredText_1100,
		RscText_1000,
		RscText_1002
	};

	class IGUIBack_2200: IGUIBack
	{
		idc = 2200;
		x = 0.283437 * safezoneW + safezoneX;
		y = 0.137 * safezoneH + safezoneY;
		w = 0.433125 * safezoneW;
		h = 0.638 * safezoneH;
	};
	class RscPicture_1201: RscPicture
	{
		idc = 1201;
		text = "\X39_MS2_Ressources\UI\MedicalUI\HumanBody_arms";
		x = 0.572031 * safezoneW + safezoneX;
		y = 0.328713 * safezoneH + safezoneY;
		w = 0.118594 * safezoneW;
		h = 0.187 * safezoneH;
	};
	class RscPicture_1202: RscPicture
	{
		idc = 1202;
		text = "\X39_MS2_Ressources\UI\MedicalUI\HumanBody_body";
		x = 0.603125 * safezoneW + safezoneX;
		y = 0.313 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.209 * safezoneH;
	};
	class RscPicture_1203: RscPicture
	{
		idc = 1203;
		text = "\X39_MS2_Ressources\UI\MedicalUI\HumanBody_legs";
		x = 0.603125 * safezoneW + safezoneX;
		y = 0.522 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.187 * safezoneH;
	};
	class RscPicture_1204: RscPicture
	{
		idc = 1204;
		text = "\X39_MS2_Ressources\UI\MedicalUI\HumanBody_head";
		x = 0.614479 * safezoneW + safezoneX;
		y = 0.247 * safezoneH + safezoneY;
		w = 0.0339583 * safezoneW;
		h = 0.0658889 * safezoneH;
	};
	class RscPicture_1205: RscPicture
	{
		idc = 1205;
		text = "\X39_MS2_Ressources\UI\MedicalUI\MEDIC_WHITE";
		x = 0.665 * safezoneW + safezoneX;
		y = 0.225 * safezoneH + safezoneY;
		w = 0.0464063 * safezoneW;
		h = 0.088 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class RscPicture_1206: RscPicture
	{
		idc = 1206;
		text = "\X39_MS2_Ressources\UI\MedicalUI\HEART_ALL_FINE";
		x = 0.29375 * safezoneW + safezoneX;
		y = 0.148 * safezoneH + safezoneY;
		w = 0.0464063 * safezoneW;
		h = 0.088 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class RscPicture_1207: RscPicture
	{
		idc = 1207;
		text = "\X39_MS2_Ressources\UI\MedicalUI\TEMPERATURE_WHITE";
		x = 0.551562 * safezoneW + safezoneX;
		y = 0.225 * safezoneH + safezoneY;
		w = 0.0464063 * safezoneW;
		h = 0.088 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class RscPicture_1208: RscPicture
	{
		idc = 1208;
		text = "\X39_MS2_Ressources\UI\MedicalUI\BROKEN_ARM";
		x = 0.474219 * safezoneW + safezoneX;
		y = 0.148 * safezoneH + safezoneY;
		w = 0.0464063 * safezoneW;
		h = 0.088 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class RscButton_1600: RscButton
	{
		idc = 1600;
		text = $STR_X39_MS2_UIs_MedicalUi_RscButton_1600;
		x = 0.572187 * safezoneW + safezoneX;
		y = 0.72 * safezoneH + safezoneY;
		w = 0.118594 * safezoneW;
		h = 0.033 * safezoneH;
	};
	class RscButton_1601: RscButton
	{
		idc = 1601;
		x = 0.572031 * safezoneW + safezoneX;
		y = 0.328713 * safezoneH + safezoneY;
		w = 0.118594 * safezoneW;
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
		x = 0.603125 * safezoneW + safezoneX;
		y = 0.313 * safezoneH + safezoneY;
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
		x = 0.603125 * safezoneW + safezoneX;
		y = 0.522 * safezoneH + safezoneY;
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
		x = 0.613958 * safezoneW + safezoneX;
		y = 0.247 * safezoneH + safezoneY;
		w = 0.0360937 * safezoneW;
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
	class RscButton_1605: RscButton
	{
		idc = 1605;
		x = 0.665 * safezoneW + safezoneX;
		y = 0.225 * safezoneH + safezoneY;
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
	class RscButton_1606: RscButton
	{
		idc = 1606;
		x = 0.29375 * safezoneW + safezoneX;
		y = 0.148 * safezoneH + safezoneY;
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
		x = 0.551562 * safezoneW + safezoneX;
		y = 0.225 * safezoneH + safezoneY;
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
	class RscButton_1608: RscButton
	{
		idc = 1608;
		x = 0.474219 * safezoneW + safezoneX;
		y = 0.148 * safezoneH + safezoneY;
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
	class RscListbox_1500: RscListbox
	{
		idc = 1500;
		x = 0.29375 * safezoneW + safezoneX;
		y = 0.555 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.198 * safezoneH;
	};
	class IGUIBack_2201: IGUIBack
	{
		idc = 2201;
		x = 0.29375 * safezoneW + safezoneX;
		y = 0.291 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.198 * safezoneH;
	};
	class RscStructuredText_1100: RscStructuredText
	{
		idc = 1100;
		x = 0.298906 * safezoneW + safezoneX;
		y = 0.302 * safezoneH + safezoneY;
		w = 0.216563 * safezoneW;
		h = 0.176 * safezoneH;
	};
	class RscText_1000: RscText
	{
		idc = 1000;
		text = $STR_X39_MS2_UIs_MedicalUi_RscText_1000;
		x = 0.29375 * safezoneW + safezoneX;
		y = 0.247 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.033 * safezoneH;
		colorText[] = {0,0,0,1};
		colorBackground[] = {1,1,1,1};
		sizeEx = 0.75 * (0.033 * safezoneH);
	};
	class RscText_1002: RscText
	{
		idc = 1002;
		text = $STR_X39_MS2_UIs_MedicalUi_RscText_1002;
		x = 0.29375 * safezoneW + safezoneX;
		y = 0.511 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.033 * safezoneH;
		colorText[] = {0,0,0,1};
		colorBackground[] = {1,1,1,1};
		sizeEx = 0.75 * (0.033 * safezoneH);
	};
};