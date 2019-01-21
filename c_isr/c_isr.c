
#include <wiringPi.h>
#include <pthread.h>
#include <stdio.h>
#include <time.h>

#define GPIO_17 0
#define GPIO_12 32
#define GPIO_16 36

void Handler();

int intCount = 0;


double time_diff(struct timespec x , struct timespec y);

pthread_mutex_t count_mutex;

struct timespec start;

int main() {

    clock_gettime(CLOCK_MONOTONIC, &start);

    int err = wiringPiSetup () ;
    if (err != 0) {
      printf("ERROR setting up wiringPi: %X\n", err);
      return 1;
    }
    printf("Setup Complete\n");

    err = wiringPiISR(GPIO_17, INT_EDGE_RISING, &Handler) ;
    if (err != 0) {
      printf("ERROR setting both handler: %X\n", err);
      return 1;
    }
    printf("Falling handler set\n");

    printf("Clock ticks per second: %ld\n", CLOCKS_PER_SEC);

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

const int SCALE_FACTOR = 10;
void Handler() {
  pthread_mutex_lock(&count_mutex);
  if (digitalRead(GPIO_17) == 1){
    ++intCount;
    if ((intCount % SCALE_FACTOR) == 0) {
      struct timespec now;

      clock_gettime(CLOCK_MONOTONIC, &now);

      double delta = time_diff(start, now);
      printf("%d: %d Hz\n", intCount, (int)(1000/delta) * SCALE_FACTOR);
      start = now;
    }
  }
  pthread_mutex_unlock(&count_mutex);
}

double time_diff(struct timespec x , struct timespec y)
{
    double x_ns , y_ns , diff;

    x_ns = (double)x.tv_sec*1000000000 + (double)x.tv_nsec;
    y_ns = (double)y.tv_sec*1000000000 + (double)y.tv_nsec;

    diff = ((double)y_ns - (double)x_ns)/1000000.0;

    return diff;
}

