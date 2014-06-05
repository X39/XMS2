#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	Checks if given unit is a XMS2 compmatible Unit
 *	
 *	@Param1 - OBJECT - Unit to check
 *	@Return - BOOL
 */
private["_unit", "_flag"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

if(isNull _unit) exitWith { false };
_flag = _unit getVariable ["X39_MS2_var_UnitInitialized", false];

//if(!_flag) then
//{
//	if(_unit isKindOf "car" || {_unit isKindOf "air" || {_unit isKindOf "boat"}}) then
//	{
//		_flag = true;
//	};
//};
_flag