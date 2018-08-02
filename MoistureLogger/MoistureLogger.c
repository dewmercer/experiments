
#include <wiringPi.h>
#include <wiringPiI2C.h>
#include <pcf8591.h>
#include <time.h>

#include <stdio.h>

#define ADAC_ADDRESS 0x48

#define pinbase 64          //any number above 64
#define A0 pinbase + 0
#define A1 pinbase + 1

#define SAMPLE_INTERVAL_SECONDS 60

#define DATA_FILE "/home/pi/moisture.log"

#define TIME_BUFFER_SIZE 256
char timeBuffer[TIME_BUFFER_SIZE];

#define TIME_FORMAT "%F %T"
#define LOG_FORMAT "%s, %2f, %2f\n"

int main() {
    int err = wiringPiSetup () ;
    if (err != 0) {
      printf("ERROR setting up wiringPi: %X\n", err);
      return 1;
    }    
    printf("Wiring Pi Setup.\n");

    err = pcf8591Setup(pinbase,ADAC_ADDRESS);
    if (err < 0) {
      printf("ERROR setting up I2C: %X\n", err);
      return 1;
    }    
    printf("I2C Setup\n");
    
    time_t rawtime;
    struct tm * timeinfo;

    int a0 = 0;
    int a1 = 0;
    while(1){
        a0 = analogRead(A0);  //read A0 pin
        a1 = analogRead(A1);  //read A0 pin
        float val0 = (float)a0 / 255.0 * 5.0  ;  // calculate voltage
        float val1 = (float)a1 / 255.0 * 5.0  ;  // calculate voltage
        
        time (&rawtime);
        timeinfo = localtime (&rawtime);
        int len = strftime(timeBuffer, TIME_BUFFER_SIZE, TIME_FORMAT, timeinfo);
        timeBuffer[len] = 0x00;
        
        printf(LOG_FORMAT, timeBuffer, val0, val1);
        FILE* file = fopen(DATA_FILE, "a");
        fprintf(file, LOG_FORMAT, timeBuffer, val0, val1);
        fclose(file);
        delay(SAMPLE_INTERVAL_SECONDS * 1000);
    }
    
    return 0;
}
