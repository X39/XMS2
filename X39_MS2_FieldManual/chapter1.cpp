class Chapter1
{
	// Hint title, filled by arguments from 'arguments' param
	displayName = "Chapter1";
                // Optional hint subtitle, filled by arguments from 'arguments' param
	displayNameShort = "SomeShort?Name";
	// Structured text, filled by arguments from 'arguments' param
	description = "description Some test %0#0 %1#1 %2#2 %3#3 %4#4 %5#5 %6#6 %7#7 %8#8 %9#9 %10#10 %11#11 %12#12";
                // Optional structured text, filled by arguments from 'arguments' param (first argument
                // is %11, see notes bellow), grey color of text
    tip = "tip Some test %0#0 %1#1 %2#2 %3#3 %4#4 %5#5 %6#6 %7#7 %8#8 %9#9 %10#10 %11#11 %12#12";
	arguments[] = {
		{{"getOver"}}, // Double nested array means assigned key (will be specially formatted)
                        {"name"}, // Nested array means element (specially formatted part of text)
		"name player" // Simple string will be simply compiled and called
                                      // String is used as a link to localization database in case it starts by str_
	};
	// Optional image
	image = "\X39_MS2_Resources\logoXMS2.paa";
	// optional parameter for not showing of image in context hint in mission (default false))
	noImage = false;
};
class Chapter1_1
{
	// Hint title, filled by arguments from 'arguments' param
	displayName = "Chapter1.1";
                // Optional hint subtitle, filled by arguments from 'arguments' param
	displayNameShort = "testesttest";
	// Structured text, filled by arguments from 'arguments' param
	description = "description";
                // Optional structured text, filled by arguments from 'arguments' param (first argument
                // is %11, see notes bellow), grey color of text
    tip = "tip TEST %3%6TEST%4";
	arguments[] = {
		{{"getOver"}}, // Double nested array means assigned key (will be specially formatted)
                        {"name"}, // Nested array means element (specially formatted part of text)
		"name player" // Simple string will be simply compiled and called
                                      // String is used as a link to localization database in case it starts by str_
	};
	// Optional image
	image = "\X39_MS2_Resources\logoXMS2.paa";
	// optional parameter for not showing of image in context hint in mission (default false))
	noImage = true;
};