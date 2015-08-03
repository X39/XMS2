/*
 *	The client config contains fallback values which are required for the XLib properties system to work propper even if nothing is selected
 */
class keys {
	class Key1 {
		key = 211;
		press_ctrl = false;
		press_alt = false;
		press_shift = false;
	};
	class Key2 {
		key = 210;
		press_ctrl = false;
		press_alt = false;
		press_shift = false;
	};
};
class options {
	class Generic
	{
		ActionSystemOverride = 0;
	};
	class MedicalUi {
		class toggleFrame {
			class position {
				ToggleDrugsFrameOn[]		= {"0.0771875 * safezoneW + safezoneX",	"0.52 * safezoneH + safezoneY",		"0.0103125 * safezoneW",	"0.352 * safezoneH"};
				ToggleDrugsFrameOff[]		= {"0.282437 * safezoneW + safezoneX",	"0.52 * safezoneH + safezoneY",		"0.0103125 * safezoneW",	"0.352 * safezoneH"};
				ToggleDiagnosticFrameOn[]	= {"0.0771875 * safezoneW + safezoneX",	"0.127 * safezoneH + safezoneY",	"0.0103125 * safezoneW",	"0.352 * safezoneH"};
				ToggleDiagnosticFrameOff[]	= {"0.282437 * safezoneW + safezoneX",	"0.127 * safezoneH + safezoneY",	"0.0103125 * safezoneW",	"0.352 * safezoneH"};
				ToggleTriageCardFrameOn[]	= {"0.9125 * safezoneW + safezoneX",	"0.127 * safezoneH + safezoneY",	"0.0103125 * safezoneW",	"0.352 * safezoneH"};
				ToggleTriageCardFrameOff[]	= {"0.70725 * safezoneW + safezoneX",	"0.127 * safezoneH + safezoneY",	"0.0103125 * safezoneW",	"0.352 * safezoneH"};
				ToggleQuickActionFrameOn[]	= {"0.9125 * safezoneW + safezoneX",	"0.52 * safezoneH + safezoneY",		"0.0103125 * safezoneW",	"0.352 * safezoneH"};
				ToggleQuickActionFrameOff[]	= {"0.70725 * safezoneW + safezoneX",	"0.52 * safezoneH + safezoneY",		"0.0103125 * safezoneW",	"0.352 * safezoneH"};
			};
		};
	};
};
