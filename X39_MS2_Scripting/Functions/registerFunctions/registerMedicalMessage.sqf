#include "\X39_MS2_Scripting\default.hpp"
/*
 *    Creates a new entry inside of the MedcialActionArray (MAA)
 * Effect is LOCAL
 *
 *    @Param1 - STRING/CODE - localization string (stringtable.xml)
 *                            OR some code which NEEDS to return a
 *                            string (wont be checked)
 *    @Param2 - ARRAY       - RGBA color array
 *                            (fe.: [1,1,1,1] for white)
 *    @Param3 - CODE        - Condition when this message will be
 *                            displayed
 *    @Param4 - STRING      - At which "CheckUnit" type will this be
 *                            visible (possible values from 0 - 2)
 *    @Param5 - STRING      - Medical Message category ID (optional)
 *    @Return - SCALAR      - MAA ID
 *    @Author - X39
 */
params [
    ["_localizationString", "", ["", {}]],
    ["_colorArray", [1,1,1,1], [[]], [4]],
    ["_conditionCode", {true}, [{}]],
    ["_presentAtCheckDepth", 0, [0]],
    ["_category", "GENERIC", [""]]
];
private "_index";
_index = (X39_MS2_var_Internal_MedicalMessagesCategories select 0) find toUpper _category;
if(_index == -1) exitWith
{
    PRINT_ERROR(format["Cannot find '%1' in medical categories" COMMA toUpper _category]);
    ["Cannot find '%1' in medical categories", toUpper _category] call BIS_fnc_HALT;
};

(X39_MS2_var_Internal_MedicalMessages pushBack [
    _localizationString,  //0
    _colorArray,           //1
    _conditionCode,        //2
    _presentAtCheckDepth, //3
    _index                  //4
])