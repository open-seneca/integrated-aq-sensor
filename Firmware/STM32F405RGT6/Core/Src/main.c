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
#include "adc.h"
#include "dma.h"
#include "fatfs.h"
#include "i2c.h"
#include "spi.h"
#include "tim.h"
#include "usart.h"
#include "usb_device.h"
#include "gpio.h"

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
uint8_t readBuf[8];
uint8_t count = 0;
uint8_t btcmd[19];
FRESULT fres; //Result after operations
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
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

void KX023_read_tilt() {
	HAL_StatusTypeDef status;
	uint16_t addr = 0x1E;
	uint16_t TSCP = 0x10; // Current Tilt Position Register
	uint16_t TSPP = 0x11; // Previous Tilt Position Register
	uint8_t rxBuf[8];
//	status = HAL_I2C_Master_Transmit(&hi2c1, (addr<<1), TSCP, 2, HAL_MAX_DELAY);
//	status = HAL_I2C_Master_Receive(&hi2c1, (addr << 1), (uint8_t *) rxBuf, 6, HAL_MAX_DELAY);

	status = HAL_I2C_Mem_Read(&hi2c1, (addr << 1), TSPP, 2, &rxBuf, 8, HAL_MAX_DELAY);
	status = HAL_I2C_Mem_Read(&hi2c1, (addr << 1), 0x00, 2, &rxBuf, 8, HAL_MAX_DELAY);
}

void initRGBLED() {

	HAL_TIM_PWM_Start(&htim2, TIM_CHANNEL_1);
	HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_1);
	HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_2);
	HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_3);
	HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_4);
	HAL_TIM_PWM_Start(&htim4, TIM_CHANNEL_3);

	setAirLED(100, 100, 100);
	setStatLED(100, 100, 100);

}

void setStatLED(int r, int g, int b) { // values 0-100

	htim2.Instance->CCR1 = r;
	htim3.Instance->CCR1 = g;
	htim3.Instance->CCR2 = b;

}


void flashStatLED(int r, int g, int b) { // values 0-100

	setStatLED(r, g, b);
	HAL_Delay(200);
	setStatLED(100, 100, 100);

}

void setAirLED(int r, int g, int b) { // values 0-100

	htim3.Instance->CCR3 = r;
	htim3.Instance->CCR4 = g;
	htim4.Instance->CCR3 = b;

}

void AirLED_on() {
	if (SPS30.spsData[1] > 30) setAirLED(0, 100, 100); // red
	else if (SPS30.spsData[1] > 10) setAirLED(0, 0, 100); // yellow
	else setAirLED(100, 0, 100); // green
}

void AirLED_off() {
	setAirLED(100, 100, 100);
}

//readUART() {
//	strcpy(readBuf_old, readBuf);
//	HAL_UART_Receive_IT(&huart1,&readBuf,1);
//	if (strcmp(readBuf_old, readBuf) != 0)
//		count++;
//}

void renameBT() {

	/* max length of hm11 name is 12, BT05-A module requires \r\n at the end of every command */
	sprintf(btname, "%s%c%c%c", "OPEN-SENE", SPS30.serial[13], SPS30.serial[14], SPS30.serial[15]);
	uint8_t btcmd[32];
	uint8_t btlen = sprintf(btcmd, "%s%s%s", "AT+NAME", btname, "\r\n");
	HAL_UART_Transmit(&huart1, btcmd, btlen, HAL_MAX_DELAY);
	// reboot module with set changes
	HAL_Delay(50);
	HAL_GPIO_WritePin(GPIOA, BT_RESET_Pin, GPIO_PIN_RESET);
	HAL_Delay(50);
	HAL_GPIO_WritePin(GPIOA, BT_RESET_Pin, GPIO_PIN_SET);

}

void checkBTconn() {
	uint8_t btcmd[32];
	uint8_t btresp[16];
	uint8_t btlen = sprintf(btcmd, "%s", "AT+DISC\r\n");
	HAL_Delay(50);
	HAL_UART_Transmit(&huart1, btcmd, btlen, HAL_MAX_DELAY);
	HAL_Delay(50);
	HAL_UART_Receive_DMA(&huart1, btresp, 16);
	HAL_Delay(50);
}

void generateFilename() {
	int filenumber = 0;
	FRESULT res;
	/* first 3 digits from SPS SN, then 4 digit file counter */
	while (res == FR_OK) {
		sprintf(filename, "%c%c%c%04d.csv", SPS30.serial[13], SPS30.serial[14], SPS30.serial[15], filenumber);
		res = f_open(&fil, filename, FA_READ);
		f_close(&fil);
		filenumber++;
	}
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

	  HAL_ADC_Start(&hadc1);
	  HAL_ADC_PollForConversion(&hadc1, HAL_MAX_DELAY);
	  adcData[0] = HAL_ADC_GetValue(&hadc1);
	  batteryVoltage = adcData[0] * 0.00112556008f;

}

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
  MX_DMA_Init();
  MX_I2C1_Init();
  MX_I2C2_Init();
  MX_USART1_UART_Init();
  MX_ADC1_Init();
  MX_TIM2_Init();
  MX_TIM3_Init();
  MX_TIM4_Init();
  MX_SPI1_Init();
  MX_SPI2_Init();
  MX_USART2_UART_Init();
  MX_USB_DEVICE_Init();
  MX_FATFS_Init();
  /* USER CODE BEGIN 2 */

  HAL_Delay(50);
  updateADC(); // if battery voltage is too low, prevent boot
  HAL_Delay(50);
  initDisplay();
//  if (batteryVoltage < 2.75f) while(1) lowBatteryDisplay();
  welcomeDisplay();

  HAL_GPIO_WritePin(GPIOA, BT_RESET_Pin, GPIO_PIN_SET);
  HAL_Delay(50);
  GPS_Init();
  HAL_Delay(50);
  initRGBLED();
  HAL_Delay(50);
  MX_I2C2_Init(); // reset i2c2 again (needed for it to work!)
  HAL_Delay(50);
  SPS30_start_measurement();
  HAL_Delay(50);
  SPS30_read_serialnumber();
  HAL_Delay(50);
  renameBT();
  checkBTconn();
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

	  /* Read all the sensors */
//	  KX023_read_tilt();

	  /* BT test if connected */
//	  checkBTconn();
//		HAL_Delay(50);
//		HAL_UART_Receive_DMA(&huart1, readBuf, 8);
//		HAL_Delay(50);
//		if (readBuf[0] != 0) {
//			flashStatLED(0,0,0);
//		}
//		if (readBuf) HAL_UART_Transmit(&huart1, "AT+CONNL", 8, HAL_MAX_DELAY); // for HM11 module
// if lost restart module

	  /* Show boot screen until values first become none-zero */
	  while (SPS30_read_data() != 1) {
		  setStatLED(100, 0, 50); // SPS error: cyan LED
		  HAL_Delay(100);
	  }
	  setStatLED(100, 100, 100);
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
	  CDC_Transmit_FS(data, length); // required for COM port
	  HAL_UART_Transmit(&huart1, data, length, HAL_MAX_DELAY);
	  if (saveToSD(&data, length) == -1) noSD = 1;
	  else noSD = 0;
	  AirLED_off();

	  /* Update the display */
	  updateDisplay();

	  /* Increase counter and wait */
	  counter++;
	  while (HAL_GetTick()-millis < 1000) {
		  HAL_Delay(10); // does increasing this delay save power?
	  }

	  /* Set debug LED */
	  if (rh > 100 || rh < 0) flashStatLED(100, 100, 0); // SHT errors: blue LED
	  if (noSD == 1) flashStatLED(0, 100, 0); // SD errors: purple LED
	  if (batteryVoltage < 2.6 || batteryVoltage > 5) flashStatLED(0, 100, 100); // Battery errors: red LED

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

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);
  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLM = 8;
  RCC_OscInitStruct.PLL.PLLN = 72;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 3;
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
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
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
