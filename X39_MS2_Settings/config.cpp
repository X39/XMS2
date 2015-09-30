#define RGBA(RED,GREEN,BLUE,ALPHA) {RED / 255, GREEN / 255, BLUE / 255, ALPHA / 255}
#define RGB(RED,GREEN,BLUE,ALPHA) {RED / 255, GREEN / 255, BLUE / 255, 1}
#define RGBAf(RED,GREEN,BLUE,ALPHA) {RED , GREEN , BLUE , ALPHA }
#define RGBf(RED,GREEN,BLUE,ALPHA) {RED , GREEN , BLUE , 1}
#define RGBf(RED,GREEN,BLUE,ALPHA) {RED , GREEN , BLUE , 1}
#define ROUNDBRACKEDOPEN (
#define ROUNDBRACKEDCLOSE )
#define COMMA ,
#define QUOTATIONMARK "
#define SINGLEQUOTATIONMARK '
#define stringify(X) #X
class CfgPatches
{
	class X39_MS2_Settings
	{
         units[] = {};
         weapons[] = {};
         requiredVersion = 1.0;
         requiredAddons[] = {"X39_XLib_Core", "X39_XLib_ModProperties"};
         author = "X39|Cpt. HM Murdock";
         mail = "killerx29@gmail.com";
	};
};
class CfgSettings
{
	class X39
	{
		class XMS2
		{
			class ClientConfig
			{
				#include "\userconfig\x39\xms2_clientconfig.hpp"
			};
			class ServerConfig {
				class triageBase
				{
					scope = 2;						//Visibility of the triageCard entry (0 = hidden, 1 = hidden, 2 = public)
					name = "NA";					//Displayed name of the triageCard entry
					description = "NA";				//Description of the case (currently unused)
					color[] = {1, 1, 1, 1};			//Displayed color of the triageCard entry
					textColor[] = {0, 0, 0, 1};		//Text color of the triageCard entry
					rating = 1;						//Displayed numeric rating of the triageCard
				};
				class messageBase
				{
					scope = 2;						//Visibility of the triageCard entry (0 = hidden, 1 = hidden, 2 = public)
					name = "NA";					//Name to be displayed in selection
					text = "NA";					//Text to be displayed in status report
													//Available Whitecards:
													//	%1 --> Will be replaced with units name
					color[] = {1, 1, 1, 1};			//Color of the message (in selection and status report)
				};
				#include "\userconfig\x39\xms2_serverconfig.hpp"
			};
			class Extensions
			{
				class extensionBase
				{
					authors[] = {};		//Names of the authors
					version = "NA";		//ExtensionPackage version
					files[] = {};		//FULL path to different files your extension has, each file needs to return true if it passed to initialize (the package will stop being initialized if it encounters a non-true return)
					serverOnly = 0;		//Should this be broadcasted to the client? 1 = yes, 0 = no
					requiredExtensions[] = {};	//Extensions required for this extension to work
				};
				#include "\userconfig\x39\xms2_extensions.hpp"
			};
		};
	};
};
#include "propertiesFile.cpp"