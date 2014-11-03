#include "\X39_MS2_Scripting\default.hpp"
/*
 *	THIS FUNCTION IS NOT INTENDED TO BE CALLEN BY ANY USERSCRIPT!
 *	
 *	@Param1		- STRING	- Image
 *	@Param2		- CODE		- DisplayCondition (will get the following as param: [TargetedUnit:OBJECT, SelectedHitZone:STRING])
 *	@Param2		- ARRAY	- Valid hitzones (use ["*"] for ALL hitzones)
 *	@Return		- NA
 *	
 *	@Author - X39|Cpt. HM Murdock
 */
[
	"\X39_MS2_Resources\Items\Tourniquet\Tourniquet_thumb.paa",
	{([_this select 0, _this select 1] call X39_MS2_fnc_getTournique)},
	["*"]
] call X39_MS2_fnc_registerMedicalUiStatusEffect;
[
	"\X39_MS2_Resources\UI\AterialDamage.paa",
	{([_this select 0, _this select 1] call X39_MS2_fnc_getAterialDamage)},
	["*"]
] call X39_MS2_fnc_registerMedicalUiStatusEffect;
[
	"\X39_MS2_Resources\Items\KingLT\KingLT_thumb.paa",
	{([_this select 0] call X39_MS2_fnc_getkingLt)},
	["*"]
] call X39_MS2_fnc_registerMedicalUiStatusEffect;