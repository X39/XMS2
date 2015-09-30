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
void toUpper(char* s)
{
	for (int i = 0; s[i] != '\0'; i++)
		s[i] = toupper(s[i]);
}
void addCommands(void)
{
	g_commands.push_back( new sqf::Command(
			"createUnit",
			[](sqf::Array* arr, char* output, int outputSize) {
				int index = g_units.size();
				g_units.push_back(new xms2::Unit());
				return std::string("[TRUE,\"\",").append(std::to_string(index)).append("]");
			},
			"[]",
			"Creates a new unit. Returns unit ID"
	));
	//ToDo:
	g_commands.push_back(new sqf::Command(
		"deleteUnit",
			[](sqf::Array* arr, char* output, int outputSize) {
			return std::string("[TRUE,\"\",").append("nil").append("]");
		},
		"[]",
		"Creates a new unit. Returns unit ID"
		));
	g_commands.push_back(new sqf::Command(
		"setValue",
		[](sqf::Array* arr, char* output, int outputSize) {
			return std::string("[TRUE,\"\",").append("nil").append("]");
		},
		"[0, \"ANY\"]",
		"Inserts/Updates the value, in case of first param == -1 the global variables will be set"
	));
	g_commands.push_back(new sqf::Command(
		"getValue",
		[](sqf::Array* arr, char* output, int outputSize) {
			return std::string("[TRUE,\"\",").append("nil").append("]");
		},
		"[0]",
		"receives the value, in case of first param == -1 the global variables will be checked"
		));
	g_commands.push_back(new sqf::Command(
		"runSimulation",
		[](sqf::Array* arr, char* output, int outputSize) {
			for (auto& it : g_simulations)
			{
				xms2::Unit* unit;
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

#ifndef _DEBUG
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