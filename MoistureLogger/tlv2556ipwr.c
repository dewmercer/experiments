#include <wiringPi.h>
#include <wiringPiSPI.h>

#include <stdio.h>
#include <stdlib.h>

/*
 * myAnalogRead:
 *	Return the analog value of the given pin
 *********************************************************************************
 */

static int myAnalogRead (struct wiringPiNodeStruct *node, int pin)
{
  unsigned char spiData;
  unsigned char chanBits ;
  uint chan = pin - node->pinBase ;
  
  chanBits = (chan << 4) | 0b0100;
  spiData = chanBits;
  wiringPiSPIDataRW (node->fd, &spiData, 1) ;
  
  // Have to read twice because first read after config is garbage
  spiData = chanBits;
  wiringPiSPIDataRW (node->fd, &spiData, 1) ;

  return spiData;
}


/*
 * ty255674TSetup:
 *	Create a new wiringPi device node for an mcp3004 on the Pi's
 *	SPI interface.
 *********************************************************************************
 */

int tlv2556ipwrSetup (const int pinBase, int spiChannel)
{
  struct wiringPiNodeStruct *node ;

  if (wiringPiSPISetup (spiChannel, 1000000) < 0)
    return FALSE ;

  // Note:  While the ty255674 only hs 11 channels channels 
  // Channels 0x0B thru 0x0E are used for onboard self test 
  // and 0x0F is used to access Config register 2
  node = wiringPiNewNode (pinBase, 0x0F) ;

  node->fd         = spiChannel ;
  node->analogRead = myAnalogRead ;

  return TRUE ;
}
