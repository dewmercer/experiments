/*
 * serialTest.c:
 *	Very simple program to test the serial port. Expects
 *	the port to be looped back to itself
 *
 * Copyright (c) 2012-2013 Gordon Henderson. <projects@drogon.net>
 ***********************************************************************
 * This file is part of wiringPi:
 *	https://projects.drogon.net/raspberry-pi/wiringpi/
 *
 *    wiringPi is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU Lesser General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    wiringPi is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU Lesser General Public License for more details.
 *
 *    You should have received a copy of the GNU Lesser General Public License
 *    along with wiringPi.  If not, see <http://www.gnu.org/licenses/>.
 ***********************************************************************
 */

#include <stdio.h>
#include <string.h>
#include <errno.h>

#include <wiringPi.h>
#include <wiringPiSPI.h>

int main ()
{
  
  int err = wiringPiSetup();
  if (err != 0) {
    printf("ERROR setting up wiringPi: %X\n", err);
    return err;
  }
  
  int fd = wiringPiSPISetup(0, 1);
  printf("SPI File Descriptor: %d\n", fd);
  
  unsigned char counter = 0; 
  
  while(TRUE){
    unsigned char data = counter;
    wiringPiSPIDataRW(0, &data, 1);
    delay(25);
    counter++;
  }
  printf ("\n") ;
  return 0 ;
}
