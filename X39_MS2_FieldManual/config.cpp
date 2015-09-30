class CfgPatches {
	class X39_MS2_FieldManual {
         units[] = {};
         weapons[] = {};
         requiredVersion = 1.0;
         requiredAddons[] = {"X39_MS2_Resources"};
         author = "X39|Cpt. HM Murdock";
         mail = "killerx29@gmail.com";
	};
};
class CfgHints
{
	class X39_MS2
	{
		// Topic title (displayed only in topic listbox in Field Manual)
		displayName = "X39s Medical System 2 (XMS2)";
		#include "chapter1.cpp"
	};
};