#ifdef _DEBUG
#define _OUTPUTSIZE_ 8000
#define EXPECT(EXPECTED, VALUE)if (strcmp(EXPECTED, VALUE) != 0) cout << "ERROR! Expected:" << EXPECTED << "\tGot:" << VALUE << endl; else cout << "PASSED WITH:" << VALUE << endl


#include "dllMain.h"
#include <iostream>
using namespace std;

void main()
{
	char output[_OUTPUTSIZE_];
	addCommands();


	//CreateUnit
	RVExtension(output, _OUTPUTSIZE_, "[\"createUnit\",[]]"); EXPECT("[TRUE,\"\",0]", toUpper(output));
	//DeleteUnit
	RVExtension(output, _OUTPUTSIZE_, "[\"createUnit\",[]]"); EXPECT("[TRUE,\"\",1]", toUpper(output));
	RVExtension(output, _OUTPUTSIZE_, "[\"deleteUnit\",[1]]"); EXPECT("[TRUE,\"\",NIL]", toUpper(output));
	//SetValue
	RVExtension(output, _OUTPUTSIZE_, "[\"createUnit\",[]]"); EXPECT("[TRUE,\"\",1]", toUpper(output));
	RVExtension(output, _OUTPUTSIZE_, "[\"setValue\",[1, \"test\", \"TESTVALUE\"]]"); EXPECT("[TRUE,\"\",NIL]", toUpper(output));
	//GetValue
	RVExtension(output, _OUTPUTSIZE_, "[\"getValue\",[1, \"test\"]]"); EXPECT("[TRUE,\"\",\"TESTVALUE\"]", toUpper(output));
	//RunSimulation
	RVExtension(output, _OUTPUTSIZE_, "[\"runSimulation\",[1]]"); EXPECT("[TRUE,\"\",NIL]", toUpper(output));
	system("PAUSE");
}

#endif