package physical_pin

import (
	"fmt"
	"sync"
)

const (
	numPhysicalPins = 40
)

var pinReservationMutex = sync.Mutex{}

var reservations = map[int]bool{}

func init(){
	for i := 0;i<numPhysicalPins;i++{
		reservations[i] = false
	}
}

func IsReserved(pin int) bool{
	return reservations[pin - 1]
}

func Reserve(pin int) error{
	if pin > 0{
		if _, ok := reservations[pin -1];ok {
			pinReservationMutex.Lock()
			defer pinReservationMutex.Unlock()

			if IsReserved(pin){
				return fmt.Errorf("physical pin %d is already reserved", pin)
			}
			reservations[pin -1] = true
			return nil
		}
	}
    return fmt.Errorf("physical pin %d does not exist", pin)
}

func Release(pin int) {
	if pin > 0{
		if _, ok := reservations[pin -1];ok{
			pinReservationMutex.Lock()
			defer pinReservationMutex.Unlock()
			reservations[pin -1] = false
		}
	}
}
