#include "\X39_MS2_Scripting\default.hpp"
["STR_X39_MS2_Scripting_MedicalMessages_Respiration_NotBreathing",	[0, 1, 1, 1],		{([_this] call X39_MS2_fnc_getArrestPresent) || ([_this] call X39_MS2_fnc_getToungeBlocking)}, 0] call X39_MS2_fnc_registerMedicalMessage;
["STR_X39_MS2_Scripting_MedicalMessages_Respiration_ToungeBlocks",	[0, 1, 1, 1],		{[_this] call X39_MS2_fnc_getToungeBlocking}, 1] call X39_MS2_fnc_registerMedicalMessage;
true
