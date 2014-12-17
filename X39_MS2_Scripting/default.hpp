//#ifndef PROTECTOR_DEFAULT_HPP
//#define PROTECTOR_DEFAULT_HPP
	
	#define EX_INV_ARG "Invalid Argument"
	#define EX_UNT_ARDY_INIT "Unit is already initialized"
	
	#define sendMessageToServer(MSGDEFINE, VALUE) if(isServer) then \
{ \
	["X39_MS2_var_Internal_Communication_ServerMessage", [MSGDEFINE, VALUE]] call X39_MS2_fnc_serverMessageSystem; \
} \
else \
{ \
	X39_MS2_var_Internal_Communication_ServerMessage = [MSGDEFINE, VALUE]; \
	publicVariableServer "X39_MS2_var_Internal_Communication_ServerMessage"; \
}
	
	#define MSG_ADDXMS2UNITTOUNITARRAY "MSG_AddXms2UnitToUnitArray"
	#define MSG_REMOVEXMS2UNITFROMUNITARRAY "MSG_RemoveXms2UnitFromUnitArray"
	
	#define displayCtrl_Overlay(X) ((uiNamespace getVariable "X39_MS2_var_UIs_XMS2_Overlay") displayCtrl (X))
	#define displayCtrl_BlackoutUI(X) ((uiNamespace getVariable "X39_MS2_var_UIs_XMS2_BlackOutUi") displayCtrl (X))
	#define displayCtrl_MedicalUi(X) ((uiNamespace getVariable "X39_MS2_var_UIs_MedicalUi") displayCtrl (X))
	#define displayCtrl_UnitSelectionUi(X) ((uiNamespace getVariable "UnitSelectionUi") displayCtrl (X))
	
	#define MEDICALUI_ANIMATIONTIME (profileNamespace getVariable ["X39_MS2_options_medicalUi_AnimationSpeed", 1])
	
	#define dISARRAY(X)		(typeName (X) == "ARRAY")
	#define ISBOOL(X)		(typeName (X) == "BOOL")
	#define ISCODE(X)		(typeName (X) == "CODE")
	#define ISCONFIG(X)		(typeName (X) == "CONFIG")
	#define ISCONTROL(X)	(typeName (X) == "CONTROL")
	#define ISDISPLAY(X)	(typeName (X) == "DISPLAY")
	#define ISGROUP(X)		(typeName (X) == "GROUP")
	#define ISLOCATION(X)	(typeName (X) == "LOCATION")
	#define ISOBJECT(X)		(typeName (X) == "OBJECT")
	#define ISSCALAR(X)		(typeName (X) == "SCALAR")
	#define ISSCRIPT(X)		(typeName (X) == "SCRIPT")
	#define ISSIDE(X)		(typeName (X) == "SIDE")
	#define ISSTRING(X)		(typeName (X) == "STRING")
	#define dISTEXT(X)		(typeName (X) == "TEXT")
	#define ISCHARP(X)		(ISSTRING(X) || dISTEXT(X))
	#define ISTEAM_MEMBER(X)(typeName (X) == "TEAM_MEMBER")
	#define ISNAMESPACE(X)	(typeName (X) == "NAMESPACE")
	
	#define FORCELOCAL(X) if(!local (X)) exitWith {[_this, _fnc_scriptName, X, false] spawn BIS_fnc_MP;}
	
	#define NOTIMPLEMENTED diag_log format["%1 is not implemented", _fnc_scriptName]; systemChat format["%1 is not implemented", _fnc_scriptName];
	
	
	#define REGION()
	#define ENDREGION()
	
	#define ROUNDBRACKEDOPEN (
	#define ROUNDBRACKEDCLOSE )
	#define COMMA ,
	#define QUOTATIONMARK "
	#define SINGLEQUOTATIONMARK '
	
	#ifndef DEBUG
		#define DEBUG
	#endif
	
	#define getFnc(PARTA, PARTB) PARTA##PARTB
	#define stringify(X) #X
	
	#define PRINT_ERROR(TXT) diag_log format["%1|%2 ERROR: %3", diag_tickTime, time, TXT]
	#define PRINT_WARNING(TXT) diag_log format["%1|%2 WARNING: %3", diag_tickTime, time, TXT]
    #define PRINT_INFO(TXT) diag_log format["%1|%2 INFO: %3", diag_tickTime, time, TXT]
	
	#ifndef DEBUG
		#define DEBUG_LOG(X)
		#define DEBUG_LOG_SC(X)
		#define DEBUG_LOG_WFn(X)
		#define DEBUG_LOG_WFn_SC(X)
		#define DEBUG_CODE(X)
		#define DEBUG_CODE_INV(X) X
		#define DEBUG_CODE_SC(X)
		#define DEBUG_CODE_INV_SC(X) X;
	
		//#define PRINT_ERROR(TXT) diag_log format["%1|%2 ERROR: %3", diag_tickTime, time, TXT]
		//#define PRINT_WARNING(TXT) diag_log format["%1|%2 WARNING: %3", diag_tickTime, time, TXT]
		//#define PRINT_INFO(TXT) diag_log format["%1|%2 INFO: %3", diag_tickTime, time, TXT]
	#else
		#define DEBUG_LOG(X) diag_log (X)
		#define DEBUG_LOG_SC(X) diag_log (X);
		#define DEBUG_LOG_WFn(X) diag_log format["%1 - %2: %3", diag_tickTime, _fnc_scriptName, X]
		#define DEBUG_LOG_WFn_SC(X) diag_log format["%1 - %2: %3", diag_tickTime, _fnc_scriptName, X];
		#define DEBUG_CODE(X) X
		#define DEBUG_CODE_INV(X)
		#define DEBUG_CODE_SC(X) X;
		#define DEBUG_CODE_INV_SC(X) X;
	
		//#define PRINT_ERROR(TXT) diag_log format["%1|%2 ERROR: %3", diag_tickTime, time, TXT]; systemChat format["%1|%2 ERROR: %3", diag_tickTime, time, TXT]
		//#define PRINT_WARNING(TXT) diag_log format["%1|%2 WARNING: %3", diag_tickTime, time, TXT]; systemChat format["%1|%2 WARNING: %3", diag_tickTime, time, TXT]
		//#define PRINT_INFO(TXT) diag_log format["%1|%2 INFO: %3", diag_tickTime, time, TXT]; systemChat format["%1|%2 INFO: %3", diag_tickTime, time, TXT]
	#endif
	#define assignValue3(NAM,VAL,NAMESPACE) DEBUG_LOG_SC(SINGLEQUOTATIONMARK defining variable NAM with value VAL SINGLEQUOTATIONMARK) if(isNil {NAMESPACE getVariable NAM}) then { NAMESPACE setVariable [NAM, VAL]; } else { PRINT_WARNING(format["%1 is already set, JIP player?" COMMA VAL]); }
	#define assignValue(NAM,VAL) assignValue3(NAM,VAL,missionNamespace)
	#ifdef ALTERNATIVEDEBUGOUTPUT
		DEBUG_CODE(if(isNil "_fnc_scriptName") then {DEBUG_LOG(str [diag_tickTime COMMA _this COMMA "%1"]);} else {DEBUG_LOG(str [diag_tickTime COMMA _this COMMA _fnc_scriptName COMMA "%1"]);});
	#else
		DEBUG_LOG(format["%3: %1 call %2" COMMA _this COMMA _fnc_scriptName COMMA diag_tickTime]);
	#endif
	
//#endif

#include "\X39_MS2_Scripting\Functions\HitZones\hitZones.hpp"