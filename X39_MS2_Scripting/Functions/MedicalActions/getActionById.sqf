#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Returns the first medicalAction (index) which is matching the given itemID
 *
 *	@Param1		- STRING		- ActionID
 *	@Return		- SCALAR		- Action Index, -1 if nothing was found
 *	
 *	@Author - X39|Cpt. HM Murdock
 */
private["_id", "_localizedString", "_image", "_condition", "_executionCode", "_index", "_limitationID", "_timeout"];
_id = toupper ([_this, 0,"NA", [""]] call BIS_fnc_param);
_count = (count X39_MS2_var_Internal_MedicalActions_actionArray) - 1;
_index = -1;
for "_i" from 0 to _count do
{
	scopeName "out";
	if((X39_MS2_var_Internal_MedicalActions_actionArray select _i select 0) == _id) then
	{
		_index = _i;
		breakOut "out";
	};
};
_index