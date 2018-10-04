#ifdef __cplusplus
extern "C" {
# endif

  // Note:  While the ty255674 only hs 11 channels channels
  // Channels 0x0B thru 0x0E are used for onboard self test
  // and 0x0F is used to access Config register 2
  #define TLV2556IPWR_NUM_CHANNELS 0x0F
  #define TLV2556IPWR_NUM_INPUT_LINES 11
  
  
int TLV2556IPWRSetup (int spiChannel, int speed);

int TLV2556IPWRRead (int spiChannel, unsigned char pin, unsigned char *rxData);

int TLV2556IPWRReadMany (int spiChannel, unsigned char *pins, unsigned char *rxData, int len);

#ifdef __cplusplus
}
#endif
