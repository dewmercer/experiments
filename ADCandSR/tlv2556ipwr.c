#include <wiringPi.h>
#include <wiringPiSPI.h>
#include "tlv2556ipwr.h"
#include <stdio.h>

/*
 * myAnalogRead:
 *	Return the analog value of the given pin
 *********************************************************************************
 */

static int myAnalogRead (struct wiringPiNodeStruct *node, int pin)
{
  unsigned char spiData;
  unsigned char chanBits ;
  int chan = pin - node->pinBase ;

  chanBits = (chan << 4) | 0b0100;
  spiData = chanBits;
  wiringPiSPIDataRW (node->fd, &spiData, 1) ;

  return spiData;
}


/*
 * tlv2556ipwrSetup:
 *	Create a new wiringPi device node for an mcp3004 on the Pi's
 *	SPI interface.
 *********************************************************************************
 */

int tlv2556ipwrSetup (const int pinBase, int spiChannel, int speed)
{
  struct wiringPiNodeStruct *node ;

  if (wiringPiSPISetup (spiChannel, speed) < 0)
    return FALSE ;
    
  node = wiringPiNewNode (pinBase, TLV2556IPWR_NUM_CHANNELS) ;

  node->fd         = spiChannel ;
  node->analogRead = myAnalogRead ;

  // Read the current data from each channel to clear garbage
  // Dont read the last one though as it sets up the last config register
  for (int i = 0; i < TLV2556IPWR_NUM_INPUT_LINES; i++) {
      analogRead(pinBase + i);
  }
  
  return TRUE ;
}
