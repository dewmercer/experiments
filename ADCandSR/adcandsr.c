#include <stdio.h>
#include <string.h>
#include <errno.h>
#include "errors.h"
#include "tlv2556ipwr.h"

#include <time.h>

  
#define ADC_PINBASE 64
#define BUS_SPEED 100000
#define ADC_SPI_CHANNEL 0
#define SR_SPI_CHANNEL 1

#define DEFAULT_THRESHOLD 255
#define CHANNEL_0_THRESHOLD 100
#define CHANNEL_1_THRESHOLD 200

#define NUM_SOLENOIDS 8


void delay (unsigned int howLong)
{
  struct timespec sleeper, dummy ;

  sleeper.tv_sec  = (time_t)(howLong / 1000) ;
  sleeper.tv_nsec = (long)(howLong % 1000) * 1000000 ;

  nanosleep (&sleeper, &dummy) ;
}

int main ()
{
  int adcFd = UNKNOWN_ERROR;
  if ((adcFd = TLV2556IPWRSetup(ADC_SPI_CHANNEL, BUS_SPEED)) < 0) {
    printf("error setting up TLV2556IPWR: %d\n", adcFd);
    return adcFd;
  }

  delay(100);
  int pinCount = 11;
  unsigned char pins[pinCount];
  unsigned char results[pinCount];
  
  printf("sizeof(pins) = %d\n", sizeof(pins));
  
  for (unsigned char i = 0;i<pinCount;i++){
    pins[i] = i;
  }
  
  TLV2556IPWRReadMany(0, pins, results, sizeof(pins));
  
  for (int i = 0;i<pinCount;i++){
    printf("pin %d => %d\n", i, results[i]);
  }
  return 0 ;
}
