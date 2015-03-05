#include "\X39_MS2_Scripting\default.hpp"
/**
 *	LS (LimitationSystem) Function
 *	creates a new LimitationClass
 *
 *	@Param1 - ARRAY		- Array filled with limitationObject IDs which belong to this class
 *	@Param2 - SCALAR	- Parents limitationClass id
 *	@Return - SCALAR	- limitationClass ID
 *	@Author - X39|Cpt. HM Murdock
 */
private["_limitationObjects", "_parent", "_index", "_lsObjectCount"];
_limitationObjects = [_this, 0, [], [[]]] call BIS_fnc_param;
_parent = [_this, 1, [], [[]]] call BIS_fnc_param;
_index = count X39_MS2_var_Internal_LimitationSystem_Classes;

if(count _limitationObjects == 0 || {{!ISSCALAR(_x)}count _limitationObjects > 0}) exitWith {PRINT_ERROR("Please validate your limitationClass's Param1! (either empty or not 100% scalar array)");};
_lsObjectCount = count X39_MS2_var_Internal_LimitationSystem_Objects;
if({ ((_x >= _lsObjectCount) || (_x < 0)) }count _limitationObjects > 0) exitWith {PRINT_ERROR("Please validate your limitationClass's Param1! (not all objects are existing)");};

if(_parent < -1 || _parent >= _index) exitWith {PRINT_ERROR("Please validate your limitationClass's Param2! (parent is either not existing or self reference)");};


X39_MS2_var_Internal_LimitationSystem_Classes set [_index, [_parent, _limitationObjects, []]];
_index