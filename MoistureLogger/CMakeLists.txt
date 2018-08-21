cmake_minimum_required(VERSION 3.12)
project(MoistureLogger C)

set(CMAKE_C_STANDARD 11)

add_executable(MoistureLogger
        MoistureLogger.c)
target_link_libraries(MoistureLogger wiringPi m)
