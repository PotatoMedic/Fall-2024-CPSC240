#************************************************************************
#This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
#version 3 as published by the Free Software Foundation.  This program is distributed in the hope that it will be useful,   *
#but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See   *
#the GNU General Public License for more details A copy of the GNU General Public License v3 is available here:             *
#<https://www.gnu.org/licenses/>.
#************************************************************************
#File: r.sh
#************************************************************************
#Author information:
#   Author: Chi Lun Huang
#
#Program Information:
#   Program Name: Average Driving Time
#   Module: Assignment #2
#************************************************************************
#!/bin/bash

nasm -f elf64 -l isfloat.lis -o isfloat.o isfloat.asm

nasm -f elf64 -l average.lis -o average.o average.asm

gcc -c -m64 -Wall -no-pie -o driver.o driver.c -std=c2x

gcc -m64 -no-pie -o result.out driver.o isfloat.o average.o -std=c2x -Wall -lm

chmod +x result.out
./result.out