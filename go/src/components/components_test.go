package components

import (
	"log"
	"os"
	"os/signal"
	"syscall"
	"testing"
	"time"
	"wiring_pi"
	"wiring_pi/gpio"
)

func init() {
	if err := wiring_pi.Init(); err != nil {
		log.Fatalf("%s", err)
	}

}

const (
	SER   = gpio.GPIO_18
	RCLK  = gpio.GPIO_19
	SCLK  = gpio.GPIO_20
	CLR_N = gpio.GPIO_21
)

func TestSNx4HC594(t *testing.T) {

	stop := false
	handleSigTerm(&stop)

	var snx4hc594 *SNx4HC594
	var err error
	if snx4hc594, err = NewSNx4HC594(SER, SCLK, CLR_N, RCLK, CLR_N, time.Millisecond); err != nil {
		t.Fatalf("failure to instantiate component: %q", err)
	}
	defer snx4hc594.AllClear()
	defer snx4hc594.Release()

	for i := 0; i <= 0xFF && !stop; i++ {
		snx4hc594.LoadAndLatch(byte(i))
		time.Sleep(10 * time.Millisecond)
	}
}

func handleSigTerm(caught *bool, sigs ...os.Signal) {
	if sigs == nil {
		sigs = []os.Signal{syscall.SIGINT, syscall.SIGTERM, syscall.SIGHUP}
	}
	sigChan := make(chan os.Signal, 1)

	signal.Notify(sigChan, sigs...)
	go func() {
		<-sigChan
		*caught = true
		signal.Stop(sigChan)
		close(sigChan)
	}()
}
