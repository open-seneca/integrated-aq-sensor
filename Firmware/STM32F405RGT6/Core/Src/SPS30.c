#include "SPS30Config.h"
#include "SPS30.h"
#include "i2c.h"
#include <stdio.h>

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
	uint8_t arg[2] = {0x03, 0x00};
	uint8_t txBuf[5] = {0x00, 0x10, 0x03, 0x00, CalcCrc(arg)};
	memset(&SPS30.spsData,0,sizeof(SPS30.spsData));
	HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(&_SPS30_I2C, (_SPS30_addr<<1), &txBuf, 5, HAL_MAX_DELAY);

}

//##################################################################################################################
void SPS30_stop_measurement(void){
	uint8_t txBuf[2] = {0x01, 0x04};
	HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(&_SPS30_I2C, (_SPS30_addr<<1), &txBuf, 2, HAL_MAX_DELAY);
}

//##################################################################################################################
uint8_t SPS30_read_data(){
	uint8_t txBuf[2] = {0x03, 0x00};
	uint8_t rxBuf[60];
	HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(&_SPS30_I2C, (_SPS30_addr<<1), &txBuf, 2, HAL_MAX_DELAY);
	status = HAL_I2C_Master_Receive(&_SPS30_I2C, (_SPS30_addr<<1), &rxBuf, sizeof(rxBuf), HAL_MAX_DELAY);
	for (int i=0; i<10; i++) { // 60 register buffer with 6 registers per float value
		uint8_t b1 = rxBuf[i*6];
		uint8_t b2 = rxBuf[i*6+1]; // rxBuf[i*6+2] is checksum byte
		uint8_t b3 = rxBuf[i*6+3];
		uint8_t b4 = rxBuf[i*6+4]; // rxBuf[i*6+5] is checksum byte
		uint32_t value = (b1<<24)|(b2<<16)|(b3<<8)|(b4<<0); // merge bytes in correct order
		SPS30.spsData[i] = *(float*)&value; // convert to float
	}
	if (status == HAL_OK && SPS30.spsData[1] > 0.0f) return 1;
	return 0;
}

//##################################################################################################################
uint8_t SPS30_data_ready(void){
	uint8_t txBuf[2] = {0x02, 0x02};
	uint8_t rxBuf[2];
	HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(&_SPS30_I2C, (_SPS30_addr<<1), &txBuf, 2, HAL_MAX_DELAY);
	status = HAL_I2C_Master_Receive(&_SPS30_I2C, (_SPS30_addr<<1), &rxBuf, sizeof(rxBuf), HAL_MAX_DELAY);
	return rxBuf[1]; // 0x01 if data is ready, 0x00 if not
 }

//##################################################################################################################
void SPS30_clean_fan(void){
	uint8_t txBuf[2] = {0x56, 0x07};
 	HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(&_SPS30_I2C, (_SPS30_addr<<1), &txBuf, 2, HAL_MAX_DELAY);
}

//##################################################################################################################
void SPS30_get_serial(void){
	uint8_t txBuf[2] = {0xD0, 0x33};
	uint8_t spsSerial[32];
	HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(&_SPS30_I2C, (_SPS30_addr<<1), &txBuf, 2, HAL_MAX_DELAY);
	HAL_Delay(20);
	status = HAL_I2C_Master_Receive(&_SPS30_I2C, (_SPS30_addr<<1), &spsSerial, sizeof(spsSerial), HAL_MAX_DELAY);
}

//##################################################################################################################
void SPS30_reset(void){
	uint8_t txBuf[2] = {0xD3, 0x04};
 	HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(&_SPS30_I2C, (_SPS30_addr<<1), &txBuf, 2, HAL_MAX_DELAY);

}

//##################################################################################################################
void SPS30_read_serialnumber(void){
	uint8_t txBuf[2] = {0xD0, 0x33};
	uint8_t rxBuf[48];
	HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(&_SPS30_I2C, (_SPS30_addr<<1), &txBuf, 2, HAL_MAX_DELAY);
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
