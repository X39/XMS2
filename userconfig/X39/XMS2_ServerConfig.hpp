/*
 *	See
 *	http://x39software.unitedtacticalforces.de/wiki/index.php?title=XMS2_serverConfig
 *	to find out how to setup this!
 *	Available functions:
 *		RGBA(SCALAR,SCALAR,SCALAR,SCALAR)	-	Creates a color code from the input	-	  Supports range for SCALAR 1,2,3,4 from 0 - 255
 *		RGB(SCALAR,SCALAR,SCALAR)			-	Creates a color code from the input	-	  Supports range for SCALAR 1,2,3,4 from 0 - 255
 *		RGBAf(SCALAR,SCALAR,SCALAR,SCALAR)	-	Creates a color code from the input	-	  Supports range for SCALAR 1,2,3 from 0 - 1
 *		RGBf(SCALAR,SCALAR,SCALAR)			-	Creates a color code from the input	-	  Supports range for SCALAR 1,2,3 from 0 - 1
 */
class Variables
{
	
};
class TriageCard
{
	class States
	{
		//class triageCardExample:triageBase
		//{
		//	scope = 2;							//Visibility of the triageCard entry (0 = hidden, 1 = hidden, 2 = public)
		//	name = "SomeExampleName";			//Displayed name of the triageCard entry
		//	description = "DUDE NEARLY DEAD";	//Description of the case (currently unused)
		//	color[] = RGBA(255,0,255,163);		//Displayed color of the triageCard entry
		//	textColor[] = RGB(0,0,0,1);			//Text color of the triageCard entry
		//	rating = 100;						//Displayed numeric rating of the triageCard
		//};
		class NA:triageBase
		{
			name = "NA";
			description = "No injuries";
			color[] = RGBA(128,128,128,255);
			textColor[] = RGBA(255,255,255,255);
			rating = -1;
		};
		class green_minimal:triageBase
		{
			name = "Minimal";
			description = "Minor injuries";
			color[] = RGBA(0,128,0,255);
			textColor[] = RGBA(255,255,255,255);
			rating = 1;
		};
		class yellow_delayed:triageBase
		{
			name = "Delayed";
			description = "Non-life threating injuries";
			color[] = RGBA(255,255,0,255);
			textColor[] = RGBA(0,0,0,255);
			rating = 3;
		};
		class red_immediate:triageBase
		{
			name = "Immediate";
			description = "Life threating injuries";
			color[] = RGBA(255,0,0,255);
			textColor[] = RGBA(255,255,255,255);
			rating = 7;
		};
		class black_expectant:triageBase
		{
			name = "Expectant";
			description = "Pain medication only until death";
			color[] = RGBA(0,0,0,255);
			textColor[] = RGBA(255,255,255,255);
			rating = 10;
		};
	};
	class PreDefinedMessages
	{
		//class messageExample:messageBase
		//{
		//		scope = 2;								//Visibility of the triageCard entry (0 = hidden, 1 = hidden, 2 = public)
		//		name = "NA";							//Name to be displayed in selection
		//		text = "%1 has internal injuries";		//Text to be displayed in status report
		//												//Available Whitecards:
		//												//	%1 --> Will be replaced with units name
		//		color[] = RGBA(255,0,0,255);			//Color of the message (in selection and status report)
		//};
		class msg1:messageBase
		{
				scope = 2;
				name = "SomePredefinedMessage";
				text = "You can change this in the server config";
				color[] = RGBA(0,0,0,255);
		};
	};
};