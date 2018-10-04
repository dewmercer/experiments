#include "tlv2556ipwr.h"
#include <stdio.h>
#include <string.h>
#include <stdio.h>
#include "SPI.h"

/*
 * tlv2556ipwrSetup:
 */
int TLV2556IPWRSetup (int spiChannel, int speed)
{
  int ret = 0;
  if ((ret = SpiOpen(spiChannel, speed)) > 0){
    unsigned char initCfgR2 = 0b11111110; 
    ret = SpiWrite(spiChannel, &initCfgR2, 1);
  }
  return ret;
}

int TLV2556IPWRReadMany (int spiChannel, unsigned char *pins, unsigned char *rxData, int len)
{
  unsigned char tmpPins[len + 1];
  unsigned char tmpResults[len + 1];
  
  tmpPins[len] = tmpPins[0];
  for (int i =0; i<len;i++){
    tmpPins[i] = (pins[i] << 4) | 0b00000100;
  }
  tmpPins[len] = 0b00000100;
  
  int ret = SpiReadWrite(spiChannel, tmpPins, tmpResults, len + 1);
  memcpy(rxData, &tmpResults[1], len + sizeof(unsigned char));
  return ret;
}
