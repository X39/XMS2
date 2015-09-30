#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	XMSTick Handler
 *	Description will not be available as this is not intended to be callen by anyone but the XMSTicker
 *	Available parent variables:
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeDynamicBlur")			- range 0 - 1 | ammount of blur over entire screen
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeRadialBlur")			- range 0 - 1 | ammount of blur (needs (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFocus") to actually work)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFocus")					- range 0 - 1 | how focused the player will be (where 0 is not focused and 1 is full focus) (needs (_unit getVariable "X39_MS2_var_Internal_Ticker_ppeRadialBlur") to actually work)
 *		X39_MS2_var_Internal_Ticker(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeFilmGrain")				- range 0 - 1 | how strong the film grain effect will be (confusion)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeChromAberration")		- range 0 - 1 | how strong the chromAberration will be (see things twice>)
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_ppeGreyScreen")			- range 0 - 1 | 0 means normal 1 means totally grey
 *	
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_cfnDisableFatigue")		- range 0 - n | >0 will disable fatigue
 *		(_unit getVariable "X39_MS2_var_Internal_Ticker_cfnForceWalk")				- range 0 - n | >0 will force walk
 *	
 *	@Param1 - OBJECT - Unit
 *	@Param2 - SCALAR - HandleID
 *	@Return - NA
 */
MT_START
_this spawn {
	private["_unit", "_handleID","_value"];
	DEBUG_CODE(;_fnc_scriptName = "X39_MS2_fnc_publishTick");
	_unit = _this select 0;
	//_handleID = _this select 1;

	_lastValues = _unit getVariable["X39_MS2_var_Internal_lastValues", []];

	if(count _lastValues != count X39_MS2_var_Internal_UnitVariables) exitWith
	{
		//COPY array instead of refering to it
		_lastValues = + X39_MS2_var_Internal_UnitVariables;
		{
			_x set [1, call (_x select 1)];
			_lastValues set [_forEachIndex, _x];
		}forEach _lastValues;
		_unit setVariable["X39_MS2_var_Internal_lastValues", _lastValues, false];
	};


	{
		if(_x select 2) then
		{
			DEBUG_LOG_WFn_SC(format["Checking variable '%1' at index position '%2" COMMA _x select 0 COMMA _forEachIndex])
			if (_x select 0 != "X39_MS2_var_triageState" && _x select 0 != "X39_MS2_var_triageCard") then {
				_value = _unit getVariable (_x select 0);				
			}
			else
			{				
				_value = [] call (_x select 1);								
			};
			_compareObject = _lastValues select _forEachIndex;
			//If at any point in time the following DEBUG code will cause issues because _value is NIL, check the RPT log
			//for the variable name causing all this & make sure that ALL points where that variable is used are setted up proper!
			//NIL in _value means simply that the unit variable was set to nil at some point
			//The issue itself is NOT supposed to be fixed! The publishTick was written like this so it is possible to discover variable issues fast and simple!
			DEBUG_LOG_WFn_SC(format["Comparing value '%1' against '%2'" COMMA _value COMMA _compareObject select 1])
			if(ISBOOL(_value)) then
			{
				_boolNew = _compareObject select 1;
				if(!(_value && _boolNew || !_value && !_boolNew)) then
				{
					_unit setVariable[_x select 0, _value, true];
					_compareObject set[1, _value];
					_lastValues set[_forEachIndex, _compareObject];
				};
			}
			else
			{
				if(dISARRAY(_value)) then
				{
					if(str _value != str (_compareObject select 1)) then
					{
						_unit setVariable[_x select 0, _value, true];
						_compareObject set[1, _value];
						_lastValues set[_forEachIndex, _compareObject];
						DEBUG_LOG_WFn_SC(format["Value changed for '%1'! Published new value:'%2'" COMMA _x select 0 COMMA _value])
					};
				}
				else
				{
					if(_value != _compareObject select 1) then
					{
						_unit setVariable[_x select 0, _value, true];
						_compareObject set[1, _value];
						_lastValues set[_forEachIndex, _compareObject];
						DEBUG_LOG_WFn_SC(format["Value changed for '%1'! Published new value:'%2'" COMMA _x select 0 COMMA _value])
					};
				};
			};
		};
	}forEach X39_MS2_var_Internal_UnitVariables;


	_unit setVariable["X39_MS2_var_Internal_lastValues", _lastValues, false];
};
MT_END
MT_DEBUG(_times pushBack [_fnc_scriptName COMMA MT_TIME])