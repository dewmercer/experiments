package i2c

// #cgo LDFLAGS: -lwiringPi -L$GOPATH/lib
// #cgo CFLAGS: -I$GOPATH/include
// #include <wiringPiI2C.h>
import "C"
import (
	"fmt"
	"sync"
)

type I2C struct{
	address int
	fd C.int
}

var reservedDevices = []int{}
var i2cMutex = sync.Mutex{}

func NewI2C(address int) (*I2C, error) {
	i2cMutex.Lock()
	defer i2cMutex.Unlock()

	for _,v := range reservedDevices{
		if v == address{
			return nil, fmt.Errorf("device %d is reserved", address)
		}
	}

	var res, err = C.wiringPiI2CSetup(C.int(address))
	if res < C.int(0) {
		return nil, fmt.Errorf("error calling wiringPiI2CSetup.  errno: %q", err)
	}

	reservedDevices = append(reservedDevices, address)
	return &I2C{address:address, fd: res}, nil
}

func (i2c *I2C)Release(){
	for i, v := range reservedDevices{
		if v == i2c.address{
			reservedDevices = append(reservedDevices[:i], reservedDevices[i+1:]...)
			return
		}
	}
}

func (i2c *I2C)ReadByte() (byte, error) {
	var res, err = C.wiringPiI2CRead(i2c.fd)
	if res == C.int(-1) {
		return byte(0), fmt.Errorf("error reading. errno: %q", err)
	}
	return byte(C.uchar(res)), nil
}


