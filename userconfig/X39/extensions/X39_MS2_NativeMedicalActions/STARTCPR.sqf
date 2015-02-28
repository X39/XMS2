#include "\X39_MS2_Scripting\default.hpp"
[
	"STARTCPR",
	"STR_X39_MS2_Scripting_MedicalUiActions_StartCPR",
	"",
	{!([_this select 1] call X39_MS2_fnc_getCprPresent)},
	{
		[
			_this select 0,
			["ainvpknlmstpsnonwrfldnon_medic", "ainvpknlmstpsnonwrfldnon_medic0s", "ainvpknlmstpsnonwrfldnon_ainvpknlmstpsnonwrfldnon_medic"],
			["ainvpknlmstpsnonwrfldnon_medicend"],
			{
				_this = _this select 1;
				[[_this select 0, false], "X39_MS2_fnc_setCprPresent", _this select 0, false, true] call BIS_fnc_MP;
				[] call X39_MS2_fnc_clearProgressBarTimeout;
				X39_MS2_var_Internal_DialogCommunication_MA_preventActions = false;
				X39_XLib_var_ActionDialog_preventMenuOpening = false;
				[] call X39_MS2_fnc_clearAnimationLock;
			},
			{
				_this = _this select 1;
				[[_this select 0, true], "X39_MS2_fnc_setCprPresent", _this select 0, false, true] call BIS_fnc_MP;
				[] call X39_MS2_fnc_MedicalUi_closeDialog;
				[-1] call X39_MS2_fnc_setProgressBarTimeout;
				X39_MS2_var_Internal_DialogCommunication_MA_preventActions = true;
				X39_XLib_var_ActionDialog_preventMenuOpening = true;
				(_this select 0) playAction "MedicStart";
			},
			[_this select 0, _this select 1]
		] call X39_MS2_fnc_setAnimationLock;
	},
	"STARTCPR",
	0
] call X39_MS2_fnc_registerAction;
true
