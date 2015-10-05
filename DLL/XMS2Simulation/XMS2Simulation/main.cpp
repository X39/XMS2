
#if defined(_DEBUG_) || defined(_RELEASE_)
#define _OUTPUTSIZE_ 8000
#define EXPECT(EXPECTED, VALUE)if (strcmp(EXPECTED, VALUE) != 0) cout << "\tERROR! Expected:" << EXPECTED << "\tGot:" << VALUE << endl; else cout << "\tPASSED WITH:" << VALUE << endl
#define MT_START(VAR) VAR = omp_get_wtime()
#define MT_END(VAR) VAR = omp_get_wtime() - VAR; cout << fixed << "\t" << VAR * 1000 << "ms"


#include "dllMain.h"
#include <iostream>
#include <omp.h>
#include "map.h"
#include "sqfParser\Base.h"
#include "sqfParser\String.h"
#include "string.h"
using namespace std;

void main()
{
	char output[_OUTPUTSIZE_];
	double deltaT;
	addCommands();

	cout << "Map AccessTime" << endl;
	std::map<std::string, sqf::Base*> testMap;
	MT_START(deltaT); testMap["test"] = new sqf::String("testVal"); MT_END(deltaT); cout << endl;
	MT_START(deltaT); testMap["test2"] = nullptr; MT_END(deltaT); cout << endl;
	MT_START(deltaT); testMap["test"]; MT_END(deltaT); cout << endl;
	MT_START(deltaT); testMap["test2"]; MT_END(deltaT); cout << endl;

	cout << "CreateUnit" << endl;
	MT_START(deltaT); RVExtension(output, _OUTPUTSIZE_, "[\"createUnit\",[]]"); MT_END(deltaT); EXPECT("[TRUE,\"\",0]", toUpper(output));
	cout << "DeleteUnit" << endl;
	MT_START(deltaT); RVExtension(output, _OUTPUTSIZE_, "[\"createUnit\",[]]"); MT_END(deltaT); EXPECT("[TRUE,\"\",1]", toUpper(output));
	MT_START(deltaT); RVExtension(output, _OUTPUTSIZE_, "[\"deleteUnit\",[1]]"); MT_END(deltaT); EXPECT("[TRUE,\"\",NIL]", toUpper(output));
	cout << "SetValue" << endl;
	MT_START(deltaT); RVExtension(output, _OUTPUTSIZE_, "[\"createUnit\",[]]"); MT_END(deltaT); EXPECT("[TRUE,\"\",1]", toUpper(output));
	MT_START(deltaT); RVExtension(output, _OUTPUTSIZE_, "[\"setValue\",[1, \"test\", \"TESTVALUE\"]]"); MT_END(deltaT); EXPECT("[TRUE,\"\",NIL]", toUpper(output));
	MT_START(deltaT); RVExtension(output, _OUTPUTSIZE_, "[\"setValue\",[-1, \"test\", \"TESTVALUE\"]]"); MT_END(deltaT); EXPECT("[TRUE,\"\",NIL]", toUpper(output));
	cout << "GetValue" << endl;
	MT_START(deltaT); RVExtension(output, _OUTPUTSIZE_, "[\"getValue\",[1, \"test\"]]"); MT_END(deltaT); EXPECT("[TRUE,\"\",\"TESTVALUE\"]", toUpper(output));
	cout << "RunSimulation" << endl;
	MT_START(deltaT); RVExtension(output, _OUTPUTSIZE_, "[\"runSimulation\",[1]]"); MT_END(deltaT); EXPECT("[TRUE,\"\",NIL]", toUpper(output));
	system("PAUSE");
}

#endif