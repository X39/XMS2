/**
*@author [1st JTOG] flaver
*@desc This functions gets the current water level of a unit
*@params Object _unit
*@return Int
*/

private ['_unit', '_return'];

_unit = _this select 0;

if(isNil "_unit") exitWith{0};

_return = _unit getVariable ["X39_MS2_var_food_waterLevel", 0];

_return