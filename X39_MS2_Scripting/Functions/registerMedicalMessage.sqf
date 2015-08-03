#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Creates a new entry inside of the MedcialActionArray (MAA)
 * Effect is LOCAL
 *
 *	@Param1		- STRING/CODE	- localization string (stringtable.xml) OR some code which NEEDS to return a string (wont be checked)
 *	@Param2		- ARRAY			- RGBA color array (fe.: [1,1,1,1] for white)
 *	@Param3		- CODE			- Condition when this message will be displayed
 *	@Return		- SCALAR		- MAA ID
 *	@Author - X39|Cpt. HM Murdock
 */
params [
	["_localizationString", "", [""]],
	["_colorArray", [1,1,1,1], [[]], [4]],
	["_conditionCode", {true}, [{}]],
	["_presentAtCheckDepth", 0, [0]],
];

(X39_MS2_var_Internal_MedicalMessages pushBack [
													_localizationString,	//0
													_colorArray,			//1
													_conditionCode,			//2
													_presentAtCheckDepth	//3
												])