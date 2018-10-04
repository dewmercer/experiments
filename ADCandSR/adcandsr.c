#include <stdio.h>
#include <string.h>
#include <errno.h>
#include "errors.h"
#include "tlv2556ipwr.h"
#include "utils.h"

#define ADC_SPI_CHANNEL 0
#define BUS_SPEED 100000

int main ()
{
  int adcFd = UNKNOWN_ERROR;
  if ((adcFd = TLV2556IPWRSetup(ADC_SPI_CHANNEL, BUS_SPEED)) < 0) {
    printf("error setting up TLV2556IPWR: %d\n", adcFd);
    return adcFd;
  }

  int pins[TLV2556IPWR_NUM_INPUT_LINES];
  unsigned char results[TLV2556IPWR_NUM_INPUT_LINES];
  
  for (int i = 0;i<TLV2556IPWR_NUM_INPUT_LINES;i++){
    pins[i] = i;
  }
  
  TLV2556IPWRReadPins(0, pins, results, TLV2556IPWR_NUM_INPUT_LINES);
  
  for (int i = 0;i<TLV2556IPWR_NUM_INPUT_LINES;i++){
    printf("pin %d => %d\n", i, results[i]);
  }
  return 0 ;
}
