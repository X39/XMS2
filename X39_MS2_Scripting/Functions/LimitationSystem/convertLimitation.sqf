#include "\X39_MS2_Scripting\default.hpp"
/**
 *	!FUNCTION IS NOT CALLSAFE!	
 *	LS (LimitationSystem) Function
 *	INTERNAL FUNCTION
 *	Will convert input to correct format for isAllowedToUse function
 *	
 *	@Param1	- SCALAR	- Parents LimitationClass ID
 *	@Param1	- ARRAY		- any finalArray of this function
 *	@Return	- ARRAY		- a finalArray that was converted
 *	@Author - X39
 */
private["_parent", "_lsObjects", "_lsAssignedClasses", "_finalArray", "_limitationsArray", "_workArray", "_lsObject"];
_parent = (X39_MS2_var_Internal_LimitationSystem_Classes select (_this select 0)) select 0;
_lsObjects = (X39_MS2_var_Internal_LimitationSystem_Classes select (_this select 0)) select 1;
_lsAssignedClasses = (X39_MS2_var_Internal_LimitationSystem_Classes select (_this select 0)) select 2;
_finalArray = X39_MS2_var_Internal_LimitationSystem_Classes select (_this select 1);
_limitationsArray = [];
_workArray = [];
if(_parent != -1) then
{
	_finalArray = ([_parent, _finalArray] call _fnc_scriptName);
};
if(count _finalArray > 0) then
{
	_limitationsArray = _finalArray select 0;
	_workArray = _finalArray select 1;
};
//from limitationObject structure [_limitations:ARRAY, _objectType:SCALAR, _efficency:SCALAR]
//to lsObject structure [_limitation:STRING, _efficency]
//meaning that every _limitation will get separated & the object type gets removed
{
	_lsObject = _x;
	{
		if(_x in _limitationsArray) then
		{
			//as _tempLimitationObject !POINTS! to the element in _workArray, we can use this by here
			_tempLimitationObject = _workArray select (_limitationsArray find _x);
			//---------------------ACTIVE---------------------\\
			if((_tempLimitationObject select 2) == 1) exitWith {
				if((_lsObject select 1) == 0) exitWith
				{//Ignore as current limitation is an ACTIVE one
				};
				if((_lsObject select 1) == 1) exitWith
				{//Update current limitation as new & old one are ACTIVE
					_tempLimitationObject set [2, 1];
					_tempLimitationObject set [1, (_lsObject select 2)];
				};
				//if((_lsObject select 1) == -1) exitWith
				//{//Remove access as new limitation is a DENY one
					_tempLimitationObject set [2, -1];
					_tempLimitationObject set [1, 0];
				//};
			};
			//---------------------PASSIVE---------------------\\
			if((_tempLimitationObject select 2) == 0) exitWith {
				//just simply update the limitation as current is PASSIVE (and everything overrides a passive one)
				_tempLimitationObject set [2, (_lsObject select 1)];
				_tempLimitationObject set [1, (_lsObject select 2)];
			};
			//---------------------DENY---------------------\\
			if((_tempLimitationObject select 2) == -1) exitWith {
				if((_lsObject select 1) == 1) exitWith
				{//Change limitation as old was PASSIVE and new one is ACTIVE
					_tempLimitationObject set [2, 1];
					_tempLimitationObject set [1, (_lsObject select 2)];
				};
			};
		}
		else
		{
			_index = count _limitationsArray;
			_limitationsArray set[_index, _x];
			_workArray set[_index, [_x, _lsObject select 2, _lsObject select 1]];
		};
	}forEach (_x select 0);
}forEach _lsObjects;
//Build the final result & return
_finalArray = [_limitationsArray, _workArray];
_finalArray