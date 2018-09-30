#ifdef __cplusplus
extern "C" {
# endif

  // Note:  While the ty255674 only hs 11 channels channels
  // Channels 0x0B thru 0x0E are used for onboard self test
  // and 0x0F is used to access Config register 2
  #define TLV2556IPWR_NUM_CHANNELS 0x0F
  #define TLV2556IPWR_NUM_INPUT_LINES 11
  
  int tlv2556ipwrSetup(int pinBase, int spiChannel, int speed);

#ifdef __cplusplus
}
#endif
