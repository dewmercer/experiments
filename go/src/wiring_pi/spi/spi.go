package spi

// #cgo LDFLAGS: -lwiringPi
// #include <wiringPiSPI.h>
import "C"
import (
	"fmt"
	"sync"
	"wiring_pi/physical_pin"
)

type SPI struct {
	channel Channel
}

type Channel int

const (
	Channel_0 Channel = 0
	Channel_1 Channel = 1
)

func (c Channel) Name() string {
	switch c {
	case Channel_0:
		return "Channel_0"
	default:
		return "Channel_1"
	}
}

func (c Channel) c_int() C.int {
	switch c {
	case Channel_0:
		return C.int(0)
	default:
		return C.int(1)
	}
}

var reservedChannels = map[Channel]bool{
	Channel_0: false,
	Channel_1: false,
}

type Pin int

const (
	mosi Pin = 19
	miso Pin = 21
	clk  Pin = 23
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

func (p Pin) Int() int {
	return int(p)
}

func (p Pin) Name() string {
	if name, ok := pinName[p]; ok {
		return name
	}
	return "unknown pin"
}

var spiReservationMutex = sync.Mutex{}

func NewSPI(channel Channel, speed int) (*SPI, error) {
	spiReservationMutex.Lock()
	defer spiReservationMutex.Unlock()

	if reservedChannels[channel] {
		return nil, fmt.Errorf("channel %s already reserved", channel.Name())
	}

	physical_pin.PinReservationMutex.Lock()
	defer physical_pin.PinReservationMutex.Unlock()

	pinsToRelease := []int{}
	commonPins := []Pin{mosi, miso, clk}

	if !reservedChannels[Channel_0] && !reservedChannels[Channel_1] {
		for i := 0; i < len(commonPins); i++ {
			if err := physical_pin.UnsynchronizedReserve(commonPins[i].Int()); err != nil {
				for p := range pinsToRelease {
					physical_pin.Release(p)
				}
				return nil, fmt.Errorf("cannot reserve pin %s: %q", commonPins[i].Name(), err)
			}
			pinsToRelease = append(pinsToRelease, commonPins[i].Int())
		}
	}

	var channelPin Pin
	switch channel {
	case Channel_0:
		channelPin = ce_0
	case Channel_1:
		channelPin = ce_1
	}

	if err := physical_pin.UnsynchronizedReserve(channelPin.Int()); err != nil {
		for p := range pinsToRelease {
			physical_pin.Release(p)
		}
		return nil, fmt.Errorf("cannot reserve pin %s: %q", channelPin.Name(), err)
	}

	if res := C.wiringPiSPISetup(channel.c_int(), C.int(speed)); res <= 0 {
		return nil, fmt.Errorf("wiringPiSPISetup returned %d", int(res))
	}

	reservedChannels[channel] = true
	return &SPI{channel: channel}, nil
}

func (s SPI) Release() {
	physical_pin.PinReservationMutex.Lock()
	defer physical_pin.PinReservationMutex.Unlock()

	releaseAll := false
	switch s.channel {
	case Channel_0:
		physical_pin.UnsynchronizedRelease(ce_0.Int())
		releaseAll = !reservedChannels[Channel_1]
	default:
		physical_pin.UnsynchronizedRelease(ce_1.Int())
		releaseAll = !reservedChannels[Channel_0]
	}

	if releaseAll {
		commonPins := []Pin{mosi, miso, clk}
		for _, v := range commonPins {
			physical_pin.UnsynchronizedRelease(v.Int())
		}
	}
}
