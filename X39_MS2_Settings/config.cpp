class CfgPatches{
	class X39_MS2_Settings{
         units[] = {};
         weapons[] = {};
         requiredVersion = 1.0;
         requiredAddons[] = {};
         author = "X39|Cpt. HM Murdock";
         mail = "killerx29@gmail.com";
	};
};
class CfgSettings {
	class X39 {
		class XMS2 {
			class ClientConfig
			{
				#include "\userconfig\X39\XMS2_ClientConfig.hpp"
			};
			class ServerConfig {
				#include "\userconfig\X39\XMS2_ServerConfig.hpp"
			};
		};
	};
};