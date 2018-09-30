#include <stdio.h>
#include <string.h>
#include <errno.h>

#include <wiringPi.h>
#include <wiringPiSPI.h>
#include "tlv2556ipwr.h"

  
#define ADC_PINBASE 64
#define BUS_SPEED 9600
#define ADC_SPI_CHANNEL 0
#define SR_SPI_CHANNEL 1

#define DEFAULT_THRESHOLD 255
#define CHANNEL_0_THRESHOLD 100
#define CHANNEL_1_THRESHOLD 200

#define NUM_SOLENOIDS 8

int main ()
{
  int err = wiringPiSetup();
  if (err != 0) {
    printf("ERROR setting up wiringPi: %X\n", err);
    return err;
  }

  unsigned char thresholds[NUM_SOLENOIDS] = {
    CHANNEL_0_THRESHOLD, 
    CHANNEL_1_THRESHOLD,
    DEFAULT_THRESHOLD,
    DEFAULT_THRESHOLD,
    DEFAULT_THRESHOLD,
    DEFAULT_THRESHOLD,
    DEFAULT_THRESHOLD,
    DEFAULT_THRESHOLD};

  unsigned char solenoidOnMasks[NUM_SOLENOIDS];
  
  for (int i = 0; i< NUM_SOLENOIDS;i++) {
    solenoidOnMasks[i] = 1 << i;
  }
  
  int adcFd = tlv2556ipwrSetup(ADC_PINBASE, ADC_SPI_CHANNEL, BUS_SPEED);

  printf("ADC File Descriptor: %d\n", adcFd);

  int srFd  = wiringPiSPISetup(SR_SPI_CHANNEL, BUS_SPEED);  
  printf("SR File Descriptor: %d\n", srFd);
  
  
  unsigned char srCurrentData = 0;
  unsigned char srData = srCurrentData;
  wiringPiSPIDataRW(SR_SPI_CHANNEL, &srData, 1);
  
  while(TRUE){
    for (int i = 0; i < TLV2556IPWR_NUM_INPUT_LINES; i++) {
      int val = analogRead(ADC_PINBASE + i);
      printf("pin %d value %d\n", i, val);
      
      if (val < thresholds[i] &&
          (srCurrentData & solenoidOnMasks[i]) != 0) {
        printf("turning off: %d\n", i);
        srCurrentData ^= solenoidOnMasks[i];
        srData = srCurrentData;
        wiringPiSPIDataRW(SR_SPI_CHANNEL, &srData, 1);
      } else if (val >= thresholds[i] &&
          (srCurrentData & solenoidOnMasks[i]) == 0) {
        printf("turning on: %d\n", i);
        srCurrentData ^= solenoidOnMasks[i];
        srData = srCurrentData;    
        wiringPiSPIDataRW(SR_SPI_CHANNEL, &srData, 1);
      }
    }
    delay(1000);
  }
  printf ("\n") ;
  return 0 ;
}
