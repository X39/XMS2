/**
*@author [1st JTOG] flaver
*@desc This functions gets the current water level of a unit
*@params Object _unit
*@return Int
*/

//AS_TODO !!USE HERE THE EH SYSTEM!!
private ['_unit', '_water'];

_unit = _this select 0;
_water = _this select 1;

if(isNil "_unit" || isNil "_water") exitWith{0};

_unit setVariable ["X39_MS2_var_food_waterLevel", _water];