#ifdef __cplusplus
extern "C" {
# endif

# ifndef __SPI_H__
# define __SPI_H__


int SpiOpen (int channel, int speed);

int SpiReadWrite(int channel, unsigned char *txData, unsigned char *rxData, int dataLen);

int SpiWrite (int channel, unsigned char *txData, int txDataLen);

int SpiWriteByte (int channel, unsigned char txData);

int SpiRead (int channel, unsigned char *rxData, int rxDataLen);

int SpiReadByte (int channel, unsigned char *rxData);



# endif
#ifdef __cplusplus
}
#endif
