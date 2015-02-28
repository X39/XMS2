/*
 *	Extensions are a simple way to enhance your XMS2 experience by using a simpleToUse interface to add new drugs (for example).
 *	Extensions are resolved SERVERSIDE and will be broadcaster (if needed) to the client too.
 *	All extensions are called during the postInit period and BEFORE the actual XMS2 stuff is added (but after the serverconfig has been read, see https://github.com/X39/XMS2/blob/master/X39_MS2_Scripting/Functions/postInit.sqf for more details)
 *	
 *	The following base classes are available for extensions:
 *		class extensionBase
 *		{
 *			name = "NA";		//Name of the extensionPackage
 *			authors[] = {};		//Names of the authors
 *			version = "NA";		//ExtensionPackage version
 *			files[] = {};		//FULL path to different files your extension has, each file needs to return true if it passed to initialize (the package will stop being initialized if it encounters a non-true return)
 *			serverOnly = 0;		//Should this be broadcasted to the client? 1 = yes, 0 = no
 *		};
 */
#include "extensions\X39_MS2_NativeDrugs.hpp"
#include "extensions\X39_MS2_NativeInteractions.hpp"
#include "extensions\X39_MS2_NativeMedicalActions.hpp"
#include "extensions\X39_MS2_NativeMedicalMessages.hpp"
#include "extensions\X39_MS2_NativeMedicalUiStatusEffects.hpp"