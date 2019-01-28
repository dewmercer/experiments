package spi

import (
	"log"
	"testing"
	"wiring_pi"
)

func init() {
	if err := wiring_pi.Init(); err != nil {
		log.Fatalf("%s", err)
	}
}

func TestInstantiation(t *testing.T) {
	spi0, err := NewSPI(Channel_0, 10)
	if err != nil {
		t.Fatalf(err.Error())
	}

	spi0.Release()
}
