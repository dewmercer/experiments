package spi

// #cgo LDFLAGS: -lwiringPi -L$GOPATH/lib
// #cgo CFLAGS: -I$GOPATH/include
// #include <wiringPiSPI.h>
// #include <stdlib.h>
import "C"

import (
	"fmt"
	"sync"
	"wiring_pi"
	"wiring_pi/physical_pin"
)

func init(){
	wiring_pi.Init()
}

type SPI struct{
	channel Channel
	fd C.int
}

type Channel int
const (
	Channel_0 Channel = 0
	Channel_1 Channel = 1
)

func (c Channel)Name() string{
	switch c {
	case Channel_0:
		return "Channel_0"
	default:
		return "Channel_1"
	}
}

func (c Channel)c_int() C.int{
	switch c {
	case Channel_0:
		return C.int(0)
	default:
		return C.int(1)
	}
}

const undefinedBusSpeed = -1

var busSpeed = undefinedBusSpeed

var reservedChannels = map[Channel]bool{
	Channel_0:false,
	Channel_1:false,
}

type Pin int
const (
	mosi Pin = 19
	miso Pin = 21
	clk Pin = 23
	ce_0 Pin = 24
	ce_1 Pin = 26
)

var pinName = map[Pin]string{
	mosi: "MOSI",
	miso: "MISO",
	clk:  "CLK",
	ce_0: "CE_0",
	ce_1: "CE_1",
}

func (p Pin)Int() int{
	return int(p)
}

func (p Pin)Name() string{
	if name, ok := pinName[p];ok{
		return name
	}
	return "unknown pin"
}

var spiReservationMutex = sync.Mutex{}

var commonControlPins  = []Pin{mosi, miso, clk}

func NewSPI (channel Channel, speed int) (*SPI, error) {
	spiReservationMutex.Lock()
	defer spiReservationMutex.Unlock()

	if reservedChannels[channel]{
		return nil, fmt.Errorf("channel %s already reserved", channel.Name())
	}

	if busSpeed != undefinedBusSpeed && speed != busSpeed{
		return nil, fmt.Errorf("cannot set bus speed to %d as it is already set to %d", speed, busSpeed)
	}

	physical_pin.PinReservationMutex.Lock()
	defer physical_pin.PinReservationMutex.Unlock()

	pinsToRelease := []int{}

	if !reservedChannels[Channel_0] && !reservedChannels[Channel_1]{
		for i := 0;i<len(commonControlPins);i++{
			if err := physical_pin.UnsynchronizedReserve(commonControlPins[i].Int()); err != nil{
				for p := range pinsToRelease {
					physical_pin.Release(p)
				}
				return nil, fmt.Errorf("cannot reserve pin %s: %q", commonControlPins[i].Name(), err)
			}
			pinsToRelease = append(pinsToRelease, commonControlPins[i].Int())
		}
	}

	var channelPin Pin
	switch channel {
	case Channel_0:
		channelPin = ce_0
	case Channel_1:
		channelPin = ce_1
	}

	if err := physical_pin.UnsynchronizedReserve(channelPin.Int()); err != nil{
		for p := range pinsToRelease {
			physical_pin.Release(p)
		}
		return nil, fmt.Errorf("cannot reserve pin %s: %q", channelPin.Name(), err)
	}

	spi := &SPI{channel:channel}
	if spi.fd = C.wiringPiSPISetup(channel.c_int(), C.int(speed)); spi.fd <= 0{
		spi.unsynchronizedRelease()
		return nil, fmt.Errorf("wiringPiSPISetup returned %d", int(spi.fd))
	}

	reservedChannels[channel] = true
	return spi, nil
}

func (s *SPI)Release(){
	spiReservationMutex.Lock()
	defer spiReservationMutex.Unlock()

	physical_pin.PinReservationMutex.Lock()
	defer physical_pin.PinReservationMutex.Unlock()
	s.unsynchronizedRelease() 
}

func (s *SPI) unsynchronizedRelease(){
	releaseAll := false
	switch s.channel{
	case Channel_0:
		physical_pin.UnsynchronizedRelease(ce_0.Int())
		reservedChannels[Channel_0] = false
		releaseAll = !reservedChannels[Channel_1]
	default:
		physical_pin.UnsynchronizedRelease(ce_1.Int())
		reservedChannels[Channel_1] = false
		releaseAll = !reservedChannels[Channel_0]
	}

	if releaseAll{
		for _, v := range commonControlPins {
			physical_pin.UnsynchronizedRelease(v.Int())
		}
		busSpeed = undefinedBusSpeed
	}
}

func (s *SPI)ReadWrite(buffer []byte)([]byte, error){
	cData := C.CBytes(buffer)
	cLen := C.int(len(buffer))
	defer C.free(cData)

	if res, err := C.wiringPiSPIDataRW(s.channel.c_int(), (*C.uchar)(cData), cLen); res == C.int(-1){
		return nil, fmt.Errorf("error calling wiringPiSPIDataRW. errno: %d: %q", res, err)
	}
	return C.GoBytes(cData, cLen), nil
}

func (s *SPI)Write (txData []byte)error {
	_, err := s.ReadWrite(txData);
	return err
}

func (s *SPI)Write1 (txData byte) error {
	data := []byte{txData}
	return s.Write(data);
}

func (s *SPI)Write2 (txData uint16) error {
	data := make([]byte, 2)
	wiring_pi.NativeEndian.PutUint16(data, txData)
	return s.Write(data);
}

func (s *SPI)Write4 (txData uint32) error {
	data := make([]byte, 4)
	wiring_pi.NativeEndian.PutUint32(data, txData)
	return s.Write(data);
}

func (s *SPI)Read (dataLen int) ([]byte, error) {
	return s.ReadWrite(make([]byte, dataLen));
}

func (s *SPI)Read1 () (byte, error) {
	ret, err := s.Read(1)
	if err != nil {
		return 0, err
	}
	return ret[0], nil
}

func (s *SPI)Read2 () (uint16, error) {
	ret, err := s.Read(2)
	if err != nil {
		return 0, err
	}
	return wiring_pi.NativeEndian.Uint16(ret), nil
}

func (s *SPI)Read4 () (uint32, error) {
	ret, err := s.Read(4)
	if err != nil {
		return 0, err
	}
	return wiring_pi.NativeEndian.Uint32(ret), nil
}
