#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	XMSTick Handler
 *	Description will not be available as this is not intended to be callen by anyone but the XMSTicker
 *	Available parent variables:
 *		_ppeDynamicBlur			- range 0 - 1 | ammount of blur over entire screen
 *		_ppeRadialBlur			- range 0 - 1 | ammount of blur (needs _ppeFocus to actually work)
 *		_ppeFocus				- range 0 - 1 | how focused the player will be (where 0 is not focused and 1 is full focus) (needs _ppeRadialBlur to actually work)
 *		_ppeFilmGrain			- range 0 - 1 | how strong the film grain effect will be (confusion)
 *		_ppeChromAberration		- range 0 - 1 | how strong the chromAberration will be (see things twice>)
 *		_ppeGreyScreen			- range 0 - 1 | 0 means normal 1 means totally grey
 *	
 *		_cfnDisableFatigue		- range 0 - n | >0 will disable fatigue
 *		_cfnForceWalk			- range 0 - n | >0 will force walk
 *	
 *	@Param1 - OBJECT - Unit
 *	@Param2 - SCALAR - HandleID
 *	@Return - NA
 */
private["_unit", "_handleID", "_effectArray"];
_unit = _this select 0;
_handleID = _this select 1;

_effectArray = _unit getVariable ["X39_MS2_var_Internal_XMSEffects", []];
_i = 0;
if(	{
		_i = _i + 1;
		if(ISSCALAR(_x)) then
		{
			false
		}
		else
		{
			_remainingLifetime = _x select 0;
			if(!alive _unit) exitWith { PRINT_INFO(format["'%1' died while XMSEffect handling was in progress" COMMA _unit]); };
			[_unit, _remainingLifetime / (_x select 1)] call (_x select 2);
			_x set [0, _remainingLifetime - 1];
			if(_remainingLifetime == 1) then
			{
				_effectArray set [_i, -1];
			}
			else
			{
				_effectArray set [_i, _x];
			};
			true
		};
	} count _effectArray > 0) then
{
	_unit setVariable["X39_MS2_var_Internal_XMSEffects", _effectArray];
};
