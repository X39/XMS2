#include "\X39_MS2_Scripting\default.hpp"
/*
 *	Adds a new Hallucination to the list which will later then get picked and spawned
 *	Effects are LOCAL
 *
 *	@Param1 - STRING/CODE	- logic that will be called (using SPAWN) for the hallucination
 *									!MAKE SURE YOU DISABLE ANY DAMAGE COMMING FROM HOSTILE UNITS!
 *									!YOUR HANDLE NEEDS TO DESTROY ANY UNITS IT SPAWNED BEFORE THE FUNCTION ENDS!
 *									Params:
 *									 - PlayerUnit:OBJECT
 *									 - CustomArgs:ANY
 *	@Param2 - ANY				- Custom args for your logic
 *	@Param3 - SCALAR/CODE	- Chance this hallucination will be started (0.00 -> 1.00)
 *	@Param4 - STRING/CODE	- Condition that this hallucination needs before it will be fired
 *									Params:
 *									 - PlayerUnit:OBJECT
 *									 - CustomArgs:ANY
 *	@Return - NA
 */
params [
	["_logic", "", ["", {}]],
	"_customArgs"
	["_chance", -1, [0, {}]],
	["_condition", {true}, ["", {}]]
];
if(ISCHARP(_logic) && {_logic == ""}) exitWith {PRINT_ERROR("Cannot register a hallucination with empty logic")};
if(ISCHARP(_logic)) then {_logic = compile _logic;};
if(ISCHARP(_condition)) then {_logic = compile _logic;};
if(ISSCALAR(_chance) && {_chance < 0}) exitWith {PRINT_ERROR("Cannot register a hallucination with a chance < 0")};
if(ISSCALAR(_chance) && {_chance > 1}) exitWith {PRINT_ERROR("Cannot register a hallucination with a chance > 1")};
if(ISSCALAR(_chance)) then {_chance = str _chance};
_chance = compile _chance;
X39_MS2_var_Internal_Hallucinations_available pushBack [
																	_logic,
																	_customArgs,
																	_chance,
																	_condition
																];