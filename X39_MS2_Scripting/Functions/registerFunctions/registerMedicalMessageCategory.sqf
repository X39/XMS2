#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Creates a new entry inside of the MedcialActionArray (MAA)
 * Effect is LOCAL
 *
 *	@Param1 - STRING         - String to identify this category
 *	@Param1 - STRING/CODE    - localized string OR some code which
 *                             NEEDS to return a string
 *                             (wont be checked)
 *	@Return - SCALAR         - ID of this category
 *	@Author - X39
 */
params [
	["_pseudoId", "", [""]],
	["_name", "", ["", {}]]
];
private ["_index", "_lArr", "_rArr"];
if(!ISCODE(_name)) then
{
    _name = compile str _name;
};
_lArr = X39_MS2_var_Internal_MedicalMessagesCategories select 0;
_rArr = X39_MS2_var_Internal_MedicalMessagesCategories select 1;
_index = _lArr pushBack toUpper _pseudoId;
_rArr pushBack _name;
_index