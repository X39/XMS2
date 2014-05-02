#include "\X39_MS2_Scripting\default.hpp"
/**
 *	handles key presses (function for KeyDown display event handler. KeyDown param description of the wiki:
 * 	Returns the control, the keyboard code and the state of Shift, Ctrl and Alt.)
 *
 *	@ParamsCount - 5
 *	@Param1 - OBJECT (Display) - N/A
 *	@Param2 - SCALAR (keycode) - N/A
 *	@Param3 - SCALAR (bool) - shift pressed
 *	@Param4 - SCALAR (bool) - ctrl pressed
 *	@Param5 - SCALAR (bool) - alt pressed
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
_i = 0;
_handled = false;
{
	scopeName "out";
	_currentKey = X39_MS2_var_Internal_Keys select _i select 0;
	if(_currentKey select 0) then
	{
		_keys = actionKeys (_currentKey select 5);
		{
			scopeName "out2";
			if(_this select 1 == _x) then {
				_this call (X39_MS2_var_Internal_Keys select _i select 1);
				_handled = true;
				breakOut "out2";
			};
		}forEach _keys;
	}
	else
	{
		if(_this select 1 == _currentKey select 1) then {
			if(((_this select 2 && _currentKey select 2) || !(_currentKey select 2)) &&
			   ((_this select 3 && _currentKey select 3) || !(_currentKey select 3)) &&
			   ((_this select 4 && _currentKey select 4) || !(_currentKey select 4))) then {
				_this call (X39_MS2_var_Internal_Keys select _i select 1);
				_handled = true;
				breakOut "out";
			};
		};
	};
	//_scriptToCall = X39_MS2_var_Internal_Keys select _i select 1;
	_i = _i + 1;
}count X39_MS2_var_Internal_Keys;
_handled