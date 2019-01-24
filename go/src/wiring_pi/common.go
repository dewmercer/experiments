package wiring_pi

// #cgo LDFLAGS: -lwiringPi
// #include <wiringPi.h>
import "C"

import (
	"fmt"
)

func Init() error {
	if err := C.wiringPiSetup(); err != 0 {
		return fmt.Errorf("wiringPiSetup returned: %d", err)
	}
	return nil
}

