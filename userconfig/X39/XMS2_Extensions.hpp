/*
 *	Extensions are a simple way to enhance your XMS2 experience by using a simpleToUse interface to add new drugs (for example).
 *	Extensions are callen ONLY SERVERSIDE and will be broadcaster if needed to the client to.
 *	All extensions are callen during the postInit period and BEFORE the actual XMS2 stuff is added (but after the serverconfig has been read, see https://github.com/X39/XMS2/blob/master/X39_MS2_Scripting/Functions/postInit.sqf for more details)
 *	
 *	The following base classes are available for extensions:
 *		class extensionBase
 *		{
 *			name = "NA";		//Name of the extension
 *			author[] = {};		//Names of the authors
 *			version = "NA";		//Extension version
 *			code = "";			//Extension code (SQF), it wont receive any parameters. Please note that an extension NEEDS TO return true if it initialized successfully!
 *			serverOnly = 0;		//Should this be broadcasted to the client? 1 = yes, 0 = no
 *		};
 */