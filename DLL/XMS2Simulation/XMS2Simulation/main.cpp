#ifdef _DEBUG

#include "Unit.h"
#include "sqfParser\Boolean.h"
#include <iostream>
using namespace std;
void main()
{
	xms2::Unit unit = xms2::Unit();
	unit.setValue("test", sqf::Boolean(false));
	cout << unit.getValue("test")->escapedString() << endl;
	system("PAUSE");
}

#endif