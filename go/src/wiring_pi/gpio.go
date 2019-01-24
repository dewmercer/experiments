package wiring_pi

// #cgo LDFLAGS: -lwiringPi
// #include <wiringPi.h>
import "C"
import (
	"errors"
	"time"
)

type PinMode int

func (pm PinMode) c_int() C.int {
	return C.int(pm)
}

const (
	INPUT            = C.INPUT
	OUTPUT           = C.OUTPUT
	PWM_OUTPUT       = C.PWM_OUTPUT
	GPIO_CLOCK       = C.GPIO_CLOCK
	SOFT_PWM_OUTPUT  = C.SOFT_PWM_OUTPUT
	SOFT_TONE_OUTPUT = C.SOFT_TONE_OUTPUT
	PWM_TONE_OUTPUT  = C.PWM_TONE_OUTPUT
)

type PinPullup int

func (pp PinPullup) c_int() C.int {
	return C.int(pp)
}

const (
	PUD_OFF  = C.PUD_OFF
	PUD_DOWN = C.PUD_DOWN
	PUD_UP   = C.PUD_UP
)

type PinLevel int

func (pl PinLevel) c_int() C.int {
	return C.int(pl)
}

const (
	PL_UNDEFINED PinLevel = -1
	PL_LOW  PinLevel = 0
	PL_HIGH PinLevel = 1
)

type Pin int

func (p Pin) c_int() C.int {
	return C.int(p)
}

const (
	GPIO_NOCONNECT Pin = -1
	GPIO_0  Pin = 30
	GPIO_1  Pin = 31
	GPIO_2  Pin = 8
	GPIO_3  Pin = 9
	GPIO_4  Pin = 7
	GPIO_5  Pin = 21
	GPIO_6  Pin = 22
	GPIO_7  Pin = 11
	GPIO_8  Pin = 10
	GPIO_9  Pin = 13
	GPIO_10 Pin = 12
	GPIO_11 Pin = 14
	GPIO_12 Pin = 26
	GPIO_13 Pin = 23
	GPIO_14 Pin = 15
	GPIO_15 Pin = 16
	GPIO_16 Pin = 27
	GPIO_17 Pin = 0
	GPIO_18 Pin = 1
	GPIO_19 Pin = 24
	GPIO_20 Pin = 28
	GPIO_21 Pin = 29
	GPIO_22 Pin = 3
	GPIO_23 Pin = 4
	GPIO_24 Pin = 5
	GPIO_25 Pin = 6
	GPIO_26 Pin = 25
	GPIO_27 Pin = 2
)

func (pin Pin) DigitalWrite(val PinLevel) {
	if pin != GPIO_NOCONNECT {
		C.digitalWrite(pin.c_int(), val.c_int())
	}
}

func (pin Pin) Mode(mode PinMode) {
	if pin != GPIO_NOCONNECT {
		C.pinMode(pin.c_int(), mode.c_int())
	}
}

func (pin Pin) PullUpDown(pullup PinPullup) {
	if pin != GPIO_NOCONNECT {
		C.pullUpDnControl(pin.c_int(), pullup.c_int())
	}
}

func (pin Pin) PulseHigh(width time.Duration) {
	pin.Pulse(PL_HIGH, width)
}

func (pin Pin) PulseLow(width time.Duration) {
	pin.Pulse(PL_LOW, width)
}

func (pin Pin) Pulse(val PinLevel, width time.Duration) {
	pin.DigitalWrite(val)
	time.Sleep(width)
	switch val {
	case PL_LOW:
		pin.DigitalWrite(PL_HIGH)
	case PL_HIGH:
		pin.DigitalWrite(PL_LOW)
	}
}

func (pin Pin) DigitalRead() (PinLevel, error) {
	if pin != GPIO_NOCONNECT {
		return PinLevel(C.digitalRead(pin.c_int())), nil
	}
	return PL_UNDEFINED, errors.New("pin not connected")
}
