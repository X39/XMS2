#define RGBA(RED,GREEN,BLUE,ALPHA) {RED / 255, GREEN / 255, BLUE / 255, ALPHA / 255}
#define RGB(RED,GREEN,BLUE,ALPHA) {RED / 255, GREEN / 255, BLUE / 255, 1}
#define RGBAf(RED,GREEN,BLUE,ALPHA) {RED , GREEN , BLUE , ALPHA }
#define RGBf(RED,GREEN,BLUE,ALPHA) {RED , GREEN , BLUE , 1}
class CfgPatches
{
	class X39_MS2_Settings
	{
         units[] = {};
         weapons[] = {};
         requiredVersion = 1.0;
         requiredAddons[] = {};
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
				#include "\userconfig\X39\XMS2_ClientConfig.hpp"
			};
			class ServerConfig {
				class triageBase
				{
					scope = 2;						//Visibility of the triageCard entry (0 = hidden, 1 = hidden, 2 = public)
					name = "NA";					//Displayed name of the triageCard entry
					description = "NA";				//Description of the case (currently unused)
					color[] = {1, 1, 1, 1};			//Displayed color of the triageCard entry
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
				#include "\userconfig\X39\XMS2_ServerConfig.hpp"
			};
		};
	};
};