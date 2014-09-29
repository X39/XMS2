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
				class animationSpeed: propertyBase {
					variable = "X39_MS2_options_medicalUi_AnimationSpeed";
					display = "MedicalUI - AnimationSpeed";
					type = TYPE_VALUE;
					valueType = "SCALAR";
					description = "How long shall an animation take?<br />Set to '0' to disable animations.";
					default = 1;
				};
				class HitMenuColorType: propertyBase {
					variable = "X39_MS2_options_medicalUi_HitMenuColorType";
					display = "MedicalUI - HitZone damage color type";
					type = TYPE_COMBOBOX;
					valueType = "SCALAR";
					description = "Which color will damaged zones have in the display";
					default = 1;
					class values {
						class value1 {
							display = "GreenToRed";
							displayShort = "GreenToRed";
							value = 1;
						};
						class value2 {
							display = "WhiteToRed";
							displayShort = "WhiteToRed";
							value = 2;
						};
						class value3 {
							display = "WhiteToBlack";
							displayShort = "WhiteToBlack";
							value = 3;
						};
					};
				};
			};
		};
	};
};