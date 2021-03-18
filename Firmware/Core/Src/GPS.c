#include "GPSConfig.h"
#include "GPS.h"
#include "usart.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

GPS_t GPS;
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
void	GPS_Init(void)
{
	GPS.rxIndex=0;
	HAL_UART_Receive_IT(&_GPS_USART,&GPS.rxTmp,1);	
}
//##################################################################################################################
void	GPS_CallBack(void)
{
	GPS.LastTime=HAL_GetTick();
	if(GPS.rxIndex < sizeof(GPS.rxBuffer)-2)
	{
		GPS.rxBuffer[GPS.rxIndex] = GPS.rxTmp;
		GPS.rxIndex++;
	}	
	HAL_UART_Receive_IT(&_GPS_USART,&GPS.rxTmp,1);
}
//##################################################################################################################
void	GPS_Process(void)
{
	char	*str;
	#if (_GPS_DEBUG==1)
	printf("%s",GPS.rxBuffer);
	#endif
	str=strstr((char*)GPS.rxBuffer,"GNGGA,"); // GNZDA for where the date is in the buffer
	if(str!=NULL)
	{
		memset(&GPS.GPGGA,0,sizeof(GPS.GPGGA));  // resets GPGGA to 0
		// GNGGA for where the position is in the buffer
		sscanf(str,"GNGGA,%f,%f,%c,%f,%c,%d,%d,%f,%f",&GPS.GPGGA.HHMMSS,&GPS.GPGGA.Latitude,&GPS.GPGGA.NS_Indicator,&GPS.GPGGA.Longitude,&GPS.GPGGA.EW_Indicator,&GPS.GPGGA.PositionFixIndicator,&GPS.GPGGA.SatellitesUsed,&GPS.GPGGA.HDOP,&GPS.GPGGA.MSL_Altitude);  // GNGGA instead of GPGGA
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
			GPS.GPGGA.LongitudeDecimal=convertDegMinToDecDeg(GPS.GPGGA.Longitude);
		}
	}
	str=strstr((char*)GPS.rxBuffer,"GNZDA,"); // GNZDA for where the date is in the buffer
	if(str!=NULL) {
		// format: GNZDA,181815.000,03,02,2021
		sscanf(str,"GNZDA,%f,%d,%d,%d",&GPS.GPGGA.HHMMSS,&GPS.GPGGA.UTC_Day,&GPS.GPGGA.UTC_Month,&GPS.GPGGA.UTC_Year);
		GPS.GPGGA.UTC_Hour = (int)(GPS.GPGGA.HHMMSS/10000.f);
		GPS.GPGGA.UTC_Min = (int)GPS.GPGGA.HHMMSS%10000/100;
		GPS.GPGGA.UTC_Sec = (int)GPS.GPGGA.HHMMSS%100;
		GPS.GPGGA.YYMMDD = 10000*GPS.GPGGA.UTC_Year+100*GPS.GPGGA.UTC_Month+GPS.GPGGA.UTC_Day;
		if (GPS.GPGGA.YYMMDD < 19700000) GPS.GPGGA.YYMMDD = 0;
	}
	str=strstr((char*)GPS.rxBuffer,"GNRMC,"); // GNRMC for where the speed is in the buffer
	if(str!=NULL) {
		sscanf(str,"GNRMC,%*f,%*c,%*f,%*c,%*f,%*c,%f",&GPS.GPGGA.Speed_KTS);
		GPS.GPGGA.Speed_KMH = 1.852f * GPS.GPGGA.Speed_KTS; // conversion from knots to km/h
	}
	memset(GPS.rxBuffer,0,sizeof(GPS.rxBuffer)); // resets rxBuffer
	GPS.rxIndex=0;

	HAL_UART_Receive_IT(&_GPS_USART,&GPS.rxTmp,1);
	GPS.LastTime=HAL_GetTick();
}
//##################################################################################################################
