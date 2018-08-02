
#include <wiringPi.h>
#include <stdio.h>

#define GPIO_17 0
#define GPIO_12 32
#define GPIO_16 36

void Handler();

int risingCount = 0;
int fallingCount = 0;

int main() {
    int err = wiringPiSetup () ;
    if (err != 0) {
      printf("ERROR setting up wiringPi: %X\n", err);
      return 1;
    }    
    printf("Setup Complete\n");
    
    err = wiringPiISR(GPIO_17, INT_EDGE_BOTH, &Handler) ;
    if (err != 0) {
      printf("ERROR setting both handler: %X\n", err);
      return 1;
    }
    printf("Both handler set\n");

/**    
    err = wiringPiISR(GPIO_17, INT_EDGE_FALLING, &fallingHandler);
    if (err != 0) {
      printf("ERROR setting rising handler: %X\n", err);
      return 1;
    }
    printf("Falling Handler set\n");
*/
    printf( "\n\nAny key to exit.");
    getchar( );
}

void Handler() {
  if (digitalRead(GPIO_17) == 0) 
    ++fallingCount;
  else
    ++risingCount;
    
  printf("\nEdge detected: %d : %d\n", risingCount, fallingCount);
}

