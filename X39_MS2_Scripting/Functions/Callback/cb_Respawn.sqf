#include "\X39_MS2_Scripting\default.hpp"
/**
 *	handles respawns (biki: Triggered when a unit respawns)
 *
 *	@ParamsCount - 2
 *	@Param1 - OBJECT (unit) - Object the event handler is assigned to
 *	@Param2 - SCALAR (corpse) - Object the event handler was assigned to, aka the corpse/unit player was previously controlling
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_unit", "_corpse"];
_unit = _this select 0;
_corpse = _this select 1;
if((_corpse getVariable ["X39_MS2_var_EH_HandleDamage", -1]) != -1)		then { _corpse removeEventHandler["HandleDamage",		(_corpse getVariable ["X39_MS2_var_EH_HandleDamage", -1])];		};
if((_corpse getVariable ["X39_MS2_var_EH_FiredNear", -1]) != -1)		then { _corpse removeEventHandler["FiredNear",			(_corpse getVariable ["X39_MS2_var_EH_FiredNear", -1])];		};
if((_corpse getVariable ["X39_MS2_var_EH_Explosion", -1]) != -1)		then { _corpse removeEventHandler["Explosion",			(_corpse getVariable ["X39_MS2_var_EH_Explosion", -1])];		};
if((_corpse getVariable ["X39_MS2_var_EH_AnimStateChanged", -1]) != -1)	then { _corpse removeEventHandler["AnimStateChanged",	(_corpse getVariable ["X39_MS2_var_EH_AnimStateChanged", -1])];	};
if((_corpse getVariable ["X39_MS2_var_EH_Respawn", -1]) != -1)			then { _corpse removeEventHandler["Respawn",			(_corpse getVariable ["X39_MS2_var_EH_Respawn", -1])];			};

_unit setCaptive false;
X39_MS2_var_Internal_DialogCommunication_IM_preventActions = false;
X39_MS2_var_Internal_DialogCommunication_MA_preventActions = false;
X39_MS2_var_InteractionMenu_allowOpeningOfTheUi = false;
[_unit] call X39_MS2_fnc_initUnit;