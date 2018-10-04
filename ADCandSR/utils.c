#include <time.h>

void sleep (unsigned int milliSeconds)
{
  struct timespec timeToSleep, ignored;

  timeToSleep.tv_sec  = (time_t)(milliSeconds / 1000);
  timeToSleep.tv_nsec = (long)(milliSeconds % 1000) * 1000000;

  nanosleep (&timeToSleep, &ignored) ;
}
