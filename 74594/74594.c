
#include <wiringPi.h>
#include <stdio.h>

#define GPIO_18 1
#define GPIO_19 24
#define GPIO_20 28
#define GPIO_21 29

#define SER   GPIO_18
#define RCLK  GPIO_19
#define SCLK  GPIO_20
#define CLR_N GPIO_21



int main() {

    int err = wiringPiSetup () ;
    if (err != 0) {
      printf("ERROR setting up wiringPi: %X\n", err);
      return 1;
    }
    printf("Setup Complete\n");
    
    pinMode(SER, OUTPUT);
    pullUpDnControl(SER, PUD_DOWN);

    pinMode(RCLK, OUTPUT);
    pullUpDnControl(RCLK, PUD_DOWN);

    pinMode(SCLK, OUTPUT);
    pullUpDnControl(SCLK, PUD_DOWN);
    
    pinMode(CLR_N, OUTPUT);
    pullUpDnControl(CLR_N, PUD_UP);
    
    for (int i = 0; i <= 0xFF; i++){
      printf("%d\n", i);
      int j = i;
      
      for (int k = 0; k < 8; k++) {
        digitalWrite(SER, j & 0x01);
        digitalWrite(SCLK, 1);
        delay(1);
        digitalWrite(SCLK, 0);
        delay(1);
        j >>= 1;
      }
      digitalWrite(RCLK, 1);
      delay(1);
      digitalWrite(RCLK, 0);
      delay(5);
    }
    
    delay(1000);
    digitalWrite(CLR_N, 0);
    delay(10);
    digitalWrite(CLR_N, 1);
}


    
      

