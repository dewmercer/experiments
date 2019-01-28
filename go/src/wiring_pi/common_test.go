package wiring_pi

import (
	"testing"
)

func TestInitialize(t *testing.T) {
	if err := Init(); err != nil {
		t.Fatalf("%s", err)
	}
}
