#include "Unit.h"
#include "map.h"
#include "sqfParser\Array.h"
namespace xms2
{
	std::map<std::string, sqf::Base*> valueMap;
	Unit::Unit()
	{
		
	}
	Unit::~Unit()
	{
		for (auto& it : valueMap)
		{
			if (it.second)
			{
				delete it.second;
			}
		}
		valueMap.clear();
	}
	void Unit::setValue(std::string key, const sqf::Base* value)
	{
		sqf::Base* val;
		switch (value->getType())
		{
		case sqf::Type::ARRAY:
			val = new sqf::Array(*((const sqf::Array*)value));
			break;
		case sqf::Type::STRING:
			val = new sqf::String(*((const sqf::String*)value));
			break;
		case sqf::Type::SCALAR:
			val = new sqf::Scalar(*((const sqf::Scalar*)value));
			break;
		case sqf::Type::BOOLEAN:
			val = new sqf::Boolean(*((const sqf::Boolean*)value));
			break;
		case sqf::Type::NIL:
			val = new sqf::Nil(*((const sqf::Nil*)value));
			break;
		default:
			throw std::exception("Whoops ... something moved wrong");
			break;
		}
		valueMap[key] = val;
	}
	void Unit::setValue(std::string key, const sqf::Base& value)
	{
		sqf::Base* val;
		switch (value.getType())
		{
		case sqf::Type::ARRAY:
			val = new sqf::Array((const sqf::Array&)value);
			break;
		case sqf::Type::STRING:
			val = new sqf::String((const sqf::String&)value);
			break;
		case sqf::Type::SCALAR:
			val = new sqf::Scalar((const sqf::Scalar&)value);
			break;
		case sqf::Type::BOOLEAN:
			val = new sqf::Boolean((const sqf::Boolean&)value);
			break;
		case sqf::Type::NIL:
			val = new sqf::Nil((const sqf::Nil&)value);
			break;
		default:
			throw std::exception("Whoops ... something moved wrong");
			break;
		}
		valueMap[key] = val;
	}
	const sqf::Base* Unit::getValue(std::string key) const
	{
		return valueMap[key];
	}
}