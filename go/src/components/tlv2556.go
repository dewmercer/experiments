package components

import (
	"fmt"
	"wiring_pi/spi"
)

const(
// Note:  While the ty255674 only hs 11 channels channels
// Channels 0x0B thru 0x0E are used for onboard self test
// and 0x0F is used to access Config register 2
TLV2556IPWR_NUM_CHANNELS = 0x0F
TLV2556IPWR_NUM_INPUT_LINES = 11

// = CFGR1 = Bits
TLV2556IPWR_8_BIT_OUTPUT byte = 0x04
TLV2556IPWR_12_BIT_OUTPUT byte = 0x08
TLV2556IPWR_16_BIT_OUTPUT byte = 0x0c

TLV2556IPWR_MSB_FIRST byte = 0x00
TLV2556IPWR_LSB_FIRST byte = 0x20

TLV2556IPWR_UNIPOLAR_OUTPUT byte = 0x00
TLV2556IPWR_TWOS_COMPLIMENT_OUTPUT byte = 0x01

// = CFGR2 = Bits
TLV2556IPWR_SELECT_CFGR2 byte = 0xF0

TLV2556IPWR_INTERNAL_4V_REF byte = 0x00
TLV2556IPWR_INTERNAL_2V_REF = 0x04
TLV2556IPWR_EXTERNAL_REF byte = 0x0c

TLV2556IPWR_19_EOC byte = 0x00
TLV2556IPWR_19_INT byte = 0x02

TLV2556IPWR_NORMAL_MODE byte = 0x00
TLV2556IPWR_DEFAULT_MODE byte = 0x01

CFGR1 = TLV2556IPWR_8_BIT_OUTPUT        |
TLV2556IPWR_MSB_FIRST                   |
TLV2556IPWR_UNIPOLAR_OUTPUT;

CFGR2 = TLV2556IPWR_SELECT_CFGR2        |
TLV2556IPWR_EXTERNAL_REF                |
TLV2556IPWR_19_EOC                      |
TLV2556IPWR_NORMAL_MODE;
)


type tlv2556 struct{
	*spi.SPI
}

func NewTLV2556(channel spi.Channel, speed int)(*tlv2556, error) {
	retSpi, err := spi.NewSPI(channel, speed)
	if err != nil {
		return nil, err
	}

	err = retSpi.Write1(CFGR2)
	if err != nil{
		return nil, fmt.Errorf("setting up SPI on channel %d: %q", channel, err)
	}
	return &tlv2556{SPI: retSpi}, nil
}

func (adc *tlv2556)Release(){
	adc.SPI.Release()
	adc.SPI = nil
}

func (adc *tlv2556)ReadPin(pin int) (int, error) {
	formattedPin := byte((byte(pin) << 4) | CFGR1)
	err := adc.Write1(formattedPin)
	if err != nil{
		return -1, err
	}
	var data byte
	data, err = adc.Read1()
	if err != nil{
		return -1, err
	}

	return int(data), nil
}
