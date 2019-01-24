package components

import (
	"time"
	"wiring_pi"
)

type SR74594 struct {
	serial wiring_pi.Pin

	serialClock wiring_pi.Pin
	serialClear wiring_pi.Pin

	registerClock wiring_pi.Pin
	registerClear wiring_pi.Pin

	clkWidth time.Duration
}

func NewSR74594(
	serial, serialClk, serialClr, registerClk, registerClr wiring_pi.Pin,
	clkWidth time.Duration) *SR74594 {

	ret := &SR74594{
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
	ret.serialClock.DigitalWrite(0)
	ret.serialClock.PullUpDown(wiring_pi.PUD_DOWN)

	if ret.serialClock != ret.registerClock {
		ret.registerClock.Mode(wiring_pi.OUTPUT)
		ret.registerClock.DigitalWrite(0)
		ret.registerClock.PullUpDown(wiring_pi.PUD_DOWN)
	}

	ret.serialClear.Mode(wiring_pi.OUTPUT)
	ret.serialClear.DigitalWrite(1)
	ret.serialClear.PullUpDown(wiring_pi.PUD_UP)

	if ret.serialClear != ret.registerClear {
		ret.registerClear.Mode(wiring_pi.OUTPUT)
		ret.registerClear.DigitalWrite(1)
		ret.registerClear.PullUpDown(wiring_pi.PUD_UP)
	}

	ret.AllClear()
	return ret
}

func (sr *SR74594) SerialClear() {
	sr.serialClear.PulseLow(sr.clkWidth)
}

func (sr *SR74594) RegisterClear() {
	sr.registerClear.PulseLow(sr.clkWidth)
}

func (sr *SR74594) AllClear() {
	sr.SerialClear()
	if sr.serialClear != sr.registerClear {
		sr.RegisterClear()
	}
}

func (sr *SR74594) Load(data byte) {
	for i := 0; i < 8; i++ {
		sr.serial.DigitalWrite(int(data & 0x80))
		sr.serialClock.PulseHigh(sr.clkWidth)
		data <<= 1
	}
}

func (sr *SR74594) Latch() {
	sr.registerClock.PulseHigh(sr.clkWidth)
}

func (sr *SR74594) LoadAndLatch(data byte) {
	sr.Load(data)
	sr.Latch()
}
