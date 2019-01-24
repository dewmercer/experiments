package components

import (
	"time"
	"wiring_pi"
)

type SNx4HC590 struct{
	outputEnable wiring_pi.Pin

	registerClock wiring_pi.Pin
	countClock wiring_pi.Pin

	countEnable wiring_pi.Pin

	clear wiring_pi.Pin

	countPins []wiring_pi.Pin

	clkWidth time.Duration
}

func NewSNx4HC590(
	countClock, registerClock, clear, countEnable, outputEnable wiring_pi.Pin,
	clkWidth time.Duration, countPins ...wiring_pi.Pin) *SNx4HC590 {

	ret := &SNx4HC590{
		outputEnable:outputEnable,
		registerClock:registerClock,
		countClock:countClock,
		countEnable:countEnable,
		clear:clear,

		clkWidth: clkWidth,
	}

	if countClock != wiring_pi.GPIO_NOCONNECT {
		ret.countClock.Mode(wiring_pi.OUTPUT)
		ret.countClock.DigitalWrite(wiring_pi.PL_LOW)
		ret.countClock.PullUpDown(wiring_pi.PUD_DOWN)
	}

	if registerClock != countClock && registerClock != wiring_pi.GPIO_NOCONNECT{
		ret.registerClock.Mode(wiring_pi.OUTPUT)
		ret.registerClock.DigitalWrite(wiring_pi.PL_LOW)
		ret.registerClock.PullUpDown(wiring_pi.PUD_DOWN)
	}

	if outputEnable != wiring_pi.GPIO_NOCONNECT{
		ret.outputEnable.Mode(wiring_pi.OUTPUT)
		ret.outputEnable.DigitalWrite(wiring_pi.PL_HIGH)
		ret.outputEnable.PullUpDown(wiring_pi.PUD_UP)
	}

	if countEnable != outputEnable && countEnable != wiring_pi.GPIO_NOCONNECT{
		ret.countEnable.Mode(wiring_pi.OUTPUT)
		ret.countEnable.DigitalWrite(wiring_pi.PL_HIGH)
		ret.countEnable.PullUpDown(wiring_pi.PUD_UP)
	}

	if clear != wiring_pi.GPIO_NOCONNECT {
		ret.clear.Mode(wiring_pi.OUTPUT)
		ret.clear.DigitalWrite(wiring_pi.PL_HIGH)
		ret.clear.PullUpDown(wiring_pi.PUD_UP)
	}

	if len(countPins) != 0 {
		if len(countPins) > 8 {
			ret.countPins = countPins[:8]
		} else if len(countPins) < 8 {
			highPins := make([]wiring_pi.Pin, 8-len(countPins))
			for i, _ := range highPins{
				highPins[i] = wiring_pi.GPIO_NOCONNECT
			}
			ret.countPins = append(highPins, countPins...)
		}
		for _, v := range ret.countPins{
			if v != wiring_pi.GPIO_NOCONNECT{
				v.Mode(wiring_pi.INPUT)
				v.PullUpDown(wiring_pi.PUD_DOWN)
			}
		}
	}

	ret.Clear()
	return ret
}

func (c *SNx4HC590) Clear(){
	c.clear.PulseLow(c.clkWidth)
}

func (c *SNx4HC590) Read() byte {
	ret := byte(0)
	for i := len(c.countPins)-1; i >= 0; i-- {
		if level, err := c.countPins[i].DigitalRead(); err == nil && level == wiring_pi.PL_HIGH {
			ret += byte(2 ^ i)
		}
	}
	return ret
}

func (c *SNx4HC590)Increment(){
	c.countClock.PulseHigh(c.clkWidth)
}

