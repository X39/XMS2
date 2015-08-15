#include "\X39_MS2_Scripting\default.hpp"

private["_actionIndex"];

//Just for debug will added in the next commits
_actionIndex = ["BANDAGE"] call X39_MS2_fnc_getActionById;
if(_actionIndex == -1) exitWith {PRINT_ERROR("Cannot get Native XMS2 action 'DRINKWATER'"); false};

[
	localize "STR_X39_MS2_Scripting_QuickActions_Drink_Name!",						//Name
	parseText localize "STR_X39_MS2_Scripting_QuickActions_Drink_Description",	//Description
	"\X39_MS2_Resources\Items\Waterbottle.paa",										//ImagePath
	{//RequiredTimeCode

	},
	{//RequiredItemsCode
		("x39_xms2_waterbottle" in items (_this select 0))
	},
	{//ConditionCode

	},
	{//ExecutionCode
		hint "Just a Test"
	},
	_actionIndex
] call X39_MS2_fnc_registerQuickAction;
true
