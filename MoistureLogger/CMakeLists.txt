cmake_minimum_required(VERSION 3.12)
project(MoistureLogger C)

set(CMAKE_C_STANDARD 11)

include_directories(
    ${PROJECT_SOURCE_DIR}
    /home/pi/src/wiringPi/wiringPi
    )

add_executable(MoistureLogger
        main.c
        tlv2556ipwr.c)

target_link_libraries(MoistureLogger wiringPi m)
