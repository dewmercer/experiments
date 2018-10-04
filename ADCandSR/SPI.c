#include <stdint.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>
#include <sys/ioctl.h>
#include <asm/ioctl.h>
#include <linux/spi/spidev.h>
#include <stdio.h>

#include "errors.h"

static const char       *spiDev0  = "/dev/spidev0.0" ;
static const char       *spiDev1  = "/dev/spidev0.1" ;
static const uint8_t     spiBPW   = 8 ;

static uint32_t    spiSpeeds [2] = {0};
static int         spiFds [2] = {0};

int SpiOpen (int channel, int speed)
{
  int fd;
  int ret;
  int mode = 0;
  channel &= 1;

  if (speed <= 0) {
    printf("SPI speed %d is not valid.\n", speed) ;
    ret = SPI_OPEN_ERROR;    
  } else if (spiFds[channel] != 0 && spiSpeeds[channel != speed]) {
    printf("SPI requested of %d is not the same as currently open speed of %d.\n", speed, spiSpeeds[channel]) ;
    ret = SPI_OPEN_ERROR;    
  } else if ((fd = open (channel == 0 ? spiDev0 : spiDev1, O_RDWR)) < 0) {
    printf("Unable to open SPI device: %s\n", strerror (errno)) ;
    ret = SPI_OPEN_ERROR;
  } else {
    ret = fd;
    if (ioctl (fd, SPI_IOC_WR_MODE, &mode) < 0){
      printf("SPI Mode Change failure: %s\n", strerror (errno)) ;
      ret = SPI_MODE_CHANGE_ERROR;
    } else if (ioctl (fd, SPI_IOC_WR_BITS_PER_WORD, &spiBPW) < 0) {
      printf("SPI BPW Change failure: %s\n", strerror (errno)) ;
      ret = SPI_BPW_CHANGE_ERROR;
    } else if (ioctl (fd, SPI_IOC_WR_MAX_SPEED_HZ, &speed) < 0) {
      printf("SPI Speed Change failure: %s\n", strerror (errno)) ;
      ret = SPI_SPEED_CHANGE_ERROR;
    } 
    
    if (ret >= 0) {
      spiSpeeds [channel] = speed ;
      spiFds    [channel] = fd ;
    }
  }

  return ret ;
}

int SpiClose(int channel){
  int ret = 0;
  channel &= 1;
  if (spiFds[channel] != 0) {
    spiFds[channel] = 0;
    spiSpeeds[channel] = 0;
  } else {
    printf("SPI not open\n");
    ret = SPI_NOT_OPEN_ERROR;
  }
  return ret;  
}

int SpiReadWrite(int channel, unsigned char *txData, unsigned char *rxData, int dataLen)
{
  struct spi_ioc_transfer spi ;
  int ret = UNKNOWN_ERROR;
  
  channel &= 1 ;

  memset (&spi, 0, sizeof (spi)) ;

  spi.tx_buf        = (unsigned long)txData;
  spi.rx_buf        = (unsigned long)rxData;
  spi.len           = dataLen;
  spi.delay_usecs   = 0;
  spi.speed_hz      = spiSpeeds [channel];
  spi.bits_per_word = 8;

  if ((ret = ioctl (spiFds [channel], SPI_IOC_MESSAGE(1), &spi)) < 0) {
    printf("SPI ioctl error. ioctl returned %d: %s\n", ret, strerror (errno));
    ret = SPI_IOCTL_ERROR;
  }

/**  
  printf("SPI: DataLen = %d\n", dataLen);
  if(spi.rx_buf != (unsigned long)NULL) {
    for (int i = 0;i<dataLen;i++) {
      printf("%d", rxData[i]);
    }
  }
  */
  return ret;
}

int SpiWrite (int channel, unsigned char *txData, int txDataLen)
{
  return SpiReadWrite(channel, txData, NULL, txDataLen);
}

int SpiWriteByte (int channel, unsigned char txData)
{
  return SpiWrite(channel, &txData, 1);
}

int SpiRead (int channel, unsigned char *rxData, int rxDataLen)
{
  printf("SPIRead\n");
  return SpiReadWrite(channel, NULL, rxData, rxDataLen);
}

int SpiReadByte (int channel, unsigned char *rxData)
{
  printf("SPIReadByte\n");
  return SpiRead(channel, rxData, 1);
}

