#define EXCEPTION(MESSAGE) MESSAGE
#define EXCEPTION_NOTIMPLEMENTED ((if(!isNil "_fnc_scriptName") then {_fnc_scriptName} else {""}) + " not implemented (just dummy function)")
#define EXCEPTION_INVALIDARGS "Function expected different arguments then it received";