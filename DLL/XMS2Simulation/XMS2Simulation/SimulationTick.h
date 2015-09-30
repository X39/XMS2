#pragma once
#include "map.h"
#include "string.h"
#include "sqfParser\Base.h"
#include "Unit.h"
namespace xms2
{
	class SimulationTick
	{
	public:
		virtual ~SimulationTick(void) {}
		virtual void runSimulation(std::map<std::string, sqf::Base*>& globals, Unit* unit) = 0;
	};
}