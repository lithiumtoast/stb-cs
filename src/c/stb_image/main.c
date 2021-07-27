#if _WIN32
    #ifndef _WIN64
        #error "Compiling for Windows 32-bit ARM or x86 is not supported."
    #endif
    #define VC_EXTRALEAN
    #ifndef STB_IMAGE_STATIC
        #define STBIDEF __declspec(dllexport)
    #endif
#endif

#define STB_IMAGE_IMPLEMENTATION

#include "main.h"