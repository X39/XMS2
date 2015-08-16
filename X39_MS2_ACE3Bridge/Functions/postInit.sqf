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
	_ace_Interaction = [
		"xms2_Interaction",
		"Interactions",
		"",
		{nil},
		{[_this select 1] call X39_MS2_fnc_isUnitXms2Unit && [_this select 0] call X39_MS2_fnc_isUnitXms2Unit && !X39_MS2_var_Internal_DialogCommunication_MA_preventActions	},
		{
			X39_XLib_var_ActionDialog_Executor = _this select 1;
			X39_XLib_var_ActionDialog_Target = _this select 0;
			X39_XLib_var_ActionDialog_IsSelf = X39_XLib_var_ActionDialog_Executor == X39_XLib_var_ActionDialog_Target;
			X39_XLib_var_ActionDialog_ExecutorInVehicle = vehicle X39_XLib_var_ActionDialog_Executor != X39_XLib_var_ActionDialog_Executor;
			X39_MS2_var_Internal_DialogCommunication_MA_Caller = X39_XLib_var_ActionDialog_Executor;
			X39_MS2_var_Internal_DialogCommunication_MA_Target = X39_XLib_var_ActionDialog_Target;
			[]
		}
	] call ACE_interact_menu_fnc_createAction;
	["CAManBase", 1, ["ACE_SelfActions"], _ace_Interaction] call _recursiveAddActionToClass;
	["CAManBase", 0, ["ACE_MainActions"], _ace_Interaction] call _recursiveAddActionToClass;
	{
		_ID = format["xms2_interaction%1", _forEachIndex];
		_displayText = _x select 0;
		_image = _x select 1; if(_image == "") then {_image = "";};
		_execCode = _x select 2;
		_condition = _x select 3;
		_action = [_ID, _displayText, _image, _execCode, _condition] call ACE_interact_menu_fnc_createAction;
		["CAManBase", 1, ["ACE_SelfActions", "xms2_Interaction"], _action] call _recursiveAddActionToClass;
		["CAManBase", 0, ["ACE_MainActions", "xms2_Interaction"], _action] call _recursiveAddActionToClass;
	}foreach X39_MS2_var_Internal_XLibActionArrays;

	//Add drug usability to the limbs
	_drugBase = [
		"xms2_drugs",
		"Drugs",
		"",
		{nil},
		{[_this select 1] call X39_MS2_fnc_isUnitXms2Unit && [_this select 0] call X39_MS2_fnc_isUnitXms2Unit && !X39_MS2_var_Internal_DialogCommunication_MA_preventActions},
		{
			X39_XLib_var_ActionDialog_Executor = _this select 1;
			X39_XLib_var_ActionDialog_Target = _this select 0;
			X39_XLib_var_ActionDialog_IsSelf = X39_XLib_var_ActionDialog_Executor == X39_XLib_var_ActionDialog_Target;
			X39_XLib_var_ActionDialog_ExecutorInVehicle = vehicle X39_XLib_var_ActionDialog_Executor != X39_XLib_var_ActionDialog_Executor;
			X39_MS2_var_Internal_DialogCommunication_MA_Caller = X39_XLib_var_ActionDialog_Executor;
			X39_MS2_var_Internal_DialogCommunication_MA_Target = X39_XLib_var_ActionDialog_Target;
			[]
		}
	] call ACE_interact_menu_fnc_createAction;
	["CAManBase", 1, ["ACE_SelfActions"], _drugBase] call _recursiveAddActionToClass;
	["CAManBase", 0, ["ACE_MainActions"], _drugBase] call _recursiveAddActionToClass;
	
	//Add QuickActions to the limbs
	_quickActionBase = [
		"xms2_quickActions",
		"QuickActions",
		"",
		{nil},
		{[_this select 1] call X39_MS2_fnc_isUnitXms2Unit && [_this select 0] call X39_MS2_fnc_isUnitXms2Unit && !X39_MS2_var_Internal_DialogCommunication_MA_preventActions},
		{
			X39_XLib_var_ActionDialog_Executor = _this select 1;
			X39_XLib_var_ActionDialog_Target = _this select 0;
			X39_XLib_var_ActionDialog_IsSelf = X39_XLib_var_ActionDialog_Executor == X39_XLib_var_ActionDialog_Target;
			X39_XLib_var_ActionDialog_ExecutorInVehicle = vehicle X39_XLib_var_ActionDialog_Executor != X39_XLib_var_ActionDialog_Executor; 
			X39_MS2_var_Internal_DialogCommunication_MA_Caller = X39_XLib_var_ActionDialog_Executor;
			X39_MS2_var_Internal_DialogCommunication_MA_Target = X39_XLib_var_ActionDialog_Target;
			[]
		}
	] call ACE_interact_menu_fnc_createAction;
	["CAManBase", 1, ["ACE_SelfActions"], _quickActionBase] call _recursiveAddActionToClass;
	["CAManBase", 0, ["ACE_MainActions"], _quickActionBase] call _recursiveAddActionToClass;
	
	
	private["_ace_limb_self", "_ace_limb_other", "_limb"];
	//_limb = _x;
	////Add the hitzone to ACE3 interact_menu
	//_ace_limb = [format["xms2_limb_%1", _limb], _limb, "", {}, {true}, {
	//	X39_XLib_var_ActionDialog_Executor = _this select 1;
	//	X39_XLib_var_ActionDialog_Target = _this select 0;
	//	X39_XLib_var_ActionDialog_IsSelf = X39_XLib_var_ActionDialog_Executor == X39_XLib_var_ActionDialog_Target;
	//	X39_XLib_var_ActionDialog_ExecutorInVehicle = vehicle X39_XLib_var_ActionDialog_Executor == X39_XLib_var_ActionDialog_Executor;
	//	[]
	//}, {}, _x] call ACE_interact_menu_fnc_createAction;
	//["CAManBase", 1, ["ACE_SelfActions"], _ace_limb] call _recursiveAddActionToClass;
	//["CAManBase", 0, ["ACE_MainActions"], _ace_limb] call _recursiveAddActionToClass;
	
	//Add drug usability to the limbs
	{
		_drug = [
			format["xms2_drugs_%1", _x select 0],
			localize (_x select 1),
			_x select 2,
			compile format["[%1] call X39_MS2_fnc_MedicalUi_DrugsFrame_applyDrug", _forEachIndex],
			_x select 3,
			{}
		] call ACE_interact_menu_fnc_createAction;
		["CAManBase", 1, ["ACE_SelfActions", "xms2_drugs"], _drug] call _recursiveAddActionToClass;
		["CAManBase", 0, ["ACE_MainActions", "xms2_drugs"], _drug] call _recursiveAddActionToClass;
	} foreach X39_MS2_var_Internal_MedicalUi_RegisteredDrugs;
	
	//Add QuickActions to the limbs
	{
		_quickAction = [
			format["xms2_quickAction_%1", _forEachIndex],
			_x select 0,
			_x select 2,
			compile format["[%1, X39_MS2_var_Internal_DialogCommunication_MA_Target, X39_MS2_var_Internal_DialogCommunication_MA_Caller] call X39_MS2_fnc_MedicalUi_performQuickaction;", _forEachIndex],
			_x select 4,
			{},
			_x select 6
		] call ACE_interact_menu_fnc_createAction;
		["CAManBase", 1, ["ACE_SelfActions", "xms2_quickActions"], _quickAction] call _recursiveAddActionToClass;
		["CAManBase", 0, ["ACE_MainActions", "xms2_quickActions"], _quickAction] call _recursiveAddActionToClass;
	} foreach X39_MS2_var_Internal_MedicalUi_QuickActions;
	false
};