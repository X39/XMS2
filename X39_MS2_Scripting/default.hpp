//#ifndef PROTECTOR_DEFAULT_HPP
//#define PROTECTOR_DEFAULT_HPP
	
	#define EX_INV_ARG "Invalid Argument"
	#define EX_UNT_ARDY_INIT "Unit is already initialized"
	
	#define dISARRAY(X)		(typeName X == "ARRAY")
	#define ISBOOL(X)		(typeName X == "BOOL")
	#define ISCODE(X)		(typeName X == "CODE")
	#define ISCONFIG(X)		(typeName X == "CONFIG")
	#define ISCONTROL(X)	(typeName X == "CONTROL")
	#define ISDISPLAY(X)	(typeName X == "DISPLAY")
	#define ISGROUP(X)		(typeName X == "GROUP")
	#define ISLOCATION(X)	(typeName X == "LOCATION")
	#define ISOBJECT(X)		(typeName X == "OBJECT")
	#define ISSCALAR(X)		(typeName X == "SCALAR")
	#define ISSCRIPT(X)		(typeName X == "SCRIPT")
	#define ISSIDE(X)		(typeName X == "SIDE")
	#define ISSTRING(X)		(typeName X == "STRING")
	#define dISTEXT(X)		(typeName X == "TEXT")
	#define ISCHARP(X)		(ISSTRING(X) || {dISTEXT(X)})
	#define ISTEAM_MEMBER(X)(typeName X == "TEAM_MEMBER")
	#define ISNAMESPACE(X)	(typeName X == "NAMESPACE")
	
	#define PRINT_ERROR(TXT) diag_log format["%1|%2 ERROR: %2", diag_tickTime, time, TXT]
	#define PRINT_WARNING(TXT) diag_log format["%1|%2 WARNING: %2", diag_tickTime, time, TXT]
	#define PRINT_INFO(TXT) diag_log format["%1|%2 INFO: %2", diag_tickTime, time, TXT]
	
	#define assignValue(NAM,VAL) if(isNil NAM) then { missionNamespace setVariable [NAM, VAL]; } else { PRINT_WARNING(format["%1 is already set, JIP player?" COMMA VAL]); }
	
	#define COMMA ,
	
	#ifndef DEBUG
	#define DEBUG
	#endif

	#ifndef DEBUG
		#define DEBUG_LOG(X)
		#define DEBUG_LOG_WFn(X)
		#define DEBUG_CODE(X)
	#else
		#define DEBUG_LOG(X) diag_log (X)
		#define DEBUG_LOG_WFn(X) diag_log format["%1 - %2: %3", time, _fnc_scriptName, X]
		#define DEBUG_CODE(X) X
	#endif
	DEBUG_CODE(if(isNil "_fnc_scriptName") then { _fnc_scriptName = "nil"; });
	DEBUG_LOG(format["%3: %1 call %2" COMMA _this COMMA _fnc_scriptName COMMA time]);
	
//#endif