package components

import (
	"fmt"
	"time"
	"wiring_pi/gpio"
)

type SNx4HC590 struct {
	outputEnable gpio.Pin

	registerClock gpio.Pin
	countClock    gpio.Pin

	countEnable gpio.Pin

	clear gpio.Pin

	countPins []gpio.Pin

	clkWidth time.Duration
}

func NewSNx4HC590(
	countClock, registerClock, clear, countEnable, outputEnable gpio.Pin,
	clkWidth time.Duration, countPins ...gpio.Pin) (*SNx4HC590, error) {

	if len(countPins) > 8 {
		return nil, fmt.Errorf("expected 8 count pins or less but got %d", len(countPins))
	}

	for _, v := range countPins {
		if !v.Exists() {
			return nil, fmt.Errorf("pin %s does not exist", v.Name())
		}
	}

	if err := gpio.ReserveComponentPins(countClock, registerClock, clear, countEnable, outputEnable); err != nil {
		return nil, err
	}

	ret := &SNx4HC590{
		outputEnable:  outputEnable,
		registerClock: registerClock,
		countClock:    countClock,
		countEnable:   countEnable,
		clear:         clear,

		clkWidth: clkWidth,
	}

	if countClock != gpio.GPIO_NOCONNECT {
		ret.countClock.Mode(gpio.PM_OUTPUT)
		ret.countClock.DigitalWrite(gpio.PL_LOW)
		ret.countClock.PullUpDown(gpio.PUD_DOWN)
	}

	if registerClock != countClock && registerClock != gpio.GPIO_NOCONNECT {
		ret.registerClock.Mode(gpio.PM_OUTPUT)
		ret.registerClock.DigitalWrite(gpio.PL_LOW)
		ret.registerClock.PullUpDown(gpio.PUD_DOWN)
	}

	if outputEnable != gpio.GPIO_NOCONNECT {
		ret.outputEnable.Mode(gpio.PM_OUTPUT)
		ret.outputEnable.DigitalWrite(gpio.PL_HIGH)
		ret.outputEnable.PullUpDown(gpio.PUD_UP)
	}

	if countEnable != outputEnable && countEnable != gpio.GPIO_NOCONNECT {
		ret.countEnable.Mode(gpio.PM_OUTPUT)
		ret.countEnable.DigitalWrite(gpio.PL_HIGH)
		ret.countEnable.PullUpDown(gpio.PUD_UP)
	}

	if clear != gpio.GPIO_NOCONNECT {
		ret.clear.Mode(gpio.PM_OUTPUT)
		ret.clear.DigitalWrite(gpio.PL_HIGH)
		ret.clear.PullUpDown(gpio.PUD_UP)
	}

	if len(countPins) != 0 {
		if len(countPins) < 8 {
			highPins := make([]gpio.Pin, 8-len(countPins))
			for i := range highPins {
				highPins[i] = gpio.GPIO_NOCONNECT
			}
			ret.countPins = append(highPins, countPins...)
		}
		for _, v := range ret.countPins {
			if v != gpio.GPIO_NOCONNECT {
				v.Mode(gpio.PM_INPUT)
				v.PullUpDown(gpio.PUD_DOWN)
			}
		}
	}

	ret.Clear()
	return ret, nil
}

func (c *SNx4HC590) Release() {
	for _, v := range []gpio.Pin{c.outputEnable, c.registerClock, c.countClock, c.countEnable, c.clear} {
		v.Release()
	}
}

func (c *SNx4HC590) Clear() {
	c.clear.PulseLow(c.clkWidth)
}

func (c *SNx4HC590) Read() byte {
	ret := byte(0)
	for i := len(c.countPins) - 1; i >= 0; i-- {
		if level, err := c.countPins[i].DigitalRead(); err == nil && level == gpio.PL_HIGH {
			ret += byte(2 ^ i)
		}
	}
	return ret
}

func (c *SNx4HC590) Increment() {
	c.countClock.PulseHigh(c.clkWidth)
}
