package wiring_pi

import (
	"components"
	"fmt"
	"testing"
	"time"
)

func TestInitialize(t *testing.T) {
	if err := Init(); err != nil {
		t.Fatalf("%s", err)
	}
}

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

	SER.PullUp(PUD_DOWN)
	RCLK.PullUp(PUD_DOWN)
	SCLK.PullUp(PUD_DOWN)
	CLR_N.PullUp(PUD_UP)

	CLR_N.DigitalWrite(1)

	for {
		for i := 0; i <= 0xFF; i++ {
			fmt.Printf("%d\n", i)
			j := i

			for k := 0; k < 8; k++ {
				SER.DigitalWrite(j & 0x01)
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

func Test74594T(t *testing.T) {
	sr74596 := components.NewSNx4HC594(SER, SCLK, CLR_N, RCLK, CLR_N, time.Millisecond)

	for {
		for i := byte(0); i <= 0xFF; i++ {
			fmt.Printf("%d\n", i)
			sr74596.LoadAndLatch(i)
			time.Sleep(10 * time.Millisecond)
		}
	}
}
