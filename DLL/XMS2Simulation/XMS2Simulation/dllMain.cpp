#include "dllMain.h"
#include "global.h"

#include "map.h"
#include "vector.h"

#include "SimulationTick.h"
#include "Unit.h"
#include "sqfParser\Command.h"



#ifdef _WIN32
#define WIN32_LEAN_AND_MEAN
#include <windows.h>


#else


#endif

static std::vector<sqf::Command*>	g_commands;
static std::vector<xms2::Unit*> g_units;
static std::map<std::string, sqf::Base*> g_globalXms2Variables;
static std::vector<xms2::SimulationTick*> g_simulations;
static int g_outputSize;

void toUpper(std::string& s)
{
	for (int i = s.length() - 1; i >= 0; i--)
		s[i] = toupper(s[i]);
}
char* toUpper(char* s)
{
	for (int i = 0; s[i] != '\0'; i++)
		s[i] = toupper(s[i]);
	return s;
}
void addCommands(void)
{
	g_commands.push_back( new sqf::Command(
			"createUnit",
			[](sqf::Array* arr, char* output, int outputSize) {
				int index = g_units.size();
				auto flag = false;
				for (int i = g_units.size() - 1; i >= 0; i--)
				{
					if (!g_units[i])
					{
						flag = true;
						g_units[i] = new xms2::Unit();
						index = i;
					}
				}
				if (!flag)
					g_units.push_back(new xms2::Unit());
				return std::string("[TRUE,\"\",").append(std::to_string(index)).append("]");
			},
			"[]",
			"Creates a new unit. Returns unit ID"
	));
	g_commands.push_back(new sqf::Command(
		"deleteUnit",
			[](sqf::Array* arr, char* output, int outputSize) {
			if (arr->length() == 0)
				return std::string("[FALSE,\"Not enough arguments provided\",").append("nil").append("]");
			sqf::Base* element =(*arr)[0];
			if (element->getType() != sqf::Type::SCALAR)
				return std::string("[FALSE,\"Invalid argument provided at arg 0\",").append("nil").append("]");
			auto index = ((sqf::Scalar*)element)->getValue();
			if (index < 0 || index >= g_units.size())
				return std::string("[FALSE,\"Invalid unit ID was provided at arg 0\",").append("nil").append("]");
			auto unit = g_units[index];
			g_units[index] = nullptr;
			delete unit;
			return std::string("[TRUE,\"\",").append("nil").append("]");
		},
		"[]",
		"Creates a new unit. Returns unit ID"
		));
	g_commands.push_back(new sqf::Command(
		"setValue",
		[](sqf::Array* arr, char* output, int outputSize) {
			if (arr->length() < 3)
				return std::string("[FALSE,\"Not enough arguments provided\",").append("nil").append("]");
			sqf::Base* element = (*arr)[0];
			if (element->getType() != sqf::Type::SCALAR)
				return std::string("[FALSE,\"Invalid argument provided at arg 0\",").append("nil").append("]");
			auto index = ((sqf::Scalar*)element)->getValue();
			if (index < -1 || index >= g_units.size())
				return std::string("[FALSE,\"Invalid ID was provided at arg 0\",").append("nil").append("]");

			element = (*arr)[1];
			if (element->getType() != sqf::Type::STRING)
				return std::string("[FALSE,\"Invalid argument provided at arg 1\",").append("nil").append("]");
			auto key = ((sqf::String*)element)->getValue();

			element = (*arr)[2];

			if (index != -1)
			{
				auto unit = g_units[index];
				unit->setValue(key, element);
				return std::string("[TRUE,\"\",").append("nil").append("]");
			}
			else
			{
				delete g_globalXms2Variables[key];
				sqf::Base* val;
				switch (element->getType())
				{
				case sqf::Type::ARRAY:
					val = new sqf::Array(*(const sqf::Array*)element);
					break;
				case sqf::Type::STRING:
					val = new sqf::String(*(const sqf::String*)element);
					break;
				case sqf::Type::SCALAR:
					val = new sqf::Scalar(*(const sqf::Scalar*)element);
					break;
				case sqf::Type::BOOLEAN:
					val = new sqf::Boolean(*(const sqf::Boolean*)element);
					break;
				case sqf::Type::NIL:
					val = new sqf::Nil(*(const sqf::Nil*)element);
					break;
				default:
					throw std::exception("Whoops ... something moved wrong");
					break;
				}
				g_globalXms2Variables[key] = val;
				return std::string("[TRUE,\"\",").append("nil").append("]");
			}
		},
		"[0, \"KEY\", \"ANY\"]",
		"Inserts/Updates the value, in case of first param == -1 the global variables will be set"
	));
	g_commands.push_back(new sqf::Command(
		"getValue",
		[](sqf::Array* arr, char* output, int outputSize) {
			if (arr->length() < 2)
				return std::string("[FALSE,\"Not enough arguments provided\",").append("nil").append("]");
			sqf::Base* element = (*arr)[0];
			if (element->getType() != sqf::Type::SCALAR)
				return std::string("[FALSE,\"Invalid argument provided at arg 0\",").append("nil").append("]");
			auto index = ((sqf::Scalar*)element)->getValue();
			if (index < -1 || index >= g_units.size())
				return std::string("[FALSE,\"Invalid ID was provided at arg 0\",").append("nil").append("]");

			element = (*arr)[1];
			if (element->getType() != sqf::Type::STRING)
				return std::string("[FALSE,\"Invalid argument provided at arg 1\",").append("nil").append("]");

			auto key = ((sqf::String*)element)->getValue();

			if (index != -1)
			{
				auto unit = g_units[index];
				const sqf::Base* val = unit->getValue(key);
				return std::string("[TRUE,\"\",").append(val->escapedString()).append("]");
			}
			else
			{
				sqf::Base* val = g_globalXms2Variables[key];
				return std::string("[TRUE,\"\",").append(val->escapedString()).append("]");
			}
		},
		"[0, \"KEY\"]",
		"receives the value, in case of first param == -1 the global variables will be checked"
		));
	g_commands.push_back(new sqf::Command(
		"runSimulation",
		[](sqf::Array* arr, char* output, int outputSize) {
			if (arr->length() < 1)
				return std::string("[FALSE,\"Not enough arguments provided\",").append("nil").append("]");
			sqf::Base* element = (*arr)[0];
			if (element->getType() != sqf::Type::SCALAR)
				return std::string("[FALSE,\"Invalid argument provided at arg 0\",").append("nil").append("]");
			auto index = ((sqf::Scalar*)element)->getValue();
			if (index < 0 || index >= g_units.size())
				return std::string("[FALSE,\"Invalid ID was provided at arg 0\",").append("nil").append("]");
			xms2::Unit* unit = g_units[index];
			for (auto& it : g_simulations)
			{
				it->runSimulation(g_globalXms2Variables, unit);
			}
			return std::string("[TRUE,\"\",").append("nil").append("]");
		},
		"[0]",
		"Runs the simulation ticks, first param represents the unit ID"
	));
}
void __stdcall RVExtension(char *output, int outputSize, const char *function)
{
	//Do basic function parsing
	sqf::Array arr;
	try
	{
		sqf::Array::parsePartially(&arr, function);
	}
	catch (std::exception e)
	{
		strncpy(output, std::string("[FALSE,\"").append("Error while reading input: ").append(sqf::String::escapeString(e.what())).append("\",NIL]").c_str(), outputSize);
		return;
	}
	size_t paramCount = arr.length();
	if (paramCount < 2)
	{
		if (paramCount == 0)
			strncpy(output, std::string("[FALSE,\"").append("Error while reading input: No Function provided.").append("\",NIL]").c_str(), outputSize);
		else
			strncpy(output, std::string("[FALSE,\"").append("Error while reading input: Missing default argument.").append("\",NIL]").c_str(), outputSize);
		return;
	}
	sqf::Base& tmpFnc = *arr[0];
	if (tmpFnc.getType() != sqf::Type::STRING)
	{
		strncpy(output, std::string("[FALSE,\"").append("First function parameter was NOT of the type string!").append("\",NIL]").c_str(), outputSize);
		return;
	}

	sqf::Base& tmpArg = *arr[1];
	if (tmpArg.getType() != sqf::Type::ARRAY)
	{
		strncpy(output, std::string("[FALSE,\"").append("Second function parameter was NOT of the type array!").append("\",NIL]").c_str(), outputSize);
		return;
	}
	//Instruction Handling
	sqf::Array& arg = *(sqf::Array*)arr[1];
	std::string fnc = ((sqf::String&)tmpFnc).getValue();
	bool flag = false;
	std::string cmdOut;
	try
	{
		for (auto& it : g_commands)
		{
			if (flag = it->runIfMatch(fnc, cmdOut, &arg, output, outputSize, false))
			{
				strncpy(output, cmdOut.c_str(), outputSize);
				break;
			}
		}
	}
	catch (std::exception e)
	{
		strncpy(output, std::string("[FALSE,\"").append("Function '").append(fnc).append("' raised an exception. Hint: ").append(e.what()).append("\",NIL]").c_str(), outputSize);
		return;
	}
	if (!flag)
	{
		strncpy(output, std::string("[FALSE,\"").append("Function '").append(fnc).append("' is unknown. Hint: Function names are case-sensitive!\",NIL]").c_str(), outputSize);
		return;
	}
}

#ifndef _DEBUG_
BOOL APIENTRY DllMain(HMODULE hModule, DWORD  ul_reason_for_call, LPVOID lpReserved)
{
	switch (ul_reason_for_call)
	{
	case DLL_PROCESS_ATTACH:
		addCommands();
		break;
	case DLL_THREAD_ATTACH:
		break;
	case DLL_THREAD_DETACH:
		break;
	case DLL_PROCESS_DETACH:
		for(auto& it : g_globalXms2Variables)
		{
			if (it.second)
				delete it.second;
		}
		g_globalXms2Variables.clear();
		for(auto& it : g_units)
		{
			if (it)
				delete it;
		}
		g_units.clear();
		for (auto& it : g_commands)
			delete it;
		g_commands.clear();
		break;
	}
	return TRUE;
}
#endif