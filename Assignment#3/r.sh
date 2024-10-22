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
#**********************************************************************
#!/bin/bash

nasm -f elf64 -l manager.lis -o manager.o manager.asm

nasm -f elf64 -l input_array.lis -o input_array.o input_array.asm

nasm -f elf64 -l output_array.lis -o output_array.o output_array.asm

nasm -f elf64 -l sum.lis -o sum.o sum.asm

nasm -f elf64 -l isinteger.lis -o isinteger.o isinteger.asm

gcc -c -m64 -Wall -no-pie -o sorting.o sorting.c -std=c2x

gcc -c -m64 -Wall -no-pie -o main.o main.c -std=c2x

gcc -m64 -no-pie -o result.out main.o manager.o input_array.o output_array.o sum.o sorting.o isinteger.o -std=c2x -Wall -lm

chmod +x result.out
./result.out