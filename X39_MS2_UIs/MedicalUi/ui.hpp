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
	class controls {
	
	};
};