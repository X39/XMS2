 #include "\X39_XLib_ModProperties\modPropertiesIncludes.hpp"

class XLib {
	class modProperties {
		class propertyBase;
		class valueBase;
		class modBase;
		class X39_MS2: modBase {
			scope = 2;
			name = "X39s Medical System 2";
			image = "\X39_MS2_Resources\logoXMS2.paa";
			class properties {
				class key1: propertyBase {
					variable = "X39_MS2_var_Internal_Key1";
					display = "Self interaction key";
					type = TYPE_KEY;
					description = "Key for self interaction";
					default[] = {211, 0, 0, 0};
				};
				class key2: propertyBase {
					variable = "X39_MS2_var_Internal_Key2";
					display = "Others interaction key";
					type = TYPE_KEY;
					description = "Key to interact with other people";
					default[] = {210, 0, 0, 0};
				};
				class maxRedScreen: propertyBase {
					variable = "X39_MS2_options_ppEffects_colorCorrections_maxRedScreen";
					display = "ppEffects >> colorCorrections - maxRedScreen";
					type = TYPE_VALUE;
					valueType = "SCALAR";
					description = "This value limits the maximum of redscreen you can get during your gameplay sessions";
					default = 0.45;
				};
				class colorize: propertyBase {
					variable = "X39_MS2_options_ppEffects_colorCorrections_colorize";
					display = "ppEffects >> colorCorrections - colorize";
					type = TYPE_VALUE;
					valueType = "SCALAR";
					description = "Defines how colorfull your game will be";
					default = 1.5;
				};
			};
		};
	};
};