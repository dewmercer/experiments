package wiring_pi

import (
	"fmt"
	"testing"
	"time"
)

const (
	SER   Pin = GPIO_18
	RCLK  Pin = GPIO_19
	SCLK  Pin = GPIO_20
	CLR_N Pin = GPIO_21
)

func Test74594(t *testing.T) {
	const (
		SER   Pin = GPIO_18
		RCLK  Pin = GPIO_19
		SCLK  Pin = GPIO_20
		CLR_N Pin = GPIO_21
	)

	SER.Mode(OUTPUT)
	RCLK.Mode(OUTPUT)
	SCLK.Mode(OUTPUT)
	CLR_N.Mode(OUTPUT)

	SER.PullUpDown(PUD_DOWN)
	RCLK.PullUpDown(PUD_DOWN)
	SCLK.PullUpDown(PUD_DOWN)
	CLR_N.PullUpDown(PUD_UP)

	CLR_N.DigitalWrite(1)

	for {
		for i := 0; i <= 0xFF; i++ {
			fmt.Printf("%d\n", i)
			j := i

			for k := 0; k < 8; k++ {
				SER.DigitalWrite(PinLevel(j & 0x01))
				SCLK.DigitalWrite(1)
				time.Sleep(1 * time.Millisecond)
				SCLK.DigitalWrite(0)
				time.Sleep(10 * time.Millisecond)
				j >>= 1
			}
			RCLK.DigitalWrite(1)
			time.Sleep(1 * time.Millisecond)
			RCLK.DigitalWrite(0)
			time.Sleep(10 * time.Millisecond)
		}
	}
}