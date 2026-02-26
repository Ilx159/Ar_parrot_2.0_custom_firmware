#!/bin/bash
CC="/home/ilx/Repositories/Ar_parrot_2.0_custom_firmware/arm-gnu-toolchain-15.2.rel1-x86_64-arm-none-linux-gnueabihf/bin/arm-none-linux-gnueabihf-g++"
$CC -o ../bin/navboard ../util/util.c ../gpio/gpio.c navboard.c main_navboard.c