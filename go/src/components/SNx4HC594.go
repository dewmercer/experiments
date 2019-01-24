package components

import (
	"time"
	"wiring_pi"
)

type SNx4HC594 struct {
	serial wiring_pi.Pin

	serialClock wiring_pi.Pin
	serialClear wiring_pi.Pin

	registerClock wiring_pi.Pin
	registerClear wiring_pi.Pin

	clkWidth time.Duration
}

func NewSNx4HC594(
	serial, serialClk, serialClr, registerClk, registerClr wiring_pi.Pin,
	clkWidth time.Duration) *SNx4HC594 {

	ret := &SNx4HC594{
		serial:        serial,
		serialClock:   serialClk,
		serialClear:   serialClr,
		registerClock: registerClk,
		registerClear: registerClr,
		clkWidth:      clkWidth,
	}

	ret.serial.Mode(wiring_pi.OUTPUT)
	ret.serial.PullUpDown(wiring_pi.PUD_DOWN)

	ret.serialClock.Mode(wiring_pi.OUTPUT)
	ret.serialClock.DigitalWrite(wiring_pi.PL_LOW)
	ret.serialClock.PullUpDown(wiring_pi.PUD_DOWN)

	if ret.serialClock != ret.registerClock {
		ret.registerClock.Mode(wiring_pi.OUTPUT)
		ret.registerClock.DigitalWrite(wiring_pi.PL_LOW)
		ret.registerClock.PullUpDown(wiring_pi.PUD_DOWN)
	}

	ret.serialClear.Mode(wiring_pi.OUTPUT)
	ret.serialClear.DigitalWrite(wiring_pi.PL_HIGH)
	ret.serialClear.PullUpDown(wiring_pi.PUD_UP)

	if ret.serialClear != ret.registerClear {
		ret.registerClear.Mode(wiring_pi.OUTPUT)
		ret.registerClear.DigitalWrite(wiring_pi.PL_HIGH)
		ret.registerClear.PullUpDown(wiring_pi.PUD_UP)
	}

	ret.AllClear()
	return ret
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
		sr.serial.DigitalWrite(wiring_pi.PinLevel(data & 0x80))
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
