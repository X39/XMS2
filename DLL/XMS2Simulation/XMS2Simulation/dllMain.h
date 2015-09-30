#include "string.h"
extern "C"
{
	__declspec(dllexport) void __stdcall RVExtension(char *output, int outputSize, const char *function);
};
void addCommands(void);
void toUpper(std::string& s);
char* toUpper(char* s);
