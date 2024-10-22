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
#   Program Name: The Hello World Program
#   Module: Module 1 Assignment
#************************************************************************
#/bin/bash
rm *.out

nasm -f elf64  -l hello.lis -o hello.o hello.asm

g++ -c -m64 -Wall -fno-pie -l welcome.lis -o welcome.o welcome.cpp -std=c++17

g++ -m64 -fno-pie -no-pie -std=c++17 -o hello.out welcome.o hello.o

./hello.out

rm *.o
rm *.lis
