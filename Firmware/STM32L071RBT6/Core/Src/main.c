/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2021 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "fatfs.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include <stdarg.h> //for va_list var arg functions
#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include "u8g2/u8g2.h"
#include "GPS.h"
#include "SPS30.h"

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

GPS_t GPS;
SPS30_t SPS30;
#define _SPS30_addr 				0x69

//#define SD_SPI_HANDLE hspi1 // overwritten in user_diskio_spi.c
char screen_str[3];
uint16_t adcData[2];
float batteryVoltage;
float batteryTemperature;
float temp;
float rh;
float comp_t;
float comp_rh;
uint16_t counter = 0;
uint8_t noSD = 1;
uint32_t millis = 0; // last measurement
uint8_t btname[12]; // SPS serial typically 16 bytes, 12 is allowed for name
uint8_t filename[11]; // 11 bytes allowed for filename length
uint8_t data[164];

FATFS FatFs; 	//Fatfs handle
FIL fil; 		//File handle
uint8_t readBuf[30];
uint8_t readBuf_old[30];
uint8_t count = 0;
uint8_t btcmd[19];
FRESULT fres; //Result after operations
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
ADC_HandleTypeDef hadc;

I2C_HandleTypeDef hi2c1;
I2C_HandleTypeDef hi2c2;

SPI_HandleTypeDef hspi1;
SPI_HandleTypeDef hspi2;

TIM_HandleTypeDef htim2;
TIM_HandleTypeDef htim3;

UART_HandleTypeDef huart1;
UART_HandleTypeDef huart2;

/* USER CODE BEGIN PV */
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_ADC_Init(void);
static void MX_I2C1_Init(void);
static void MX_I2C2_Init(void);
static void MX_USART1_UART_Init(void);
static void MX_USART2_UART_Init(void);
static void MX_SPI1_Init(void);
static void MX_SPI2_Init(void);
static void MX_TIM2_Init(void);
static void MX_TIM3_Init(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */
extern uint8_t u8x8_stm32_gpio_and_delay(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr);
extern uint8_t u8x8_byte_stm32_hw_i2c(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr);

static u8g2_t u8g2;

void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
	GPS_CallBack();
//	HAL_UART_Receive_DMA(&huart1, readBuf, 8);
}

//##################################################################################################################
double convertDegMinToDecDeg (float degMin)
{
  double min = 0.0;
  double decDeg = 0.0;

  //get the minutes, fmod() requires double
  min = fmod((double)degMin, 100.0);

  //rebuild coordinates in decimal degrees
  degMin = (int) ( degMin / 100 );
  decDeg = degMin + ( min / 60 );

  return decDeg;
}
//##################################################################################################################
void	GPS_Init()
{
	// Note: GPS_NRST sets the GPS LED, not the reset apparently
//	memset(&GPS.GPGGA,0,sizeof(GPS.GPGGA));  // resets GPGGA to 0
	GPS.rxIndex=0;
	HAL_UART_Receive_IT(&huart2,&GPS.rxTmp,1);
//	HAL_UART_Receive(&huart2,&GPS.rxBuffer,32, HAL_MAX_DELAY);
//	HAL_UART_Receive_DMA(&huart2,&GPS.rxBuffer,32);

}
//##################################################################################################################
void	GPS_CallBack() /* Receiving GPS UART buffer byte by byte until it starts repeating */
{
	HAL_UART_Receive_IT(&huart2,&GPS.rxTmp,1);
//	HAL_UART_Receive_DMA(&huart2,&GPS.rxBuffer,32);
//	HAL_UART_Receive(&huart2,&GPS.rxBuffer,32, HAL_MAX_DELAY);
//	HAL_Delay(50);


	/* We expect 14 NMEA sentences separated by a $ symbol */
	GPS.rxBuffer[GPS.rxIndex] = GPS.rxTmp;
//	if (GPS.rxTmp == 36) GPS.nmeaCounter++;
	GPS.rxIndex++;
//	if (GPS.nmeaCounter >= 13)
	if (GPS.rxTmp == 13 || GPS.rxIndex == 80) GPS_Process(); // 36 is '$' in UTF8
}
//##################################################################################################################
void	GPS_Process()
{
	char	*str = 0x0;
//	char	*str2;
	char	*str3 = 0x0;
//	#if (_GPS_DEBUG==1)
//	printf("%s",GPS.rxBuffer);
//	#endif
	int result = -2; // check how many characters have been read from buffer (-1 = EOF)
	GPS.GPGGA.Buffer_Size = strlen(GPS.rxBuffer);
	if (GPS.GPGGA.Buffer_Size > 80)
		GPS.count++; // just to test if we ever read more than the buffer size
	if (str = strstr((char*)GPS.rxBuffer,"GNGGA,")) {
//		memset(&GPS.GPGGA,0,sizeof(GPS.GPGGA));  // resets GPGGA to 0
		// GNGGA for where the position is in the buffer
		if (result = sscanf(str,"GNGGA,%f,%f,%c,%f,%c,%d,%d,%f,%f",&GPS.GPGGA.HHMMSS,&GPS.GPGGA.Latitude,&GPS.GPGGA.NS_Indicator,&GPS.GPGGA.Longitude,&GPS.GPGGA.EW_Indicator,&GPS.GPGGA.PositionFixIndicator,&GPS.GPGGA.SatellitesUsed,&GPS.GPGGA.HDOP,&GPS.GPGGA.MSL_Altitude) > 0) {  // GNGGA instead of GPGGA
			if(GPS.GPGGA.PositionFixIndicator>0)
				GPS.GPGGA.PositionFixIndicator=1;
			if(GPS.GPGGA.NS_Indicator==0)
				GPS.GPGGA.NS_Indicator='-';
			if(GPS.GPGGA.EW_Indicator==0)
				GPS.GPGGA.EW_Indicator='-';
			if(GPS.GPGGA.Geoid_Units==0)
				GPS.GPGGA.Geoid_Units='-';
			if(GPS.GPGGA.MSL_Units==0)
				GPS.GPGGA.MSL_Units='-';
			if (GPS.GPGGA.Latitude == 0.0f || GPS.GPGGA.Longitude == 0.0f) {
				GPS.GPGGA.LatitudeDecimal = 0.0f;
				GPS.GPGGA.LongitudeDecimal = 0.0f;
			} else {
				GPS.GPGGA.LatitudeDecimal=convertDegMinToDecDeg(GPS.GPGGA.Latitude);
				if (GPS.GPGGA.NS_Indicator=="S") GPS.GPGGA.LatitudeDecimal *= -1; // subject to testing 21/04/2021
				GPS.GPGGA.LongitudeDecimal=convertDegMinToDecDeg(GPS.GPGGA.Longitude);
				if (GPS.GPGGA.EW_Indicator=="E") GPS.GPGGA.LongitudeDecimal *= -1; // subject to testing 21/04/2021
			}
			GPS.GPGGA.UTC_Hour = (int)(GPS.GPGGA.HHMMSS/10000.f);
			GPS.GPGGA.UTC_Min = (int)GPS.GPGGA.HHMMSS%10000/100.f;
			GPS.GPGGA.UTC_Sec = (int)GPS.GPGGA.HHMMSS%100;
		}
	}
//	else if (str2 = strstr((char*)GPS.rxBuffer,"GNZDA,")) { // GNZDA for where the date is in the buffer
//		// format: GNZDA,181815.000,03,02,2021
//		if (result = sscanf(str2,"GNZDA,%*f,%d,%d,%d,",&GPS.GPGGA.UTC_Day,&GPS.GPGGA.UTC_Month,&GPS.GPGGA.UTC_Year) > 0) {
//			GPS.GPGGA.YYYYMMDD = 10000*GPS.GPGGA.UTC_Year+100*GPS.GPGGA.UTC_Month+GPS.GPGGA.UTC_Day;
//			if (GPS.GPGGA.YYYYMMDD < 19700000) GPS.GPGGA.YYYYMMDD = 0;
//		}
//	}
	else if (str3 = strstr((char*)GPS.rxBuffer,"GNRMC,")) { // GNRMC for where the speed is in the buffer
		uint8_t speed[5];
		if (result = sscanf(str3,"GNRMC,%*f,%*c,%*f,%*c,%*f,%*c,%4s,%*f,%d,",&speed,&GPS.GPGGA.YYYYMMDD) > 0) {
			GPS.GPGGA.Speed_KTS = atof(speed);
			GPS.GPGGA.Speed_KMH = 1.852f * GPS.GPGGA.Speed_KTS; // conversion from knots to km/h
		}
//		else {
//			GPS.GPGGA.Speed_KTS = -1;
//			GPS.GPGGA.Speed_KMH = -1;
//		}
	}
	memset(GPS.rxBuffer,0,sizeof(GPS.rxBuffer)); // resets rxBuffer
	GPS.rxIndex=0;
//	GPS.nmeaCounter=0;
	GPS.LastTime=HAL_GetTick();
}
//##################################################################################################################


char * screen_format(int val) {
	if (val < 99 && val >= -9) {
		if (val <= 9) {
			sprintf(screen_str, " %d", val);
		} else {
			sprintf(screen_str, "%d", val);
		}

	} else {
		sprintf(screen_str, "%d", 99);
	}

	return screen_str;
}

int Linear(int AQIhigh, int AQIlow, float Conchigh, float Conclow, float Conc) {
	return ((Conc-Conclow)/(Conchigh-Conclow))*(AQIhigh-AQIlow)+AQIlow;
}


int AQIPM25(float c) {

	if (c>=0 && c<12.1)
	{
		return(Linear(50,0,12,0,c));
	}
	else if (c>=12.1 && c<35.5)
	{
		return(Linear(100,51,35.4,12.1,c));
	}
	else if (c>=35.5 && c<55.5)
	{
		return(Linear(150,101,55.4,35.5,c));
	}
	else if (c>=55.5 && c<150.5)
	{
		return(Linear(200,151,150.4,55.5,c));
	}
	else if (c>=150.5 && c<250.5)
	{
		return(Linear(300,201,250.4,150.5,c));
	}
	else if (c>=250.5 && c<500)
	{
		return(Linear(500,301,500.4,250.5,c));
	}
	else return 500;

}

void gps_dots(int gps_satellites, int fix) {
	if (gps_satellites > 0) u8g2_DrawRBox(&u8g2, 126, 11, 2, 2, 1); // any fix = 1 bar
	if (gps_satellites > 3) u8g2_DrawRBox(&u8g2, 123, 11, 2, 4, 1); // indoors I typically have 4-5 sats
	if (gps_satellites > 4) u8g2_DrawRBox(&u8g2, 120, 11, 2, 6, 1);
	if (gps_satellites > 5) u8g2_DrawRBox(&u8g2, 117, 11, 2, 8, 1);
}

void battery_dots_vert(float voltage) {
    if (voltage < 3.2) // then battery has ~30min remaining
		if (counter%2 == 0) return;
    u8g2_DrawRFrame(&u8g2, 117-0, 0, 11, 8, 1);
    u8g2_DrawRBox(&u8g2, 116-0, 3, 2, 2, 1);
	if (voltage > 3.2) u8g2_DrawRBox(&u8g2, 127-0, 2, 2, 4, 1); // -62
	if (voltage > 3.35) u8g2_DrawRBox(&u8g2, 125-0, 2, 2, 4, 1);
	if (voltage > 3.45) u8g2_DrawRBox(&u8g2, 123-0, 2, 2, 4, 1);
	if (voltage > 3.55) u8g2_DrawRBox(&u8g2, 121-0, 2, 2, 4, 1);
	if (voltage > 3.65) u8g2_DrawRBox(&u8g2, 119-0, 2, 2, 4, 1);
}

void initDisplay() {

	  /* I2C Interface */
	  u8g2_Setup_ssd1306_i2c_128x32_univision_f(&u8g2, U8G2_R0, u8x8_byte_stm32_hw_i2c, u8x8_stm32_gpio_and_delay);
//	  u8g2_setBusClock

	  /* Initialize Display */
	  u8g2_InitDisplay(&u8g2);
	  u8g2_SetPowerSave(&u8g2, 0);
	  u8g2_SetFontDirection(&u8g2, 2);

}

void updateDisplay() {

	  float pm25 = SPS30.spsData[1];
	  char screen_str[16];

	  float aqi = AQIPM25(pm25);
	  int barwidth = (128-55);
	  int aqi_width = barwidth*aqi/500. +2;

	  int gps_satellites = GPS.GPGGA.SatellitesUsed;

	  float vbat = batteryVoltage;

	  u8g2_FirstPage(&u8g2);
	  		do
	  		{
	  			u8g2_ClearBuffer(&u8g2);

	  			// numbers
	  	  u8g2_SetFont(&u8g2, u8g2_font_logisoso30_tn);
          u8g2_DrawStr(&u8g2, 50, 0, screen_format((int)pm25));
          u8g2_SetFont(&u8g2, u8g2_font_logisoso16_tn);
          if (pm25<100) sprintf(screen_str, ".%d", (int)(pm25*10)%10);
          else sprintf(screen_str, ".%d", 9);
          u8g2_DrawStr(&u8g2, 14, 14, screen_str);
          if (noSD == 1) {
        	  u8g2_SetFont(&u8g2, u8g2_font_profont17_tf);
        	  if (counter%2 == 0) u8g2_DrawStr(&u8g2, 128-24+0, 0, "No SD");
          }
          else { /* we compensate for the board temperature heating by offsetting the shown value by -4C */
              u8g2_SetFont(&u8g2, u8g2_font_logisoso18_tn);
        	  u8g2_DrawStr(&u8g2, 128-50+0, 0, screen_format(round(comp_rh))); // GPS.GPGGA.UTC_Min
        	  u8g2_DrawStr(&u8g2, 128-20+0, 0, screen_format(round(comp_t))); // GPS.GPGGA.UTC_Hour
          }
          u8g2_SetFont(&u8g2, u8g2_font_profont10_tf);

          // gps
          gps_dots(gps_satellites, GPS.GPGGA.PositionFixIndicator);

          // battery
          battery_dots_vert(vbat);

          // air quality indicator
          u8g2_DrawRFrame(&u8g2, 128-barwidth, 27, barwidth, 7, 1);
          u8g2_DrawRBox(&u8g2, 128-aqi_width, 27, aqi_width, 5, 1);

	  		} while (u8g2_NextPage(&u8g2));
}

void welcomeDisplay() {

	u8g2_FirstPage(&u8g2);
	do
	{
		u8g2_ClearBuffer(&u8g2);
		u8g2_SetFont(&u8g2, u8g2_font_profont17_tf);
		u8g2_DrawStr(&u8g2, 127, 20, "open-seneca");
		u8g2_SetFont(&u8g2, u8g2_font_profont10_tf);
		u8g2_DrawStr(&u8g2, 127, 4, "air quality sensor ...");
	} while (u8g2_NextPage(&u8g2));

}

void lowBatteryDisplay() {

	u8g2_FirstPage(&u8g2);
	u8g2_NextPage(&u8g2);
	HAL_Delay(1000);
	u8g2_DrawRFrame(&u8g2, 117-0, 0, 11, 8, 1);
	u8g2_DrawRBox(&u8g2, 116-0, 3, 2, 2, 1);
	u8g2_NextPage(&u8g2);
	HAL_Delay(1000);

}

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

int SHTC3_read_data() { // for sht21

	  /* Clock stretching enabled, read T first */
	  uint8_t txBuf[2] = {0x7C, 0xA2};
	  HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(&hi2c1, (0x70<<1), &txBuf, 2, HAL_MAX_DELAY);


	  if (status != HAL_OK) {
		  return -1;
	  }

	  /* Read both t and rh */
	  uint8_t rxBuf[6];

	  status = HAL_I2C_Master_Receive(&hi2c1, (0x70 << 1), (uint8_t *) rxBuf, 6, HAL_MAX_DELAY);

	  if (status != HAL_OK) {
		  return -1;
	  }

	  /* Test checksum with first 2 bytes */
	  if (CalcCrc(rxBuf) != rxBuf[2]) return -1;

	  uint16_t val = (int16_t) ((rxBuf[0] << 8) | rxBuf[1]);
	  temp = 0.00267028808f * val - 45.0f;

	  val = (int16_t) ((rxBuf[3] << 8) | rxBuf[4]);

	  rh = 0.0015258789f * val;

	  return 1;

}

float compensateRH(float RH_sensor, float T_sensor, float dT) {
	float c1 = 17.62;
	float c2 = 243.12;
	float c3 = 275.15;

	float T_real = T_sensor + dT;

	return ((c3 + T_real) * RH_sensor * exp( c1 * ((T_sensor/(c2 + T_sensor)) - (T_real/(c2 + T_real))) )) / (c3 + T_sensor);
}

float compensateT(float T_sensor, float dT) {
	return T_sensor+dT;
}

void initRGBLED() {

	HAL_TIM_PWM_Start(&htim2, TIM_CHANNEL_1);
	HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_1);
	HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_2);
	HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_3);
	HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_4);
//	HAL_TIM_PWM_Start(&htim4, TIM_CHANNEL_3); is only GPIO not PWM channel for L071 STM
	HAL_GPIO_WritePin(GPIOB, TIM4_CH3_Pin, GPIO_PIN_SET);

	setAirLED(100, 100, 100);
	setStatLED(100, 100, 100);

}

void setStatLED(int r, int g, int b) { // values 0-100

	htim2.Instance->CCR1 = r;
	htim3.Instance->CCR1 = g;
	htim3.Instance->CCR2 = b;

}

void setAirLED(int r, int g, int b) { // values 0-100

	htim3.Instance->CCR3 = r;
	htim3.Instance->CCR4 = g;
//	htim4.Instance->CCR3 = b; is only GPIO not PWM channel for L071 STM
	if (b>49) HAL_GPIO_WritePin(GPIOB, TIM4_CH3_Pin, GPIO_PIN_SET);
	else HAL_GPIO_WritePin(GPIOB, TIM4_CH3_Pin, GPIO_PIN_RESET);

}

void AirLED_on() {
	if (SPS30.spsData[1] > 30) setAirLED(0, 100, 100); // red
	else if (SPS30.spsData[1] > 10) setAirLED(0, 0, 100); // yellow
	else setAirLED(100, 0, 100); // green
}

void AirLED_off() {
	setAirLED(100, 100, 100);
}

void renameBT() {

	/* max length of hm11 name is 12 */
	sprintf(btname, "%s%c%c%c", "OPEN-SENE", SPS30.serial[13], SPS30.serial[14], SPS30.serial[15]);
//	uint8_t btcmd[19];
	sprintf(btcmd, "%s%s", "AT+NAME", btname);
	HAL_UART_Transmit(&huart1, btcmd, 19, HAL_MAX_DELAY);
	HAL_Delay(50);
	HAL_GPIO_WritePin(GPIOA, BT_RESET_Pin, GPIO_PIN_RESET);
	HAL_Delay(50);
	HAL_GPIO_WritePin(GPIOA, BT_RESET_Pin, GPIO_PIN_SET);

}

void generateFilename() {
	int filenumber = 0;
	FRESULT res;
	FILINFO fno;
	/* first 3 digits from SPS SN, then 4 digit file counter */
	while (res == FR_OK) {
		sprintf(filename, "%c%c%c%04d.csv", SPS30.serial[13], SPS30.serial[14], SPS30.serial[15], filenumber);
		res = f_stat(filename, &fno); // checking status (or existence rather) of the file
		filenumber++;
	}
}

void myprintf(const char *fmt, ...) {
  static char buffer[256];
  va_list args;
  va_start(args, fmt);
  vsnprintf(buffer, sizeof(buffer), fmt, args);
  va_end(args);

  int len = strlen(buffer);
  HAL_UART_Transmit(&huart1, (uint8_t*)buffer, len, HAL_MAX_DELAY);

}

int saveToSD(uint8_t *dBuf, uint8_t dBufLen) {

	//Open a file for writing
	if (f_open(&fil, filename, FA_WRITE | FA_OPEN_APPEND) != FR_OK) return -1;

	UINT bytesWrote;//Number of bytes written
	if (f_write(&fil, dBuf, dBufLen, &bytesWrote) != FR_OK) return -1;

	//Close the file after writing
	if (f_close(&fil) != FR_OK) return -1;

//	//De-mount the drive
//	if (f_mount(NULL, "", 0) != FR_OK) return -1;

	return bytesWrote;
}

int writeFileHeader() {

	//Open a file for writing
	if (f_open(&fil, filename, FA_WRITE | FA_OPEN_APPEND) != FR_OK) return -1;

	UINT bytesWrote;//Number of bytes written
	uint8_t details[39];
	uint8_t length = sprintf(details, "STM32_v0.10,,,SPS30_SN:%s\n", SPS30.serial);
	if (f_write(&fil, details, length, &bytesWrote) != FR_OK) return -1;

	uint8_t header[195];
	length = sprintf(header, "Counter,Latitude,Longitude,gpsUpdated,Speed,Altitude,Satellites,Date,Time,Millis,PM1.0,PM2.5,PM4.0,PM10,Temperature,Humidity,NC0.5,NC1.0,NC2.5,NC4.0,NC10,TypicalParticleSize,TVOC,eCO2,BatteryVIN,compensatedT,compensatedRH,UID\n");
	if (f_write(&fil, header, length, &bytesWrote) != FR_OK) return -1;

	//Close the file after writing
	if (f_close(&fil) != FR_OK) return -1;

}

void updateADC() {

	  HAL_ADC_Start(&hadc);
	  HAL_ADC_PollForConversion(&hadc, HAL_MAX_DELAY);
	  adcData[0] = HAL_ADC_GetValue(&hadc);
	  batteryVoltage = adcData[0] * 0.00112556008f;

}


//##################################################################################################################

void SPS30_start_measurement(void){
	uint8_t arg[2] = {0x03, 0x00};
	uint8_t txBuf[5] = {0x00, 0x10, 0x03, 0x00, CalcCrc(arg)};
	memset(&SPS30.spsData,0,sizeof(SPS30.spsData));
	HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(&hi2c2, (_SPS30_addr<<1), &txBuf, 5, HAL_MAX_DELAY);

}

void SPS30_stop_measurement(void){
	uint8_t txBuf[2] = {0x01, 0x04};
	HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(&hi2c2, (_SPS30_addr<<1), &txBuf, 2, HAL_MAX_DELAY);
}

uint8_t SPS30_read_data(){
	uint8_t txBuf[2] = {0x03, 0x00};
	uint8_t rxBuf[60];
	HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(&hi2c2, (_SPS30_addr<<1), &txBuf, 2, HAL_MAX_DELAY);
	status = HAL_I2C_Master_Receive(&hi2c2, (_SPS30_addr<<1), &rxBuf, sizeof(rxBuf), HAL_MAX_DELAY);
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

uint8_t SPS30_data_ready(void){
	uint8_t txBuf[2] = {0x02, 0x02};
	uint8_t rxBuf[2];
	HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(&hi2c2, (_SPS30_addr<<1), &txBuf, 2, HAL_MAX_DELAY);
	status = HAL_I2C_Master_Receive(&hi2c2, (_SPS30_addr<<1), &rxBuf, sizeof(rxBuf), HAL_MAX_DELAY);
	return rxBuf[1]; // 0x01 if data is ready, 0x00 if not
 }

void SPS30_clean_fan(void){
	uint8_t txBuf[2] = {0x56, 0x07};
 	HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(&hi2c2, (_SPS30_addr<<1), &txBuf, 2, HAL_MAX_DELAY);
}

void SPS30_get_serial(void){
	uint8_t txBuf[2] = {0xD0, 0x33};
	uint8_t spsSerial[32];
	HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(&hi2c2, (_SPS30_addr<<1), &txBuf, 2, HAL_MAX_DELAY);
	HAL_Delay(20);
	status = HAL_I2C_Master_Receive(&hi2c2, (_SPS30_addr<<1), &spsSerial, sizeof(spsSerial), HAL_MAX_DELAY);
}

void SPS30_reset(void){
	uint8_t txBuf[2] = {0xD3, 0x04};
 	HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(&hi2c2, (_SPS30_addr<<1), &txBuf, 2, HAL_MAX_DELAY);

}

void SPS30_read_serialnumber(void){
	uint8_t txBuf[2] = {0xD0, 0x33};
	uint8_t rxBuf[48];
	HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(&hi2c2, (_SPS30_addr<<1), &txBuf, 2, HAL_MAX_DELAY);
	status = HAL_I2C_Master_Receive(&hi2c2, (_SPS30_addr<<1), &rxBuf, sizeof(rxBuf), HAL_MAX_DELAY);
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

//##################################################################################################################


/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_ADC_Init();
  MX_I2C1_Init();
  MX_I2C2_Init();
  MX_USART1_UART_Init();
  MX_USART2_UART_Init();
  MX_FATFS_Init();
  MX_SPI1_Init();
  MX_SPI2_Init();
  MX_TIM2_Init();
  MX_TIM3_Init();
  /* USER CODE BEGIN 2 */

  HAL_Delay(50);
  updateADC(); // if battery voltage is too low, prevent boot
  HAL_Delay(50);
//    if (batteryVoltage < 2.75f) while(1) lowBatteryDisplay();

  HAL_GPIO_WritePin(GPIOA, BT_RESET_Pin, GPIO_PIN_SET);
  HAL_Delay(50);
  initRGBLED();
  HAL_Delay(50);
  initDisplay();
  welcomeDisplay();
  HAL_Delay(50);
  MX_I2C2_Init(); // reset i2c2 again (needed for it to work!)
  HAL_Delay(50);
  SPS30_start_measurement();
  HAL_Delay(50);
  SPS30_read_serialnumber();
  HAL_Delay(50);
  renameBT();
  SPS30_clean_fan();

  //Mount the file system
  f_mount(&FatFs, "", 1);
  generateFilename();
  writeFileHeader();

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */

	  /* Show boot screen until values first become none-zero */
	  while (SPS30_read_data() != 1)
		  HAL_Delay(100);
	  HAL_Delay(50);
	  SHTC3_read_data();

	  comp_t = compensateT(temp, -4);
	  comp_rh = compensateRH(rh, temp, -4);
	  updateADC();
	  millis = HAL_GetTick();

	  /* Format output data string */
	  uint8_t length = sprintf(data, "%d,%f,%f,%d," // counter, lat, lon, fix
			  "%.1f,%.1f,%d,%d,%06.0f,%d," // speed, alt, sat, date, time, millis
			  "%.2f,%.2f,%.2f,%.2f,%.1f,%.1f," // pm1, pm25, pm4, pm10, t, rh
			  "%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%d,%d,%.2f,%.1f,%.1f,%c%c%c\n", // nc0.5, nc1.0, nc2.5, nc4.0, nc10, psize, tvoc, eco2, vbat
			  counter, GPS.GPGGA.LatitudeDecimal, GPS.GPGGA.LongitudeDecimal, GPS.GPGGA.PositionFixIndicator,
			  GPS.GPGGA.Speed_KMH, GPS.GPGGA.MSL_Altitude, GPS.GPGGA.SatellitesUsed, GPS.GPGGA.YYYYMMDD, GPS.GPGGA.HHMMSS, millis,
			  SPS30.spsData[0], SPS30.spsData[1], SPS30.spsData[2], SPS30.spsData[3], temp, rh,
			  SPS30.spsData[4], SPS30.spsData[5], SPS30.spsData[6], SPS30.spsData[7], SPS30.spsData[8], SPS30.spsData[9],
			  0, 0, batteryVoltage, comp_t, comp_rh, SPS30.serial[13], SPS30.serial[14], SPS30.serial[15]);


	  /* Send data via BT and COM, save to SD */
	  AirLED_on();
//		  CDC_Transmit_FS(data, length); // required for COM port
	  HAL_UART_Transmit(&huart1, data, length, HAL_MAX_DELAY);
	  if (saveToSD(&data, length) == -1) noSD = 1;
	  else noSD = 0;
	  AirLED_off();

	  /* Update the display */
	  updateDisplay();
//	  __disable_irq();
//	  __enable_irq();
	  GPS_Init(); // GPS interrupt needs to be re-initialised after each i2c action

	  /* Increase counter and wait */
	  counter++;
	  while (HAL_GetTick()-millis < 1000) {
		  HAL_Delay(10); // does increasing this delay save power?
	  }
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);
  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLMUL = RCC_PLLMUL_3;
  RCC_OscInitStruct.PLL.PLLDIV = RCC_PLLDIV_2;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_1) != HAL_OK)
  {
    Error_Handler();
  }
  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_USART1|RCC_PERIPHCLK_USART2
                              |RCC_PERIPHCLK_I2C1;
  PeriphClkInit.Usart1ClockSelection = RCC_USART1CLKSOURCE_PCLK2;
  PeriphClkInit.Usart2ClockSelection = RCC_USART2CLKSOURCE_PCLK1;
  PeriphClkInit.I2c1ClockSelection = RCC_I2C1CLKSOURCE_PCLK1;
  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief ADC Initialization Function
  * @param None
  * @retval None
  */
static void MX_ADC_Init(void)
{

  /* USER CODE BEGIN ADC_Init 0 */

  /* USER CODE END ADC_Init 0 */

  ADC_ChannelConfTypeDef sConfig = {0};

  /* USER CODE BEGIN ADC_Init 1 */

  /* USER CODE END ADC_Init 1 */
  /** Configure the global features of the ADC (Clock, Resolution, Data Alignment and number of conversion)
  */
  hadc.Instance = ADC1;
  hadc.Init.OversamplingMode = DISABLE;
  hadc.Init.ClockPrescaler = ADC_CLOCK_SYNC_PCLK_DIV2;
  hadc.Init.Resolution = ADC_RESOLUTION_12B;
  hadc.Init.SamplingTime = ADC_SAMPLETIME_1CYCLE_5;
  hadc.Init.ScanConvMode = ADC_SCAN_DIRECTION_FORWARD;
  hadc.Init.DataAlign = ADC_DATAALIGN_RIGHT;
  hadc.Init.ContinuousConvMode = DISABLE;
  hadc.Init.DiscontinuousConvMode = DISABLE;
  hadc.Init.ExternalTrigConvEdge = ADC_EXTERNALTRIGCONVEDGE_NONE;
  hadc.Init.ExternalTrigConv = ADC_SOFTWARE_START;
  hadc.Init.DMAContinuousRequests = DISABLE;
  hadc.Init.EOCSelection = ADC_EOC_SINGLE_CONV;
  hadc.Init.Overrun = ADC_OVR_DATA_PRESERVED;
  hadc.Init.LowPowerAutoWait = DISABLE;
  hadc.Init.LowPowerFrequencyMode = DISABLE;
  hadc.Init.LowPowerAutoPowerOff = DISABLE;
  if (HAL_ADC_Init(&hadc) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure for the selected ADC regular channel to be converted.
  */
  sConfig.Channel = ADC_CHANNEL_0;
  sConfig.Rank = ADC_RANK_CHANNEL_NUMBER;
  if (HAL_ADC_ConfigChannel(&hadc, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure for the selected ADC regular channel to be converted.
  */
  sConfig.Channel = ADC_CHANNEL_1;
  if (HAL_ADC_ConfigChannel(&hadc, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure for the selected ADC regular channel to be converted.
  */
  sConfig.Channel = ADC_CHANNEL_4;
  if (HAL_ADC_ConfigChannel(&hadc, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN ADC_Init 2 */

  /* USER CODE END ADC_Init 2 */

}

/**
  * @brief I2C1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_I2C1_Init(void)
{

  /* USER CODE BEGIN I2C1_Init 0 */

  /* USER CODE END I2C1_Init 0 */

  /* USER CODE BEGIN I2C1_Init 1 */

  /* USER CODE END I2C1_Init 1 */
  hi2c1.Instance = I2C1;
  hi2c1.Init.Timing = 0x00506682;
  hi2c1.Init.OwnAddress1 = 0;
  hi2c1.Init.AddressingMode = I2C_ADDRESSINGMODE_7BIT;
  hi2c1.Init.DualAddressMode = I2C_DUALADDRESS_DISABLE;
  hi2c1.Init.OwnAddress2 = 0;
  hi2c1.Init.OwnAddress2Masks = I2C_OA2_NOMASK;
  hi2c1.Init.GeneralCallMode = I2C_GENERALCALL_DISABLE;
  hi2c1.Init.NoStretchMode = I2C_NOSTRETCH_DISABLE;
  if (HAL_I2C_Init(&hi2c1) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure Analogue filter
  */
  if (HAL_I2CEx_ConfigAnalogFilter(&hi2c1, I2C_ANALOGFILTER_ENABLE) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure Digital filter
  */
  if (HAL_I2CEx_ConfigDigitalFilter(&hi2c1, 0) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN I2C1_Init 2 */

  /* USER CODE END I2C1_Init 2 */

}

/**
  * @brief I2C2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_I2C2_Init(void)
{

  /* USER CODE BEGIN I2C2_Init 0 */

  /* USER CODE END I2C2_Init 0 */

  /* USER CODE BEGIN I2C2_Init 1 */

  /* USER CODE END I2C2_Init 1 */
  hi2c2.Instance = I2C2;
  hi2c2.Init.Timing = 0x00506682;
  hi2c2.Init.OwnAddress1 = 0;
  hi2c2.Init.AddressingMode = I2C_ADDRESSINGMODE_7BIT;
  hi2c2.Init.DualAddressMode = I2C_DUALADDRESS_DISABLE;
  hi2c2.Init.OwnAddress2 = 0;
  hi2c2.Init.OwnAddress2Masks = I2C_OA2_NOMASK;
  hi2c2.Init.GeneralCallMode = I2C_GENERALCALL_DISABLE;
  hi2c2.Init.NoStretchMode = I2C_NOSTRETCH_DISABLE;
  if (HAL_I2C_Init(&hi2c2) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure Analogue filter
  */
  if (HAL_I2CEx_ConfigAnalogFilter(&hi2c2, I2C_ANALOGFILTER_ENABLE) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure Digital filter
  */
  if (HAL_I2CEx_ConfigDigitalFilter(&hi2c2, 0) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN I2C2_Init 2 */

  /* USER CODE END I2C2_Init 2 */

}

/**
  * @brief SPI1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_SPI1_Init(void)
{

  /* USER CODE BEGIN SPI1_Init 0 */

  /* USER CODE END SPI1_Init 0 */

  /* USER CODE BEGIN SPI1_Init 1 */

  /* USER CODE END SPI1_Init 1 */
  /* SPI1 parameter configuration*/
  hspi1.Instance = SPI1;
  hspi1.Init.Mode = SPI_MODE_MASTER;
  hspi1.Init.Direction = SPI_DIRECTION_2LINES;
  hspi1.Init.DataSize = SPI_DATASIZE_8BIT;
  hspi1.Init.CLKPolarity = SPI_POLARITY_LOW;
  hspi1.Init.CLKPhase = SPI_PHASE_1EDGE;
  hspi1.Init.NSS = SPI_NSS_SOFT;
  hspi1.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_64;
  hspi1.Init.FirstBit = SPI_FIRSTBIT_MSB;
  hspi1.Init.TIMode = SPI_TIMODE_DISABLE;
  hspi1.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLE;
  hspi1.Init.CRCPolynomial = 7;
  if (HAL_SPI_Init(&hspi1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN SPI1_Init 2 */

  /* USER CODE END SPI1_Init 2 */

}

/**
  * @brief SPI2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_SPI2_Init(void)
{

  /* USER CODE BEGIN SPI2_Init 0 */

  /* USER CODE END SPI2_Init 0 */

  /* USER CODE BEGIN SPI2_Init 1 */

  /* USER CODE END SPI2_Init 1 */
  /* SPI2 parameter configuration*/
  hspi2.Instance = SPI2;
  hspi2.Init.Mode = SPI_MODE_MASTER;
  hspi2.Init.Direction = SPI_DIRECTION_2LINES;
  hspi2.Init.DataSize = SPI_DATASIZE_8BIT;
  hspi2.Init.CLKPolarity = SPI_POLARITY_LOW;
  hspi2.Init.CLKPhase = SPI_PHASE_1EDGE;
  hspi2.Init.NSS = SPI_NSS_SOFT;
  hspi2.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_2;
  hspi2.Init.FirstBit = SPI_FIRSTBIT_MSB;
  hspi2.Init.TIMode = SPI_TIMODE_DISABLE;
  hspi2.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLE;
  hspi2.Init.CRCPolynomial = 7;
  if (HAL_SPI_Init(&hspi2) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN SPI2_Init 2 */

  /* USER CODE END SPI2_Init 2 */

}

/**
  * @brief TIM2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM2_Init(void)
{

  /* USER CODE BEGIN TIM2_Init 0 */

  /* USER CODE END TIM2_Init 0 */

  TIM_MasterConfigTypeDef sMasterConfig = {0};
  TIM_OC_InitTypeDef sConfigOC = {0};

  /* USER CODE BEGIN TIM2_Init 1 */

  /* USER CODE END TIM2_Init 1 */
  htim2.Instance = TIM2;
  htim2.Init.Prescaler = 3200-1;
  htim2.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim2.Init.Period = 100-1;
  htim2.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim2.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_PWM_Init(&htim2) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim2, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sConfigOC.OCMode = TIM_OCMODE_PWM1;
  sConfigOC.Pulse = 0;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
  if (HAL_TIM_PWM_ConfigChannel(&htim2, &sConfigOC, TIM_CHANNEL_1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM2_Init 2 */

  /* USER CODE END TIM2_Init 2 */
  HAL_TIM_MspPostInit(&htim2);

}

/**
  * @brief TIM3 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM3_Init(void)
{

  /* USER CODE BEGIN TIM3_Init 0 */

  /* USER CODE END TIM3_Init 0 */

  TIM_MasterConfigTypeDef sMasterConfig = {0};
  TIM_OC_InitTypeDef sConfigOC = {0};

  /* USER CODE BEGIN TIM3_Init 1 */

  /* USER CODE END TIM3_Init 1 */
  htim3.Instance = TIM3;
  htim3.Init.Prescaler = 3200-1;
  htim3.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim3.Init.Period = 100-1;
  htim3.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim3.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_PWM_Init(&htim3) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim3, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sConfigOC.OCMode = TIM_OCMODE_PWM1;
  sConfigOC.Pulse = 0;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
  if (HAL_TIM_PWM_ConfigChannel(&htim3, &sConfigOC, TIM_CHANNEL_1) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIMEx_RemapConfig(&htim3, TIM3_TI1_GPIO) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_ConfigChannel(&htim3, &sConfigOC, TIM_CHANNEL_2) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_ConfigChannel(&htim3, &sConfigOC, TIM_CHANNEL_3) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_ConfigChannel(&htim3, &sConfigOC, TIM_CHANNEL_4) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM3_Init 2 */

  /* USER CODE END TIM3_Init 2 */
  HAL_TIM_MspPostInit(&htim3);

}

/**
  * @brief USART1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART1_UART_Init(void)
{

  /* USER CODE BEGIN USART1_Init 0 */

  /* USER CODE END USART1_Init 0 */

  /* USER CODE BEGIN USART1_Init 1 */

  /* USER CODE END USART1_Init 1 */
  huart1.Instance = USART1;
  huart1.Init.BaudRate = 9600;
  huart1.Init.WordLength = UART_WORDLENGTH_8B;
  huart1.Init.StopBits = UART_STOPBITS_1;
  huart1.Init.Parity = UART_PARITY_NONE;
  huart1.Init.Mode = UART_MODE_TX_RX;
  huart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart1.Init.OverSampling = UART_OVERSAMPLING_16;
  huart1.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
  huart1.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;
  if (HAL_UART_Init(&huart1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART1_Init 2 */

  /* USER CODE END USART1_Init 2 */

}

/**
  * @brief USART2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART2_UART_Init(void)
{

  /* USER CODE BEGIN USART2_Init 0 */

  /* USER CODE END USART2_Init 0 */

  /* USER CODE BEGIN USART2_Init 1 */

  /* USER CODE END USART2_Init 1 */
  huart2.Instance = USART2;
  huart2.Init.BaudRate = 9600;
  huart2.Init.WordLength = UART_WORDLENGTH_8B;
  huart2.Init.StopBits = UART_STOPBITS_1;
  huart2.Init.Parity = UART_PARITY_NONE;
  huart2.Init.Mode = UART_MODE_RX;
  huart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart2.Init.OverSampling = UART_OVERSAMPLING_16;
  huart2.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
  huart2.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;
  if (HAL_UART_Init(&huart2) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART2_Init 2 */

  /* USER CODE END USART2_Init 2 */

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOH_CLK_ENABLE();
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPS_NRST_GPIO_Port, GPS_NRST_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOB, SPI2_NCS_Pin|TIM4_CH3_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOA, BT_RESET_Pin|SD_CS_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin : ACC_INT_Pin */
  GPIO_InitStruct.Pin = ACC_INT_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_RISING;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(ACC_INT_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : GPS_PPS_Pin */
  GPIO_InitStruct.Pin = GPS_PPS_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(GPS_PPS_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : GPS_NRST_Pin */
  GPIO_InitStruct.Pin = GPS_NRST_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPS_NRST_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pins : SPI2_NCS_Pin TIM4_CH3_Pin */
  GPIO_InitStruct.Pin = SPI2_NCS_Pin|TIM4_CH3_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

  /*Configure GPIO pins : BT_RESET_Pin SD_CS_Pin */
  GPIO_InitStruct.Pin = BT_RESET_Pin|SD_CS_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
