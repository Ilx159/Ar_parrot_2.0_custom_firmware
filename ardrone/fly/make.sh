#!/bin/bash
CC="/home/ilx/Repositories/Ar_parrot_2.0_custom_firmware/arm-gnu-toolchain-15.2.rel1-x86_64-arm-none-linux-gnueabihf/bin/arm-none-linux-gnueabihf-g++"
$CC -lpthread -o ../bin/fly ../udp/udp.c ../util/util.c ../gpio/gpio.c ../motorboard/mot.c ../motorboard/motorboard.c ../navboard/navboard.c ../attitude/ars.c ../attitude/attitude.c pid.c controlthread.c main_fly.c