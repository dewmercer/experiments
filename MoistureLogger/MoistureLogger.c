#include <wiringPi.h>
#include <pcf8591.h>
#include <mcp3004.h>
#include "tlv2556ipwr.h"
#include <time.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#define TLV2556IPWR

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

#elif defined(TLV2556IPWR)
#define RESOLUTION 8
#define SELECTOR 0
#define CHANNELS 0x0E

int (*setup_ptr)(const int, const int) = &tlv2556ipwrSetup;

#else
#error "No supported ADC is defined"
#endif

#define PIN_BASE 64

#define DATA_FILE "/home/pi/moisture.log"

#define TIME_FORMAT "%F %T"
#define LOG_FORMAT ", %d"

#define TIME_BUFFER_SIZE 256

const float DIVISOR = (float) pow(2, RESOLUTION);

int percent5(int raw) {
  return (int)round(((float)raw / DIVISOR) * 100.0);
}

int capacitive(int raw) {
  return 100 - percent5(raw);
}

float range3(int raw) {
  return ((float)raw / DIVISOR) * (5.0/3.0);
}

int percent3(int raw) {
  return (int)round(range3(raw) * 100.0);
}

const float tempRange = 80.0 - -40.0;

int temp(int raw) {
  return (int)round((-40.0 + tempRange * range3(raw)) * 9/5 + 32);
}

int zero(int raw) {
  return 0;
}

int (*convert[8]) (int raw) = {
  &capacitive,
  &percent3,
  &percent3,
  &temp,
  &temp,
  &percent5,
  &zero,
  &zero
};


int main(int argc, char *argv[]) {
  if (argc != 2) {
    printf("Enter the number of seconds to pause between samples.\n");
    return 1;
  }

  int sampleInterval = atoi(argv[1]);

  printf("Sampling every %d seconds\n", sampleInterval);


  char timeBuffer[TIME_BUFFER_SIZE];

  int err = wiringPiSetup();
  if (err != 0) {
    printf("ERROR setting up wiringPi: %X\n", err);
    return 1;
  }
  printf("Wiring Pi Setup: %d\n", err);

  err = (*setup_ptr)(PIN_BASE, SELECTOR);
  if (err == 0) {
    printf("ERROR setting up ADC: %X\n", err);
    return 1;
  }
  printf("ADC Setup: %d\n", err);

  time_t rawTime;
  struct tm *timeInfo;

  while (TRUE) {
    time(&rawTime);
    timeInfo = localtime(&rawTime);
    int len = strftime(timeBuffer, TIME_BUFFER_SIZE, TIME_FORMAT, timeInfo);
    timeBuffer[len] = 0x00;
    FILE *file = fopen(DATA_FILE, "a");
    printf("%s", timeBuffer);
    fprintf(file, "%s", timeBuffer);
    for (int i = 0; i < CHANNELS-1; i++) {
      int val = analogRead(PIN_BASE + i);
      printf(LOG_FORMAT, val);
      fprintf(file, LOG_FORMAT, val);
    }
    printf("\n");
    fprintf(file, "\n");
    fclose(file);
    delay(sampleInterval * 1000);
  }
}

