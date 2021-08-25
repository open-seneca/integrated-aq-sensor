#ifndef _SPS30_H_
#define _SPS30_H_

#include <stdio.h>

//##################################################################################################################

typedef struct 
{
	float spsData[10]; // 10 values in buffer
	uint8_t serial[32];
	
}SPS30_t;

extern SPS30_t SPS30;

#endif
