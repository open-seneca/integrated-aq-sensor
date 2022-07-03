#include "i2c.h"
#include <stdio.h>
#include <SEN5x.h>
#include <SEN5xConfig.h>

SPS30_t SPS30;

//##################################################################################################################
// Calculating checksum. Function provided in SPS30 datasheet
uint8_t CalcCrc(uint8_t data[2]) {
	uint8_t crc = 0xFF;
	for(int i = 0; i < 2; i++) {
	crc ^= data[i];
	for(uint8_t bit = 8; bit > 0; --bit) {
	  if(crc & 0x80) {
	  crc = (crc << 1) ^ 0x31u;
	  } else {
		crc = (crc << 1);
	   }
	 }
	}
	return crc;
}

//##################################################################################################################
void SPS30_start_measurement(void){
	uint8_t txBuf[2] = {0x00, 0x21}; // instead of 0x0010 for SPS30
	memset(&SPS30.spsData,0,sizeof(SPS30.spsData));
	HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(&_SPS30_I2C, (_SPS30_addr<<1), &txBuf, 2, HAL_MAX_DELAY);

}

//##################################################################################################################
void SPS30_stop_measurement(void){
	uint8_t txBuf[2] = {0x01, 0x04}; // same as SPS30
	HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(&_SPS30_I2C, (_SPS30_addr<<1), &txBuf, 2, HAL_MAX_DELAY);
}

//##################################################################################################################
uint8_t SPS30_read_data(){
	uint8_t txBuf[2] = {0x03, 0xC4}; // instead of 0x0300 for SPS30
	uint8_t rxBuf[24];
//	memset(&SPS30.spsData,0,sizeof(SPS30.spsData));
//	HAL_Delay(20);
	HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(&_SPS30_I2C, (_SPS30_addr<<1), &txBuf, 2, HAL_MAX_DELAY);
	HAL_Delay(20);
	status = HAL_I2C_Master_Receive(&_SPS30_I2C, (_SPS30_addr<<1), &rxBuf, sizeof(rxBuf), HAL_MAX_DELAY);
	for (int i=0; i<8; i++) { // first 12 registers are pm data in uint16 format
		uint8_t b0 = rxBuf[i*3];
		uint8_t b1 = rxBuf[i*3+1];
		uint8_t b2 = rxBuf[i*3+2]; // rxBuf[i*3+2] is checksum byte
		if (i<4) {
			uint16_t value = (b0<<8)|(b1<<0); // merge bytes in correct order
			SPS30.spsData[i] = value/10.0f; // scaling factor of 10
		}
		else {
			int16_t value = (b0<<8)|(b1<<0); // merge bytes in correct order
			if (i==4) SPS30.spsData[i] = value/100.0f; // scaling factor of 100 for humidity
			else if (i==5) SPS30.spsData[i] = value/200.0f; // scaling factor of 200 for temperature
			else SPS30.spsData[i] = value/10.0f; // scaling factor of 10 for voc/nox
		}
	}
	if (status == HAL_OK && SPS30.spsData[1] > 0.0f) return 1;
	return 0;
}

//float round(float var)
//{
//    // 37.66666 * 100 =3766.66
//    // 3766.66 + .5 =3767.16    for rounding off value
//    // then type cast to int so value is 3767
//    // then divided by 100 so the value converted into 37.67
//    float value = (int)(var * 100 + .5);
//    return (float)value / 100;
//}

//##################################################################################################################
uint8_t SPS30_data_ready(void){
	uint8_t txBuf[2] = {0x02, 0x02}; // same as SPS30
	uint8_t rxBuf[2];
	HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(&_SPS30_I2C, (_SPS30_addr<<1), &txBuf, 2, HAL_MAX_DELAY);
	HAL_Delay(20);
	status = HAL_I2C_Master_Receive(&_SPS30_I2C, (_SPS30_addr<<1), &rxBuf, sizeof(rxBuf), HAL_MAX_DELAY);
	return rxBuf[1]; // 0x01 if data is ready, 0x00 if not
 }

//##################################################################################################################
void SPS30_clean_fan(void){
	uint8_t txBuf[2] = {0x56, 0x07}; // same as SPS30
 	HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(&_SPS30_I2C, (_SPS30_addr<<1), &txBuf, 2, HAL_MAX_DELAY);
}

//##################################################################################################################
void SPS30_reset(void){
	uint8_t txBuf[2] = {0xD3, 0x04}; // same as SPS30
 	HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(&_SPS30_I2C, (_SPS30_addr<<1), &txBuf, 2, HAL_MAX_DELAY);

}

//##################################################################################################################
void SPS30_read_serialnumber(void){
	uint8_t txBuf[2] = {0xD0, 0x33}; // same as SPS30
	uint8_t rxBuf[32];
	HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(&_SPS30_I2C, (_SPS30_addr<<1), &txBuf, 2, HAL_MAX_DELAY);
	HAL_Delay(20);
	status = HAL_I2C_Master_Receive(&_SPS30_I2C, (_SPS30_addr<<1), &rxBuf, sizeof(rxBuf), HAL_MAX_DELAY);
	if (status == HAL_ERROR) {
		sprintf(SPS30.serial, "AQ-SENSOR");
		return;
	}
	uint8_t k=0;
	for (int i=0; i<sizeof(rxBuf); i++) { // every 3 bytes there is a checksum
		if (i%3==0) {
			uint8_t arg[2] = {rxBuf[i],rxBuf[i+1]};
			if (CalcCrc(arg) != rxBuf[i+2])
				return 0;
		} else {
		SPS30.serial[k] = rxBuf[i-1];
		k++;
		}
	}
 }
