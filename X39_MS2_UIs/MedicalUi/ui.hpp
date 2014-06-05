#include "ui.defs"
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
		IGUIBack_2201,
		IGUIBack_2200,
		RscText_1000,
		RscText_1001,
		RscText_1002,
		img_TriageCard_TriageSymbol,
		img_Target_arms,
		img_Target_body,
		img_Target_legs,
		img_Target_head,
		img_Target_generic,
		img_Target_temperature,
		img_Crafting_Slot1,
		img_Crafting_Deco1,
		img_Crafting_Slot2,
		img_Crafting_Deco2,
		img_Crafting_Slot3,
		img_Crafting_Deco3,
		img_Crafting_Result,
		img_TriageCard_addCustomMessage,
		img_TriageCard_addPreDefinedMessage,
		tb_TriageCard_customMessageInput,
		lb_Items_list,
		lb_Diagnosis_Entries,
		lb_TriageCard_Entries,
		btn_TriageCard_TriageSymbol,
		btn_Crafting_AddToSlot1,
		btn_Crafting_AddToSlot2,
		btn_Crafting_AddToSlot3,
		btn_Diagnosis_performCheckUnit,
		btn_Diagnosis_addSelectedEntryToTriageCard,
		btn_TriageCard_removeSelectedEntry,
		btn_TriageCard_resetTriageCard,
		btn_Target_arms,
		btn_Target_body,
		btn_Target_legs,
		btn_Target_head,
		btn_Target_generic,
		btn_Target_temperature,
		btn_Crafting_Slot1,
		btn_Crafting_Slot2,
		btn_Crafting_Slot3,
		btn_Crafting_Result,
		btn_TriageCard_addCustomMessage,
		btn_TriageCard_addPreDefinedMessage,
		c_TriageCard_TriageStateSelection,
		c_TriageCard_preDefinedMessagesSelection,
		c_Diagnosis_checkUnitTypeSelection,
		c_TriageCard_customMessagesColorSelection,
		RscPicture_1206,
		RscText_1003,
		label_Target
	};
	class X39_MS2_MedicalUi_RscText: RscText
	{
		colorText[] = {0,0,0,1};
		colorShadow[] = {0,0,0,0.5};
		colorBackground[] = {1,1,1,1};
		sizeEx = 1.5 * GUI_GRID_H;
	};

	class X39_MS2_MedicalUi_RscButtonInvisible: RscButton
	{
		text = "";
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

	class IGUIBack_2201: IGUIBack
	{
		idc = IDC_XMS2UI_IGUIBACK_2201;
		x = 0.123594 * safezoneW + safezoneX;
		y = 0.192 * safezoneH + safezoneY;
		w = 0.7425 * safezoneW;
		h = 0.737 * safezoneH;
		colorBackground[] = {0,0,0,0.2};
	};
	class IGUIBack_2200: IGUIBack
	{
		idc = IDC_XMS2UI_IGUIBACK_2200;
		x = 0.634062 * safezoneW + safezoneX;
		y = 0.445 * safezoneH + safezoneY;
		w = 0.144375 * safezoneW;
		h = 0.022 * safezoneH;
		colorBackground[] = {0,0,0,0.2};
	};
	class RscText_1000: X39_MS2_MedicalUi_RscText
	{
		idc = IDC_XMS2UI_RSCTEXT_1000;
		text = $STR_X39_MS2_UIs_MedicalUi_RscText_1000;
		x = 0.12875 * safezoneW + safezoneX;
		y = 0.203 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.033 * safezoneH;

	};
	class RscText_1001: X39_MS2_MedicalUi_RscText
	{
		idc = IDC_XMS2UI_RSCTEXT_1001;
		text = $STR_X39_MS2_UIs_MedicalUi_RscText_1001;
		x = 0.634062 * safezoneW + safezoneX;
		y = 0.478 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.033 * safezoneH;

	};
	class RscText_1002: X39_MS2_MedicalUi_RscText
	{
		idc = IDC_XMS2UI_RSCTEXT_1002;
		text = $STR_X39_MS2_UIs_MedicalUi_RscText_1002;
		x = 0.12875 * safezoneW + safezoneX;
		y = 0.544 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.033 * safezoneH;

	};
	class img_TriageCard_TriageSymbol: RscPicture
	{
		idc = IDC_XMS2UI_IMG_TRIAGECARD_TRIAGESYMBOL;
		text = "\X39_MS2_Resources\UI\MedicalUI\TriageSymbol";
		x = 0.716563 * safezoneW + safezoneX;
		y = 0.236 * safezoneH + safezoneY;
		w = 0.0515625 * safezoneW;
		h = 0.088 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class img_Target_arms: RscPicture
	{
		idc = IDC_XMS2UI_IMG_TARGET_ARMS;
		text = "\X39_MS2_Resources\UI\MedicalUI\HumanBody_arms";
		x = 0.432917 * safezoneW + safezoneX;
		y = 0.383518 * safezoneH + safezoneY;
		w = 0.118594 * safezoneW;
		h = 0.187 * safezoneH;
	};
	class img_Target_body: RscPicture
	{
		idc = IDC_XMS2UI_IMG_TARGET_BODY;
		text = "\X39_MS2_Resources\UI\MedicalUI\HumanBody_body";
		x = 0.463906 * safezoneW + safezoneX;
		y = 0.368 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.209 * safezoneH;
	};
	class img_Target_legs: RscPicture
	{
		idc = IDC_XMS2UI_IMG_TARGET_LEGS;
		text = "\X39_MS2_Resources\UI\MedicalUI\HumanBody_legs";
		x = 0.464947 * safezoneW + safezoneX;
		y = 0.577 * safezoneH + safezoneY;
		w = 0.0541145 * safezoneW;
		h = 0.187 * safezoneH;
	};
	class img_Target_head: RscPicture
	{
		idc = IDC_XMS2UI_IMG_TARGET_HEAD;
		text = "\X39_MS2_Resources\UI\MedicalUI\HumanBody_head";
		x = 0.475262 * safezoneW + safezoneX;
		y = 0.303852 * safezoneH + safezoneY;
		w = 0.0334895 * safezoneW;
		h = 0.0641482 * safezoneH;
	};
	class img_Target_generic: RscPicture
	{
		idc = IDC_XMS2UI_IMG_TARGET_GENERIC;
		text = "\X39_MS2_Resources\UI\MedicalUI\MEDIC_WHITE";
		x = 0.561875 * safezoneW + safezoneX;
		y = 0.676 * safezoneH + safezoneY;
		w = 0.0464063 * safezoneW;
		h = 0.088 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class img_Target_temperature: RscPicture
	{
		idc = IDC_XMS2UI_IMG_TARGET_TEMPERATURE;
		text = "\X39_MS2_Resources\UI\MedicalUI\TEMPERATURE_WHITE";
		x = 0.381406 * safezoneW + safezoneX;
		y = 0.676 * safezoneH + safezoneY;
		w = 0.0464063 * safezoneW;
		h = 0.088 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class img_Crafting_Slot1: RscPicture
	{
		idc = IDC_XMS2UI_IMG_CRAFTING_SLOT1;
		text = "\X39_MS2_Resources\UI\plusButton.paa";
		x = 0.371094 * safezoneW + safezoneX;
		y = 0.797 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.121 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class img_Crafting_Deco1: RscPicture
	{
		idc = IDC_XMS2UI_IMG_CRAFTING_DECO1;
		text = "\X39_MS2_Resources\UI\plus.paa";
		x = 0.432969 * safezoneW + safezoneX;
		y = 0.797 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.121 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class img_Crafting_Slot2: RscPicture
	{
		idc = IDC_XMS2UI_IMG_CRAFTING_SLOT2;
		text = "\X39_MS2_Resources\UI\plusButton.paa";
		x = 0.494844 * safezoneW + safezoneX;
		y = 0.797 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.121 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class img_Crafting_Deco2: RscPicture
	{
		idc = IDC_XMS2UI_IMG_CRAFTING_DECO2;
		text = "\X39_MS2_Resources\UI\plus.paa";
		x = 0.556719 * safezoneW + safezoneX;
		y = 0.797 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.121 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class img_Crafting_Slot3: RscPicture
	{
		idc = IDC_XMS2UI_IMG_CRAFTING_SLOT3;
		text = "\X39_MS2_Resources\UI\plusButton.paa";
		x = 0.618594 * safezoneW + safezoneX;
		y = 0.797 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.121 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class img_Crafting_Deco3: RscPicture
	{
		idc = IDC_XMS2UI_IMG_CRAFTING_DECO3;
		text = "\X39_MS2_Resources\UI\equal.paa";
		x = 0.690781 * safezoneW + safezoneX;
		y = 0.797 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.121 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class img_Crafting_Result: RscPicture
	{
		idc = IDC_XMS2UI_IMG_CRAFTING_RESULT;
		text = "\X39_MS2_Resources\UI\plusButton.paa";
		x = 0.762969 * safezoneW + safezoneX;
		y = 0.797 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.121 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class img_TriageCard_addCustomMessage: RscPicture
	{
		idc = IDC_XMS2UI_IMG_TRIAGECARD_ADDCUSTOMMESSAGE;
		text = "\X39_MS2_Resources\UI\plusButton.paa";
		x = 0.850625 * safezoneW + safezoneX;
		y = 0.445 * safezoneH + safezoneY;
		w = 0.0103125 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class img_TriageCard_addPreDefinedMessage: RscPicture
	{
		idc = IDC_XMS2UI_IMG_TRIAGECARD_ADDPREDEFINEDMESSAGE;
		text = "\X39_MS2_Resources\UI\plusButton.paa";
		x = 0.850625 * safezoneW + safezoneX;
		y = 0.412 * safezoneH + safezoneY;
		w = 0.0103125 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class tb_TriageCard_customMessageInput: RscEdit
	{
		idc = IDC_XMS2UI_TB_TRIAGECARD_CUSTOMMESSAGEINPUT;
		x = 0.634062 * safezoneW + safezoneX;
		y = 0.445 * safezoneH + safezoneY;
		w = 0.144375 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class lb_Items_list: RscListbox
	{
		idc = IDC_XMS2UI_LB_ITEMS_LIST;
		x = 0.12875 * safezoneW + safezoneX;
		y = 0.588 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.187 * safezoneH;
	};
	class lb_Diagnosis_Entries: RscListbox
	{
		idc = IDC_XMS2UI_LB_DIAGNOSIS_ENTRIES;
		x = 0.12875 * safezoneW + safezoneX;
		y = 0.291 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.154 * safezoneH;
	};
	class lb_TriageCard_Entries: RscListbox
	{
		idc = IDC_XMS2UI_LB_TRIAGECARD_ENTRIES;
		x = 0.634062 * safezoneW + safezoneX;
		y = 0.522 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.209 * safezoneH;
	};
	class btn_TriageCard_TriageSymbol:X39_MS2_MedicalUi_RscButtonInvisible
	{
		idc = IDC_XMS2UI_BTN_TRIAGECARD_TRIAGESYMBOL;
		text = "";
		x = 0.716563 * safezoneW + safezoneX;
		y = 0.258 * safezoneH + safezoneY;
		w = 0.0515625 * safezoneW;
		h = 0.066 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class btn_Crafting_AddToSlot1: RscButton
	{
		idc = IDC_XMS2UI_BTN_CRAFTING_ADDTOSLOT1;
		text = $STR_X39_MS2_UIs_MedicalUi_btn_Crafting_AddToSlot1;
		x = 0.12875 * safezoneW + safezoneX;
		y = 0.797 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.033 * safezoneH;
	};
	class btn_Crafting_AddToSlot2: RscButton
	{
		idc = IDC_XMS2UI_BTN_CRAFTING_ADDTOSLOT2;
		text = $STR_X39_MS2_UIs_MedicalUi_btn_Crafting_AddToSlot2;
		x = 0.12875 * safezoneW + safezoneX;
		y = 0.841 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.033 * safezoneH;
	};
	class btn_Crafting_AddToSlot3: RscButton
	{
		idc = IDC_XMS2UI_BTN_CRAFTING_ADDTOSLOT3;
		text = $STR_X39_MS2_UIs_MedicalUi_btn_Crafting_AddToSlot3;
		x = 0.12875 * safezoneW + safezoneX;
		y = 0.885 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.033 * safezoneH;
	};
	class btn_Diagnosis_performCheckUnit: RscButton
	{
		idc = IDC_XMS2UI_BTN_DIAGNOSIS_PERFORMCHECKUNIT;
		text = $STR_X39_MS2_UIs_MedicalUi_btn_Diagnosis_performCheckUnit;
		x = 0.12875 * safezoneW + safezoneX;
		y = 0.489 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.033 * safezoneH;
	};
	class btn_Diagnosis_addSelectedEntryToTriageCard: RscButton
	{
		idc = IDC_XMS2UI_BTN_DIAGNOSIS_ADDSELECTEDENTRYTOTRIAGECARD;
		text = $STR_X39_MS2_UIs_MedicalUi_btn_Diagnosis_addSelectedEntryToTriageCard;
		x = 0.12875 * safezoneW + safezoneX;
		y = 0.247 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.033 * safezoneH;
	};
	class btn_TriageCard_removeSelectedEntry: RscButton
	{
		idc = IDC_XMS2UI_BTN_TRIAGECARD_REMOVESELECTEDENTRY;
		text = $STR_X39_MS2_UIs_MedicalUi_btn_TriageCard_removeSelectedEntry;
		x = 0.634062 * safezoneW + safezoneX;
		y = 0.742 * safezoneH + safezoneY;
		w = 0.144375 * safezoneW;
		h = 0.033 * safezoneH;
	};
	class btn_TriageCard_resetTriageCard: RscButton
	{
		idc = IDC_XMS2UI_BTN_TRIAGECARD_RESETTRIAGECARD;
		text = $STR_X39_MS2_UIs_MedicalUi_btn_TriageCard_resetTriageCard;
		x = 0.783593 * safezoneW + safezoneX;
		y = 0.742 * safezoneH + safezoneY;
		w = 0.0773437 * safezoneW;
		h = 0.033 * safezoneH;
	};
	class btn_Target_arms:X39_MS2_MedicalUi_RscButtonInvisible
	{
		idc = IDC_XMS2UI_BTN_TARGET_ARMS;
		x = 0.432969 * safezoneW + safezoneX;
		y = 0.379 * safezoneH + safezoneY;
		w = 0.117604 * safezoneW;
		h = 0.187 * safezoneH;
	};
	class btn_Target_body:X39_MS2_MedicalUi_RscButtonInvisible
	{
		idc = IDC_XMS2UI_BTN_TARGET_BODY;
		x = 0.463906 * safezoneW + safezoneX;
		y = 0.379 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.187 * safezoneH;
	};
	class btn_Target_legs:X39_MS2_MedicalUi_RscButtonInvisible
	{
		idc = IDC_XMS2UI_BTN_TARGET_LEGS;
		x = 0.463906 * safezoneW + safezoneX;
		y = 0.566 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.198 * safezoneH;
	};
	class btn_Target_head:X39_MS2_MedicalUi_RscButtonInvisible
	{
		idc = IDC_XMS2UI_BTN_TARGET_HEAD;
		x = 0.474219 * safezoneW + safezoneX;
		y = 0.313 * safezoneH + safezoneY;
		w = 0.0360937 * safezoneW;
		h = 0.066 * safezoneH;
	};
	class btn_Target_generic:X39_MS2_MedicalUi_RscButtonInvisible
	{
		idc = IDC_XMS2UI_BTN_TARGET_GENERIC;
		x = 0.561875 * safezoneW + safezoneX;
		y = 0.676 * safezoneH + safezoneY;
		w = 0.0464063 * safezoneW;
		h = 0.088 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class btn_Target_temperature:X39_MS2_MedicalUi_RscButtonInvisible
	{
		idc = IDC_XMS2UI_BTN_TARGET_TEMPERATURE;
		x = 0.381406 * safezoneW + safezoneX;
		y = 0.676 * safezoneH + safezoneY;
		w = 0.0464063 * safezoneW;
		h = 0.088 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class btn_Crafting_Slot1:X39_MS2_MedicalUi_RscButtonInvisible
	{
		idc = IDC_XMS2UI_BTN_CRAFTING_SLOT1;
		x = 0.371094 * safezoneW + safezoneX;
		y = 0.797 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.121 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class btn_Crafting_Slot2:X39_MS2_MedicalUi_RscButtonInvisible
	{
		idc = IDC_XMS2UI_BTN_CRAFTING_SLOT2;
		x = 0.494844 * safezoneW + safezoneX;
		y = 0.797 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.121 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class btn_Crafting_Slot3:X39_MS2_MedicalUi_RscButtonInvisible
	{
		idc = IDC_XMS2UI_BTN_CRAFTING_SLOT3;
		x = 0.618594 * safezoneW + safezoneX;
		y = 0.797 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.121 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class btn_Crafting_Result:X39_MS2_MedicalUi_RscButtonInvisible
	{
		idc = IDC_XMS2UI_BTN_CRAFTING_RESULT;
		x = 0.762969 * safezoneW + safezoneX;
		y = 0.797 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.121 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class btn_TriageCard_addCustomMessage: X39_MS2_MedicalUi_RscButtonInvisible
	{
		idc = IDC_XMS2UI_BTN_TRIAGECARD_ADDCUSTOMMESSAGE;
		x = 0.850625 * safezoneW + safezoneX;
		y = 0.445 * safezoneH + safezoneY;
		w = 0.0103125 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class btn_TriageCard_addPreDefinedMessage: X39_MS2_MedicalUi_RscButtonInvisible
	{
		idc = IDC_XMS2UI_BTN_TRIAGECARD_ADDPREDEFINEDMESSAGE;
		x = 0.850625 * safezoneW + safezoneX;
		y = 0.412 * safezoneH + safezoneY;
		w = 0.0103125 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class c_TriageCard_TriageStateSelection: RscCombo
	{
		idc = IDC_XMS2UI_C_TRIAGECARD_TRIAGESTATESELECTION;
		x = 0.685625 * safezoneW + safezoneX;
		y = 0.335 * safezoneH + safezoneY;
		w = 0.113437 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class c_TriageCard_preDefinedMessagesSelection: RscCombo
	{
		idc = IDC_XMS2UI_C_TRIAGECARD_PREDEFINEDMESSAGESSELECTION;
		x = 0.634062 * safezoneW + safezoneX;
		y = 0.412 * safezoneH + safezoneY;
		w = 0.211406 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class c_Diagnosis_checkUnitTypeSelection: RscCombo
	{
		idc = IDC_XMS2UI_C_DIAGNOSIS_CHECKUNITTYPESELECTION;
		x = 0.12875 * safezoneW + safezoneX;
		y = 0.456 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class c_TriageCard_customMessagesColorSelection: RscCombo
	{
		idc = IDC_XMS2UI_C_TRIAGECARD_CUSTOMMESSAGESCOLORSELECTION;
		x = 0.783594 * safezoneW + safezoneX;
		y = 0.445 * safezoneH + safezoneY;
		w = 0.061875 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscPicture_1206: RscPicture
	{
		idc = IDC_XMS2UI_SELECTEDITEM;
		text = "\X39_MS2_Resources\UI\plusButton.paa";
		x = 0.37625 * safezoneW + safezoneX;
		y = 0.225 * safezoneH + safezoneY;
		w = 0.0309375 * safezoneW;
		h = 0.066 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class RscText_1003: X39_MS2_MedicalUi_RscText
	{
		idc = IDC_XMS2UI_SELECTEDITEMTEXT;
		text = $STR_X39_MS2_UIs_MedicalUi_RscText_1003;
		x = 0.407187 * safezoneW + safezoneX;
		y = 0.225 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.066 * safezoneH;
		colorBackground[] = {1,1,1,0};
		colorText[] = {1,1,1,1};
		colorShadow[] = {0,0,0,0.5};
		sizeEx = 1.5 * GUI_GRID_H;
	};
	class label_Target: X39_MS2_MedicalUi_RscText
	{
		idc = IDC_XMS2UI_LABEL_TARGET;
		text = "Target: NA";
		x = 0.123594 * safezoneW + safezoneX;
		y = 0.148 * safezoneH + safezoneY;
		w = 0.7425 * safezoneW;
		h = 0.033 * safezoneH;
	};
};