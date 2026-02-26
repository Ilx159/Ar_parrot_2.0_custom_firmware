#!/bin/bash
CC="/home/ilx/Repositories/Ar_parrot_2.0_custom_firmware/arm-gnu-toolchain-15.2.rel1-x86_64-arm-none-linux-gnueabihf/bin/arm-none-linux-gnueabihf-g++"
$CC -o ../bin/attitude ../util/util.c ../gpio/gpio.c ../navboard/navboard.c ars.c attitude.c main_attitude.c