
#include <wiringPi.h>
#include <pcf8591.h>
#include <mcp3004.h>
#include <time.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#define MCP3008
#if defined(PCF8591)
  #define RESOLUTION 8
  #define SELECTOR 0x48
  #define CHANNELS 4
  int (*setup_ptr)(const int, const int) = &pcf8591Setup;
#elif defined(MCP3008)
  #define RESOLUTION 10
  #define SELECTOR 0
  #define CHANNELS 8
  int (*setup_ptr)(const int, const int) = &mcp3004Setup;
#else
#error "No supported ADC is defined"
#endif

#define pinbase 64      

#define DATA_FILE "/home/pi/moisture.log"

#define TIME_FORMAT "%F %T"
#define LOG_FORMAT 

#define TIME_BUFFER_SIZE 256

int main(int argc, char *argv[]) {
  if (argc != 2) {
    printf("Enter the number of seconds to pause between samples.\n");
    return 1;
  }
  
  int sampleInterval = atoi(argv[1]);
  
  printf("Sampeling every %d seconds\n", sampleInterval);
  
  const float DIVISOR = pow(2, RESOLUTION);
  char timeBuffer[TIME_BUFFER_SIZE];
  
  int err = wiringPiSetup () ;
  if (err != 0) {
    printf("ERROR setting up wiringPi: %X\n", err);
    return 1;
  }    
  printf("Wiring Pi Setup: %d\n", err);

  err = (*setup_ptr)(pinbase, SELECTOR);
  if (err == 0) {
    printf("ERROR setting up ADC: %X\n", err);
    return 1;
  }    
  printf("ADC Setup: %d\n", err);
    
  time_t rawtime;
  struct tm * timeinfo;

  while(1){
    time (&rawtime);
    timeinfo = localtime (&rawtime);
    int len = strftime(timeBuffer, TIME_BUFFER_SIZE, TIME_FORMAT, timeinfo);
    timeBuffer[len] = 0x00;
    FILE* file = fopen(DATA_FILE, "a");
    printf("%s", timeBuffer);
    fprintf(file, "%s", timeBuffer);
        
    for (int i = 0;i < CHANNELS; i++) {
      int raw = analogRead(pinbase + i);
      printf(", %.3f", (float)raw / DIVISOR * 5.0);
      fprintf(file, ", %.3f", (float)raw / DIVISOR * 5.0);
    }
    printf("\n");
    fprintf(file, "\n");
    fclose(file);
    delay(sampleInterval * 1000);
  }  
}

