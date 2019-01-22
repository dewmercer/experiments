package wiring_pi

// #cgo LDFLAGS: -lwiringPi
// #include <wiringPi.h>
import "C"

import (
	"fmt"
)

type Pin int

func (p Pin) int() C.int {
	return C.int(p)
}

const (
	GPIO_18 Pin = 1
	GPIO_19     = 24
	GPIO_20     = 28
	GPIO_21     = 29
)

type PinMode int

func (pm PinMode) int() C.int {
	return C.int(pm)
}

const (
	INPUT            PinMode = C.INPUT
	OUTPUT                   = C.OUTPUT
	PWM_OUTPUT               = C.PWM_OUTPUT
	GPIO_CLOCK               = C.GPIO_CLOCK
	SOFT_PWM_OUTPUT          = C.SOFT_PWM_OUTPUT
	SOFT_TONE_OUTPUT         = C.SOFT_TONE_OUTPUT
	PWM_TONE_OUTPUT          = C.PWM_TONE_OUTPUT
)

type PinPullup int

func (pp PinPullup) int() C.int {
	return C.int(pp)
}

const (
	PUD_OFF  PinPullup = C.PUD_OFF
	PUD_DOWN           = C.PUD_DOWN
	PUD_UP             = C.PUD_UP
)

func Init() error {
	if err := C.wiringPiSetup(); err != 0 {
		return fmt.Errorf("wiringPiSetup returned: %d", err)
	}
	return nil
}

func (pin Pin) DigitalWrite(val int) {
	C.digitalWrite(pin.int(), C.int(val))
}

func (pin Pin) Mode(mode PinMode) {
	C.pinMode(pin.int(), mode.int())
}

func (pin Pin) PullUp(pullup PinPullup) {
	C.pullUpDnControl(pin.int(), pullup.int())
}
