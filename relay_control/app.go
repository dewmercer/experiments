package main

import (
"gobot.io/x/gobot/drivers/gpio"
	"gobot.io/x/gobot/platforms/raspi"
	"time"
)
const(
	GPIO24 = "18"
)
func main() {
	r := raspi.NewAdaptor()
	pin := gpio.NewDirectPinDriver(r, GPIO24)
	if err := pin.On();err != nil {
	println(err)
}
	for true {
		println("Off")
		if err := pin.Off();err != nil {
	println(err)
}
		time.Sleep(time.Second)
		println("On")
	if err := pin.On();err != nil {
	println(err)
}
		time.Sleep(time.Second)
	}

}
