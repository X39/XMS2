#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Returns the first medicalAction (index) which is matching the given itemID
 *
 *	@Param1		- STRING		- ActionID
 *	@Return		- SCALAR		- Action Index, -1 if nothing was found
 *	
 *	@Author - X39
 */
private "_index";
params [["_id", "NA", [""]]];
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