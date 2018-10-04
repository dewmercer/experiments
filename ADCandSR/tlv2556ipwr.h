#ifdef __cplusplus
extern "C" {
# endif

  // Note:  While the ty255674 only hs 11 channels channels
  // Channels 0x0B thru 0x0E are used for onboard self test
  // and 0x0F is used to access Config register 2
  #define TLV2556IPWR_NUM_CHANNELS 0x0F
  #define TLV2556IPWR_NUM_INPUT_LINES 11
  
  // CFGR1 Bits
  #define TLV2556IPWR_8_BIT_OUTPUT 0b0100
  #define TLV2556IPWR_12_BIT_OUTPUT 0b1000
  #define TLV2556IPWR_16_BIT_OUTPUT 0b1100
  
  #define TLV2556IPWR_MSB_FIRST 0b00
  #define TLV2556IPWR_LSB_FIRST 0b10

  #define TLV2556IPWR_UNIPOLAR_OUTPUT 0b0
  #define TLV2556IPWR_TWOS_COMPLIMENT_OUTPUT 0b1
  
  // CFGR2 Bits
  #define TLV2556IPWR_SELECT_CFGR2 0xF0
  
  #define TLV2556IPWR_INTERNAL_4V_REF 0b0000
  #define TLV2556IPWR_INTERNAL_2V_REF 0b0100
  #define TLV2556IPWR_EXTERNAL_REF 0b1100

  #define TLV2556IPWR_19_EOC 0b00
  #define TLV2556IPWR_19_INT 0b10

  #define TLV2556IPWR_NORMAL_MODE 0b0
  #define TLV2556IPWR_DEFAULT_MODE 0b1

  
int TLV2556IPWRSetup (int spiChannel, int speed);

int TLV2556IPWRReadPins (int spiChannel, int *pinsToRead, unsigned char *pinValues, int len);
int TLV2556IPWRReadPin (int spiChannel, int pinToRead, unsigned char *pinValue);

#ifdef __cplusplus
}
#endif
