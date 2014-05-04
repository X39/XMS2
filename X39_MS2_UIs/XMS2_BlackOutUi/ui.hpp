class X39_MS2_BlackOutUi {
	idd = 26484;
	onLoad = "uiNamespace setVariable['X39_MS2_var_UIs_XMS2_BlackOutUi', _this select 0];";
	onUnload = "uiNamespace setVariable['X39_MS2_var_UIs_XMS2_BlackOutUi', displayNull];";
	duration = 32000;
	fadeIn = 0;
	fadeOut = 0;
	enableSimulation = 1;
	
	controls[]=
	{
		RscPicture_1200,
		IGUIBack_2200,
		RscButton_Respawn,
		RscButton_Abort,
		RscText_TimeInfo,
		RscText_BloodInfo,
		RscText_TemperatureInfo,
		RscText_PulseInformation,
		RscText_TextInformation
	};

	class IGUIBack_2200: IGUIBack
	{
		idc = 2200;
		x = safezoneX;
		y = safezoneY;
		w = safezoneW;
		h = safezoneH;
		colorText[] = {0,0,0,1};
		colorBackground[] = {0,0,0,1};
		colorActive[] = {0,0,0,1};
	};
	class RscPicture_1200: RscPicture
	{
		idc = 1200;
		text = "\X39_MS2_Resources\UI\BlackOutUI\BlackVision.paa";
		x = safezoneX;
		y = safezoneY;
		w = safezoneW;
		h = safezoneH;
	};
	class RscButton_Respawn: RscButton
	{
		idc = 1600;
		text = $STR_X39_MS2_UIs_XMS2_Overlay_RscButton_Respawn;
		x = -0.000156274 * safezoneW + safezoneX;
		y = safezoneY;
		w = 0.108281 * safezoneW;
		h = 0.044 * safezoneH;
		colorBackground[] = {0,0,0,1};
		colorActive[] = {0.75,0.75,0.75,1};
	};
	class RscButton_Abort: RscButton
	{
		idc = 1601;
		text = $STR_X39_MS2_UIs_XMS2_Overlay_RscButton_Abort;
		x = 0.108125 * safezoneW + safezoneX;
		y = safezoneY;
		w = 0.108281 * safezoneW;
		h = 0.044 * safezoneH;
		colorBackground[] = {0,0,0,1};
		colorActive[] = {0.75,0.75,0.75,1};
	};
	class RscText_TimeInfo: RscStructuredText
	{
		idc = 1104;
		text = "TIME LEFT"; //--- ToDo: Localize;
		x = 0.381406 * safezoneW + safezoneX;
		y = safezoneY;
		w = 0.154687 * safezoneW;
		h = 0.044 * safezoneH;
		colorBackground[] = {0,0,0,1};
		colorActive[] = {0,0,0,1};
	};
	class RscText_BloodInfo: RscStructuredText
	{
		idc = 1103;
		text = "BLOOD LEFT"; //--- ToDo: Localize;
		x = 0.536094 * safezoneW + safezoneX;
		y = safezoneY;
		w = 0.154687 * safezoneW;
		h = 0.044 * safezoneH;
		colorBackground[] = {0,0,0,1};
		colorActive[] = {0,0,0,1};
	};
	class RscText_TemperatureInfo: RscStructuredText
	{
		idc = 1102;
		text = "BODY TEMPERATURE"; //--- ToDo: Localize;
		x = 0.690781 * safezoneW + safezoneX;
		y = safezoneY;
		w = 0.154687 * safezoneW;
		h = 0.044 * safezoneH;
		colorBackground[] = {0,0,0,1};
		colorActive[] = {0,0,0,1};
	};
	class RscText_PulseInformation: RscStructuredText
	{
		idc = 1101;
		text = "CURRENT PULSE"; //--- ToDo: Localize;
		x = 0.845469 * safezoneW + safezoneX;
		y = safezoneY;
		w = 0.154687 * safezoneW;
		h = 0.044 * safezoneH;
		colorBackground[] = {0,0,0,1};
		colorActive[] = {0,0,0,1};
	};
	class RscText_TextInformation: RscStructuredText
	{
		idc = 1100;
		text = "DESCRIBING TEXT"; //--- ToDo: Localize;
		x = 0.216406 * safezoneW + safezoneX;
		y = safezoneY;
		w = 0.165 * safezoneW;
		h = 0.044 * safezoneH;
		colorBackground[] = {0,0,0,1};
		colorActive[] = {0,0,0,1};
		colorText[] = {1,1,1,1};
	};
};