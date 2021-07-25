// Disable loading images greater than the defined size. As of 2021, DirectX and Metal only support up to 16K (16384) texture size.
#define STBI_MAX_DIMENSIONS 16384

// Disable using the C standard library for Input/Output. I/O will be done using other means.
#define STBI_NO_STDIO

#include "stb_image.h"