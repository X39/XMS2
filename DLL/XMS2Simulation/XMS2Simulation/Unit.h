#pragma once
#include "sqfParser\Base.h"
namespace xms2
{
	class Unit
	{
	public:
		Unit();
		~Unit();
		void setValue(std::string key, const sqf::Base* value);
		void setValue(std::string key, const sqf::Base& value);
		const sqf::Base* getValue(std::string key) const;
	};

}