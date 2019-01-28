package components

import (
	"time"
	"wiring_pi/gpio"
)

type SNx4HC594 struct {
	serial gpio.Pin

	serialClock gpio.Pin
	serialClear gpio.Pin

	registerClock gpio.Pin
	registerClear gpio.Pin

	clkWidth time.Duration
}

func NewSNx4HC594(
	serial, serialClk, serialClr, registerClk, registerClr gpio.Pin,
	clkWidth time.Duration) (*SNx4HC594, error) {

	if err := gpio.ReserveComponentPins(serial, serialClk, serialClr, registerClk, registerClr); err != nil {
		return nil, err
	}

	ret := &SNx4HC594{
		serial:        serial,
		serialClock:   serialClk,
		serialClear:   serialClr,
		registerClock: registerClk,
		registerClear: registerClr,
		clkWidth:      clkWidth,
	}

	ret.serial.Mode(gpio.PM_OUTPUT)
	ret.serial.PullUpDown(gpio.PUD_DOWN)

	ret.serialClock.Mode(gpio.PM_OUTPUT)
	ret.serialClock.DigitalWrite(gpio.PL_LOW)
	ret.serialClock.PullUpDown(gpio.PUD_DOWN)

	if ret.serialClock != ret.registerClock {
		ret.registerClock.Mode(gpio.PM_OUTPUT)
		ret.registerClock.DigitalWrite(gpio.PL_LOW)
		ret.registerClock.PullUpDown(gpio.PUD_DOWN)
	}

	ret.serialClear.Mode(gpio.PM_OUTPUT)
	ret.serialClear.DigitalWrite(gpio.PL_HIGH)
	ret.serialClear.PullUpDown(gpio.PUD_UP)

	if ret.serialClear != ret.registerClear {
		ret.registerClear.Mode(gpio.PM_OUTPUT)
		ret.registerClear.DigitalWrite(gpio.PL_HIGH)
		ret.registerClear.PullUpDown(gpio.PUD_UP)
	}

	ret.AllClear()
	return ret, nil
}

func (sr *SNx4HC594) Release() {
	for _, v := range []gpio.Pin{sr.serial, sr.serialClock, sr.serialClear, sr.registerClock, sr.registerClear} {
		v.Release()
	}
}

func (sr *SNx4HC594) SerialClear() {
	sr.serialClear.PulseLow(sr.clkWidth)
}

func (sr *SNx4HC594) RegisterClear() {
	sr.registerClear.PulseLow(sr.clkWidth)
}

func (sr *SNx4HC594) AllClear() {
	sr.SerialClear()
	if sr.serialClear != sr.registerClear {
		sr.RegisterClear()
	}
}

func (sr *SNx4HC594) Load(data byte) {
	for i := 0; i < 8; i++ {
		sr.serial.DigitalWrite(gpio.PinLevel(data & 0x80))
		sr.serialClock.PulseHigh(sr.clkWidth)
		data <<= 1
	}
}

func (sr *SNx4HC594) Latch() {
	sr.registerClock.PulseHigh(sr.clkWidth)
}

func (sr *SNx4HC594) LoadAndLatch(data byte) {
	sr.Load(data)
	sr.Latch()
}
