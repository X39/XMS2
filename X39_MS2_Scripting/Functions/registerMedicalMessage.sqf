#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Creates a new entry inside of the MedcialActionArray (MAA)
 *
 *	@Param1		- STRING/CODE	- localization string (stringtable.xml) OR some code which NEEDS to return a string (wont be checked)
 *	@Param2		- ARRAY			- RGBA color array (fe.: [1,1,1,1] for white)
 *	@Param3		- CODE			- Condition when this message will be displayed
 *	@Return		- SCALAR		- MAA ID
 *	@Author - X39|Cpt. HM Murdock
 */
private["_localizationString", "_colorArray", "_conditionCode", "_index", "_presentAtCheckDepth"];
_localizationString		=	[_this, 0, "", ["", {}]]			call BIS_fnc_param;
_colorArray				=	[_this, 1, [1,1,1,1], [[]], [4]]	call BIS_fnc_param;
_conditionCode			=	[_this, 2, {true}, [{}]]			call BIS_fnc_param;
_presentAtCheckDepth	=	[_this, 4, 0, [0]]					call BIS_fnc_param;

_index = count X39_MS2_var_Internal_MedicalMessages;
X39_MS2_var_Internal_MedicalMessages set	[_index,
												[
													_localizationString,	//0
													_colorArray,			//1
													_conditionCode,			//2
													_presentAtCheckDepth	//3
												]
											];
_index