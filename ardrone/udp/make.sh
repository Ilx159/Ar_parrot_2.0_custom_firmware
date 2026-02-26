#!/bin/bash
CC="/home/ilx/Repositories/Ar_parrot_2.0_custom_firmware/arm-gnu-toolchain-15.2.rel1-x86_64-arm-none-linux-gnueabihf/bin/arm-none-linux-gnueabihf-g++"
$CC -o ../bin/udpserver udp.c main_udpserver.c
$CC -o ../bin/udpclient udp.c main_udpclient.c