//Created to "FIX" the "SECURITY" enhancement of FUCKING BI!
//Say THX to BI that you have to roll out a new PBO each time ...
//Clients do not need it btw ...
class CfgPatches{
	class X39_MS2_Extension{
         units[] = {};
         weapons[] = {};
         requiredVersion = 1.0;
         requiredAddons[] = {};
         author = "FUCK YOU BI! STOP FUCKING LISTENING TO ACE TEAM ...";
         mail = "killerx29@gmail.com";
	};
};

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

class CfgSettings
{
	class X39
	{
		class XMS2
		{
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
				#include "\X39_MS2_Extensions\xms2_extensions.hpp"
			};
		};
	};
};