#define HITZONE_Head##head
#define HITZONE_LeftLowerArm##leftarm
#define HITZONE_LeftFoot##leftfoot
#define HITZONE_LeftUpperArm##leftforearm
#define HITZONE_LeftLowerLeg##leftleg
#define HITZONE_LeftUpperLeg##leftupleg
#define HITZONE_RightLowerArm##rightarm
#define HITZONE_RightFoot##rightfoot
#define HITZONE_RightUpperArm##rightforearm
#define HITZONE_RightLowerLeg##rightleg
#define HITZONE_RightUpperLeg##rightupleg
#define HITZONE_LowerBody##spine1
#define HITZONE_UpperBody##spine3
#define stringify(X) #X


#define HITZONE_IndexHead			0
#define HITZONE_IndexLeftLowerArm	1
#define HITZONE_IndexLeftFoot		2
#define HITZONE_IndexLeftUpperArm	3
#define HITZONE_IndexLeftLowerLeg	4
#define HITZONE_IndexLeftUpperLeg	5
#define HITZONE_IndexRightLowerArm	6
#define HITZONE_IndexRightFoot		7
#define HITZONE_IndexRightUpperArm	8
#define HITZONE_IndexRightLowerLeg	9
#define HITZONE_IndexRightUpperLeg	10
#define HITZONE_IndexLowerBody		11
#define HITZONE_IndexUpperBody		12

#define HITZONE_NAME				0
#define HITZONE_Size				1
#define HITZONE_HasAterie			2
#define HITZONE_MedicalUiIdc		3
#define HITZONE_CommonName			4

#define getHitzoneInfo(INDEX, TYPE) (X39_MS2_var_Internal_HitZones select INDEX select TYPE)
#define getHitzoneIndexByName(HZ) (HZ call { private["_i", "_result"];\
	_result = -1;\
	for "_i" from 0 to ((count X39_MS2_var_Internal_HitZones) - 1) do\
	{\
		scopeName "currentLoop";\
		if(X39_MS2_var_Internal_HitZones select _i select HITZONE_NAME == _this) then\
		{\
			_result = _i;\
			breakOut "currentLoop";\
		};\
	};\
	_result\
})

#define MEDICALUI_ANIMATIONTIME (profileNamespace getVariable ["X39_MS2_options_medicalUi_AnimationSpeed", 1])


[] spawn {
	waitUntil {!isNil "X39_MS2_var_Initialized"};
	if(isNil "ACE_interact_menu_fnc_addActionToClass") exitWith {diag_log "ACE3Bridge of XMS2 exited, no ACE3 found";};
	_aceActionVariables = [];
	_len = count toArray "ace_interact_menu_act_";
	{
		if("ace_interact_menu_act_" == (_x select [0, _len])) then
		{
			_aceActionVariables pushBack (_x select [_len]);
		};
		false
	} count allVariables MissionNamespace;
	_recursiveAddActionToClass = {
		private ["_typename", "_arr"];
		_typename = _this select 0;
		{
			if(_x isKindOf _typename || {_x isEqualTo _typename}) then 
			{
				_arr = + _this;
				_arr set [0, _x];
				_arr call ACE_interact_menu_fnc_addActionToClass;  
			};
			false
		}count _aceActionVariables;
	};
	
	//Add XMS2 Interactions to ACE3 interact_menu
	_ace_Interaction = ["xms2_Interaction", "Interactions", "\z\ace\addons\common\UI\blank_CO.paa", {}, {true}, {
		X39_XLib_var_ActionDialog_Executor = _this select 1;
		X39_XLib_var_ActionDialog_Target = _this select 0;
		X39_XLib_var_ActionDialog_IsSelf = X39_XLib_var_ActionDialog_Executor == X39_XLib_var_ActionDialog_Target;
		X39_XLib_var_ActionDialog_ExecutorInVehicle = vehicle X39_XLib_var_ActionDialog_Executor == X39_XLib_var_ActionDialog_Executor;
		[]
	}] call ACE_interact_menu_fnc_createAction;
	["CAManBase", 1, ["ACE_SelfActions"], _ace_Interaction] call _recursiveAddActionToClass;
	["CAManBase", 0, ["ACE_MainActions"], _ace_Interaction] call _recursiveAddActionToClass;
	
	{
		_ID = format["xms2_interaction%1", _forEachIndex];
		_displayText = _x select 0;
		_image = _x select 1; if(_image == "") then {_image = "\z\ace\addons\common\UI\blank_CO.paa";};
		_execCode = _this select 2;
		_condition = _this select 3;
		_action = [_ID, _displayText, _image, _execCode, _condition] call ACE_interact_menu_fnc_createAction;
		["CAManBase", 1, ["ACE_SelfActions", "xms2_Interaction"], _action] call _recursiveAddActionToClass;
		["CAManBase", 0, ["ACE_MainActions", "xms2_Interaction"], _action] call _recursiveAddActionToClass;
	}foreach X39_MS2_var_Internal_XLibActionArrays;
	
	{
		private["_ace_limb_self", "_ace_limb_other", "_limb"];
		_limb = _x;
		//Add the hitzone to ACE3 interact_menu
		_ace_limb = [format["xms2_limb_%1", _limb], _limb, "\z\ace\addons\common\UI\blank_CO.paa", {}, {true}, {
			X39_XLib_var_ActionDialog_Executor = _this select 1;
			X39_XLib_var_ActionDialog_Target = _this select 0;
			X39_XLib_var_ActionDialog_IsSelf = X39_XLib_var_ActionDialog_Executor == X39_XLib_var_ActionDialog_Target;
			X39_XLib_var_ActionDialog_ExecutorInVehicle = vehicle X39_XLib_var_ActionDialog_Executor == X39_XLib_var_ActionDialog_Executor;
			[]
		}, [], _x] call ACE_interact_menu_fnc_createAction;
		["CAManBase", 1, ["ACE_SelfActions"], _ace_limb] call _recursiveAddActionToClass;
		["CAManBase", 0, ["ACE_MainActions"], _ace_limb] call _recursiveAddActionToClass;
		
		//Add drug usability to the limbs
		_drugBase = [format["xms2_limb_%1_drugs", _limb], "Drugs", "\z\ace\addons\common\UI\blank_CO.paa", {}, {true}] call ACE_interact_menu_fnc_createAction;
		["CAManBase", 1, ["ACE_SelfActions", format["xms2_limb_%1", _limb]], _drugBase] call _recursiveAddActionToClass;
		["CAManBase", 0, ["ACE_MainActions", format["xms2_limb_%1", _limb]], _drugBase] call _recursiveAddActionToClass;
		
		{
			_drug = [format["xms2_limb_%1_drugs_%2", _limb, _x select 0], _x select 1, if(_x select 2 == "") then {"\z\ace\addons\common\UI\blank_CO.paa"} else {_x select 2}, compile format["[%1] call X39_MS2_fnc_MedicalUi_DrugsFrame_applyDrug", _forEachIndex], _x select 3] call ACE_interact_menu_fnc_createAction;
			["CAManBase", 1, ["ACE_SelfActions", format["xms2_limb_%1", _limb], format["xms2_limb_%1_drugs", _limb]], _drug] call _recursiveAddActionToClass;
			["CAManBase", 0, ["ACE_MainActions", format["xms2_limb_%1", _limb], format["xms2_limb_%1_drugs", _limb]], _drug] call _recursiveAddActionToClass;
		} foreach X39_MS2_var_Internal_MedicalUi_RegisteredDrugs;
		
		//Add actions to the limbs
		_actionBase = [format["xms2_limb_%1_actions", _limb], "Actions", "\z\ace\addons\common\UI\blank_CO.paa", {}, {true}] call ACE_interact_menu_fnc_createAction;
		["CAManBase", 1, ["ACE_SelfActions", format["xms2_limb_%1", _limb]], _actionBase] call _recursiveAddActionToClass;
		["CAManBase", 0, ["ACE_MainActions", format["xms2_limb_%1", _limb]], _actionBase] call _recursiveAddActionToClass;
		
		{
			_action = [format["xms2_limb_%1_action_%2", _limb, _x select 0], localize (_x select 1), if(_x select 2 == "") then {"\z\ace\addons\common\UI\blank_CO.paa"} else {_x select 2}, compile format["
								if(!(X39_MS2_var_Internal_MedicalActions_actionArray select %4 select 7)) then
								{
									X39_MS2_var_Internal_DialogCommunication_MA_preventActions = true;
									X39_XLib_var_ActionDialog_preventMenuOpening = true;
								};
								_res = [] spawn {
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
										_isAllowedToUseResult = [X39_MS2_var_Internal_DialogCommunication_MA_Caller, (X39_MS2_var_Internal_MedicalActions_actionArray select %4) select 5] call X39_MS2_fnc_ls_isAllowedToUse;
										[X39_MS2_var_Internal_DialogCommunication_MA_Caller, X39_MS2_var_Internal_DialogCommunication_MA_Target, %1, _isAllowedToUseResult select 1] call (X39_MS2_var_Internal_MedicalActions_actionArray select %4 select 4);
										if(!(X39_MS2_var_Internal_MedicalActions_actionArray select %4 select 7)) then
										{
											X39_MS2_var_Internal_DialogCommunication_MA_preventActions = false;
											X39_XLib_var_ActionDialog_preventMenuOpening = false;
										};
									};
								};" , str _limb, 0, MEDICALUI_ANIMATIONTIME, _forEachIndex], compile format["([X39_MS2_var_Internal_DialogCommunication_MA_Caller, (X39_MS2_var_Internal_MedicalActions_actionArray select %1) select 5] call X39_MS2_fnc_ls_isAllowedToUse) select 0 && %2", _forEachIndex, _x select 3]] call ACE_interact_menu_fnc_createAction;
			["CAManBase", 1, ["ACE_SelfActions", format["xms2_limb_%1", _limb], format["xms2_limb_%1_actions", _limb]], _action] call _recursiveAddActionToClass;
			["CAManBase", 0, ["ACE_MainActions", format["xms2_limb_%1", _limb], format["xms2_limb_%1_actions", _limb]], _action] call _recursiveAddActionToClass;
		} foreach X39_MS2_var_Internal_MedicalActions_actionArray;
		
		//Add QuickActions to the limbs
		_quickActionBase = [format["xms2_limb_%1_quickActions", _limb], "QuickActions", "\z\ace\addons\common\UI\blank_CO.paa", {}, {true}] call ACE_interact_menu_fnc_createAction;
		["CAManBase", 1, ["ACE_SelfActions", format["xms2_limb_%1", _limb]], _quickActionBase] call _recursiveAddActionToClass;
		["CAManBase", 0, ["ACE_MainActions", format["xms2_limb_%1", _limb]], _quickActionBase] call _recursiveAddActionToClass;
		
		{
			_quickAction = [format["xms2_limb_%1_quickAction_%2", _limb, _forEachIndex], _x select 0, if(_x select 2 == "") then {"\z\ace\addons\common\UI\blank_CO.paa"} else {_x select 2}, compile format["[%1, X39_MS2_var_Internal_DialogCommunication_MA_Target, X39_MS2_var_Internal_DialogCommunication_MA_Caller] call (_quickAction select 5);", _forEachIndex, _x select 6], _x select 4] call ACE_interact_menu_fnc_createAction;
			["CAManBase", 1, ["ACE_SelfActions", format["xms2_limb_%1", _limb], format["xms2_limb_%1_quickActions", _limb]], _quickAction] call _recursiveAddActionToClass;
			["CAManBase", 0, ["ACE_MainActions", format["xms2_limb_%1", _limb], format["xms2_limb_%1_quickActions", _limb]], _quickAction] call _recursiveAddActionToClass;
		} foreach X39_MS2_var_Internal_MedicalUi_QuickActions;
		false
	} count [
		stringify(HITZONE_Head),
		stringify(HITZONE_LeftLowerArm),
		stringify(HITZONE_LeftFoot),
		stringify(HITZONE_LeftUpperArm),
		stringify(HITZONE_LeftLowerLeg),
		stringify(HITZONE_LeftUpperLeg),
		stringify(HITZONE_RightLowerArm),
		stringify(HITZONE_RightFoot),
		stringify(HITZONE_RightUpperArm),
		stringify(HITZONE_RightLowerLeg),
		stringify(HITZONE_RightUpperLeg),
		stringify(HITZONE_LowerBody),
		stringify(HITZONE_UpperBody)
	];
};