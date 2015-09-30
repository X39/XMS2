#include "string.h"
extern "C"
{
	__declspec(dllexport) void __stdcall RVExtension(char *output, int outputSize, const char *function);
};
void toUpper(std::string& s);
void toUpper(char* s);
