package i2c

import (
	"fmt"
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
	i2c_0, err := NewI2C(16)
	if err != nil{
		t.Fatalf("instantiation: %q", err)
	}
	defer i2c_0.Release()
}

func TestRead(t *testing.T) {
	i2c_0, err := NewI2C(16)
	if err != nil{
		t.Fatalf("instantiation: %q", err)
	}
	defer i2c_0.Release()

	res, err := i2c_0.ReadByte()
	if err != nil{
		t.Fatalf("error reading byte: %q", err)
	}
	fmt.Printf("%d\n", res)
}
