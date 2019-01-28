package physical_pin

import (
	"fmt"
	"sync"
)

const (
	numPhysicalPins = 40
)

var powerPins = map[int]bool{
	1:true,
	2:true,
	6:true,
	9:true,
	14:true,
	17:true,
	20:true,
	25:true,
	30:true,
	34:true,
	39:true,
}

var PinReservationMutex = sync.Mutex{}

var reservations = map[int]bool{}

func init() {
	for i := 0; i < numPhysicalPins; i++ {
		reservations[i] = false
	}
}

func IsReserved(pin int) bool {
	return reservations[pin-1]
}

func Reserve(pin int) error {
	PinReservationMutex.Lock()
	defer PinReservationMutex.Unlock()
	return UnsynchronizedReserve(pin)
}

func UnsynchronizedReserve(pin int) error{
	if pin == 27 || pin == 28{
		return fmt.Errorf("pin %d may not be used", pin)
	}

	if _, ok := powerPins[pin];ok{
		return fmt.Errorf("pin %d is a power pin", pin)
	}

	if pin > 0 {
		if _, ok := reservations[pin-1]; ok {
			if IsReserved(pin) {
				return fmt.Errorf("physical pin %d is already reserved", pin)
			}
			reservations[pin-1] = true
			return nil
		}
	}
	return fmt.Errorf("physical pin %d does not exist", pin)
}

func Release(pin int) {
	PinReservationMutex.Lock()
	defer PinReservationMutex.Unlock()
	UnsynchronizedRelease(pin)
}

func UnsynchronizedRelease(pin int){
	if pin > 0 {
		if _, ok := reservations[pin-1]; ok {
			reservations[pin-1] = false
		}
	}
}
