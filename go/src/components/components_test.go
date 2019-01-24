package components

import (
	"log"
	"os"
	"os/signal"
	"syscall"
	"testing"
	"time"
	"wiring_pi"
)

func init() {
	if err := wiring_pi.Init(); err != nil {
		log.Fatalf("%s", err)
	}

}

const (
	SER   = wiring_pi.GPIO_18
	RCLK  = wiring_pi.GPIO_19
	SCLK  = wiring_pi.GPIO_20
	CLR_N = wiring_pi.GPIO_21
)

func Test74594(t *testing.T) {
	stop := false
	handleSigTerm(&stop)

	sr74594 := NewSNx4HC594(SER, SCLK, CLR_N, RCLK, CLR_N, time.Millisecond)
	defer sr74594.AllClear()

	for !stop {
		for i := 0; i <= 0xFF && !stop; i++ {
			sr74594.LoadAndLatch(byte(i))
			time.Sleep(10 * time.Millisecond)
		}
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
