#include "\X39_MS2_Scripting\default.hpp"
/*
 *	THIS FUNCTION IS NOT INTENDED TO BE CALLEN BY ANY USERSCRIPT!
 *	
 *	@Param1		-	BOOL	-	EvaluationResult
 *	@Param2		-	OBJECT	-	caller
 *	@Param3		-	OBJECT	-	target
 *	@Param4		-	ARRAY
 *	@Param4.1	-	OBJECT	-	Caller
 *	@Param4.2	-	OBJECT	-	Target
 *	@Param4.3	-	SCALAR	-	Efficiency
 *	@Param4.4	-	SCALAR	-	DrugIndex
 *	@Return		-	NA
 *	
 *	@Author - X39
 */
FORCELOCAL(_this select 2);
private["_drug"];
_drug = X39_MS2_var_Internal_MedicalUi_RegisteredDrugs select (_this select 3 select 3);
DEBUG_LOG_WFn_SC(format["Executing drug with drugID '%1'" COMMA _drug select 0])
if(_this select 0) then
{
	(_this select 3) call (_drug select 5);
}
else
{
	(_this select 3) call (_drug select 6);
};