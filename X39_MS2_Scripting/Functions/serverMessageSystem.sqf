#include "\X39_MS2_Scripting\default.hpp"
/*	
 *	message system server side
 *	
 *	@Param1 - ARRAY - Message array
 *	@Return - NA
 *	@Author	- X39
 */

private["_messageArray", "_messageType", "_messageValue", "_index"];
DEBUG_LOG_SC(format["%1 - %2: Received new message on server: %3" COMMA diag_tickTime COMMA "X39_MS2_var_Internal_Communication_ServerMessage" COMMA _this])
_messageArray = _this select 1;
if(!dISARRAY(_messageArray)) exitWIth {PRINT_ERROR(format["Some client sent an unknown message to server: %1" COMMA _messageArray]);};
if(count _messageArray < 2) exitWIth {PRINT_ERROR(format["Some client sent an invalid message to server: %1" COMMA _messageArray]);};
_messageType = _messageArray select 0;
_messageValue = _messageArray select 1;

switch (_messageType) do {
	case MSG_ADDXMS2UNITTOUNITARRAY: {
		DEBUG_LOG_SC(format["%1 - %2: Message: %3" COMMA diag_tickTime COMMA "X39_MS2_var_Internal_Communication_ServerMessage" COMMA MSG_ADDXMS2UNITTOUNITARRAY])
		DEBUG_LOG_SC(format["%1 - %2: Message: %3 => Before changes: [X39_MS2_var_Internal_HitPart_InitializedUnits = %4]" COMMA diag_tickTime COMMA "X39_MS2_var_Internal_Communication_ServerMessage" COMMA MSG_ADDXMS2UNITTOUNITARRAY COMMA X39_MS2_var_Internal_HitPart_InitializedUnits])
		X39_MS2_var_Internal_HitPart_InitializedUnits set[count X39_MS2_var_Internal_HitPart_InitializedUnits, _messageValue];
		DEBUG_LOG_SC(format["%1 - %2: Message: %3 => After changes: [X39_MS2_var_Internal_HitPart_InitializedUnits = %4]" COMMA diag_tickTime COMMA "X39_MS2_var_Internal_Communication_ServerMessage" COMMA MSG_ADDXMS2UNITTOUNITARRAY COMMA X39_MS2_var_Internal_HitPart_InitializedUnits])
		publicVariable "X39_MS2_var_Internal_HitPart_InitializedUnits";
	};
	case MSG_REMOVEXMS2UNITFROMUNITARRAY: {
		DEBUG_LOG_SC(format["%1 - %2: Message: %3" COMMA diag_tickTime COMMA "X39_MS2_var_Internal_Communication_ServerMessage" COMMA MSG_REMOVEXMS2UNITFROMUNITARRAY])
		_index = X39_MS2_var_Internal_HitPart_InitializedUnits find _messageValue;
		if(_index == -1) exitWith {PRINT_ERROR(format["Some client sent a unit to server which was not existing in the hitPart unit array: %1" COMMA _messageArray]);};
		DEBUG_LOG_SC(format["%1 - %2: Message: %3 => Before changes: [X39_MS2_var_Internal_HitPart_InitializedUnits = %4]" COMMA diag_tickTime COMMA "X39_MS2_var_Internal_Communication_ServerMessage" COMMA MSG_REMOVEXMS2UNITFROMUNITARRAY COMMA X39_MS2_var_Internal_HitPart_InitializedUnits])
		_messageValue removeEventHandler ["HitPart", _messageValue getVariable ["X39_MS2_var_EH_HitPart", -1]];
		_messageValue setVariable ["X39_MS2_var_EH_HitPart", -1, false];
		X39_MS2_var_Internal_HitPart_InitializedUnits set[_index, -1];
		X39_MS2_var_Internal_HitPart_InitializedUnits = X39_MS2_var_Internal_HitPart_InitializedUnits - [-1];
		DEBUG_LOG_SC(format["%1 - %2: Message: %3 => After changes: [X39_MS2_var_Internal_HitPart_InitializedUnits = %4]" COMMA diag_tickTime COMMA "X39_MS2_var_Internal_Communication_ServerMessage" COMMA MSG_REMOVEXMS2UNITFROMUNITARRAY COMMA X39_MS2_var_Internal_HitPart_InitializedUnits])
		publicVariable "X39_MS2_var_Internal_HitPart_InitializedUnits";
	};
	default { PRINT_ERROR(format["Some client sent an unknown message to server (fallback to default switch): %1" COMMA _messageArray]); };
};