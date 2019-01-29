package spi

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
	spi0, err := NewSPI(Channel_0, 10)
	if err != nil {
		t.Fatalf(err.Error())
	}

	var spi1 *SPI
	spi1, err = NewSPI(Channel_0, 10)
	if err == nil {
		spi0.Release()
		spi1.Release()
		t.Fatal("allowed double instantiation")
	}
	spi0.Release()

	var spi2 *SPI
	spi2, err = NewSPI(Channel_0, 10)
	if err != nil {
		spi2.Release()
		t.Fatalf(err.Error())
	}

	var spi3 *SPI
	spi3, err = NewSPI(Channel_1, 10)
	if err != nil {
		spi2.Release()
		t.Fatalf(err.Error())
	}
	spi2.Release()
	spi3.Release()
}

func TestSendReceive(t *testing.T){
	spi0, err := NewSPI(Channel_0, 9600)
	if err != nil {
		t.Fatalf(err.Error())
	}

	if res, err := spi0.ReadWrite([]byte{0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01});err != nil{
		t.Fatalf("error calling ReadWrite: %q", err)
	}else {
		for _, v := range res{
			fmt.Printf("%d, ", v)
		}
		fmt.Print("\n")
	}
}
