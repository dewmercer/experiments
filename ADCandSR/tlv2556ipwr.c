#include "tlv2556ipwr.h"
#include <stdio.h>
#include <string.h>
#include <stdio.h>
#include "SPI.h"
#include "errors.h"

static const unsigned char CFGR1 = TLV2556IPWR_8_BIT_OUTPUT   | 
                                   TLV2556IPWR_MSB_FIRST      |  
                                   TLV2556IPWR_UNIPOLAR_OUTPUT;

static const unsigned char CFGR2 = TLV2556IPWR_SELECT_CFGR2   |
                                   TLV2556IPWR_EXTERNAL_REF   |
                                   TLV2556IPWR_19_EOC         |
                                   TLV2556IPWR_NORMAL_MODE;
/*
 * tlv2556ipwrSetup:
 */
int TLV2556IPWRSetup (int spiChannel, int speed)
{
  int ret = 0;
  if ((ret = SpiOpen(spiChannel, speed)) > 0){
    unsigned char initCfgR2 = CFGR2; 
    ret = SpiWrite(spiChannel, &initCfgR2, 1);
  }
  return ret;
}

int TLV2556IPWRReadPins (int spiChannel, int *pinsToRead, unsigned char *pinValues, int len)
{
  if (len <= 0) {
    printf("buffer must be longer than 0 bytes.\n");
    return INVALID_BUFFER_LENGTH;
  }
  unsigned char tmpPins[len + 1];
  unsigned char tmpResults[len + 1];
  
  for (int i =0; i<len;i++){
    if (pinsToRead[i] < 0 || 
        pinsToRead[i] >= TLV2556IPWR_NUM_INPUT_LINES) {
      printf("pin value %d at index %d is not between 0 and %d\n", pinsToRead[i], i, TLV2556IPWR_NUM_INPUT_LINES);
      return INVALID_PIN_NUMBER;
    }
    tmpPins[i] = (pinsToRead[i] << 4) | CFGR1;
  }
  tmpPins[len] = CFGR1;
  
  int ret = SpiReadWrite(spiChannel, tmpPins, tmpResults, len + 1);
  memcpy(pinValues, &tmpResults[1], len * sizeof(unsigned char));
  return ret;
}

int TLV2556IPWRReadPin (int spiChannel, int pinToRead, unsigned char *pinValue)
{
  return TLV2556IPWRReadPins(spiChannel, &pinToRead, pinValue, 1);
}
