package gpio

import (
	"log"
	"testing"
	"wiring_pi"
	"wiring_pi/physical_pin"
)

func init() {
	if err := wiring_pi.Init(); err != nil {
		log.Fatalf("%s", err)
	}
}

func TestReservations(t *testing.T) {
	err := GPIO_2.Reserve()

	if err != nil {
		t.Fatal(err.Error())
	}
	defer GPIO_2.Release()

	if !physical_pin.IsReserved(physicalMapping[GPIO_2]) {
		t.Fatal("failure to reserve GPIO_2")
	}

	if err = GPIO_2.Reserve(); err == nil {
		t.Fatal("GPIO_2 reserved twice")
	}

	GPIO_2.Release()
	if physical_pin.IsReserved(physicalMapping[GPIO_2]) {
		t.Fatal("failure to release GPIO_2")
	}

	origMapping := physicalMapping[GPIO_2]
	restoreGPIO_2 := func() {
		physicalMapping[GPIO_2] = origMapping
	}
	defer restoreGPIO_2()

	for _, i := range []int{0, -1, 41} {
		physicalMapping[GPIO_2] = i
		if err = GPIO_2.Reserve(); err == nil {
			t.Fatalf("invalid mapping reserved: %d", i)
		}
	}
}
