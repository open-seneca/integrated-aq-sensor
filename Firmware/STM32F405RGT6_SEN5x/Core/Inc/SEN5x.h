#ifndef _SPS30_H_
#define _SPS30_H_

#include <stdio.h>

//##################################################################################################################

typedef struct 
{
	float spsData[8]; // 10 values in buffer
	uint8_t serial[32];
	
}SPS30_t;

extern SPS30_t SPS30;
//##################################################################################################################
uint8_t CalcCrc(uint8_t data[2]);
void SPS30_start_measurement(void);
void SPS30_stop_measurement(void);
uint8_t SPS30_read_data(void);
uint8_t SPS30_data_ready(void);
void SPS30_clean_fan(void);
void SPS30_reset(void);
void SPS30_read_serialnumber(void);
//##################################################################################################################

#endif
