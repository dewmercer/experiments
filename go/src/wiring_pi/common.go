package wiring_pi

// #cgo LDFLAGS: -lwiringPi -L$GOPATH/lib
// #cgo CFLAGS: -I$GOPATH/include
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
