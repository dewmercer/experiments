package wiring_pi

// #cgo LDFLAGS: -lwiringPi -L$GOPATH/lib
// #cgo CFLAGS: -I$GOPATH/include
// #include <wiringPi.h>
import "C"

import (
	"encoding/binary"
	"errors"
	"fmt"
	"sync"
	"unsafe"
)
func init(){
	err := Init()
	if err != nil{
		panic(err.Error())
	}
}

var NativeEndian binary.ByteOrder

var initialized bool

var initMutex = sync.Mutex{}

func Init() error {
	if initialized{
		return nil
	}
	initMutex.Lock()
	defer initMutex.Unlock()

	if initialized{
		return nil
	}

	buf := [2]byte{}
	*(*uint16)(unsafe.Pointer(&buf[0])) = uint16(0xABCD)

	switch buf {
	case [2]byte{0xCD, 0xAB}:
		NativeEndian = binary.LittleEndian
	case [2]byte{0xAB, 0xCD}:
		NativeEndian = binary.BigEndian
	default:
		return errors.New("Could not determine native endianness.")
	}

	if err := C.wiringPiSetup(); err != 0 {
		return fmt.Errorf("wiringPiSetup returned: %d", err)
	}

	initialized = true
	return nil
}
