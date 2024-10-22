//************************************************************************
//This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
//version 3 as published by the Free Software Foundation.  This program is distributed in the hope that it will be useful,   *
//but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See   *
//the GNU General Public License for more details A copy of the GNU General Public License v3 is available here:             *
//<https://www.gnu.org/licenses/>.
//************************************************************************
//File: main.c
//************************************************************************
//Author information:
//   Author: Chi Lun Huang
//
//Program Information:
//   Program Name: Integer Array
//   Module: Assignment #3
//**********************************************************************
#include <stdio.h>
#include <string.h>
#include <math.h>

extern char* get_name();

int main(int argc, char* argv[])
{   
    printf("Welcome to Marvelous Arrays\n");
    printf("Brought to you by Chi Lun Huang\n");

    char* name = get_name();

    printf("\nI hope you liked your arrays %s", name);
    printf("Main will return 0 to the operating system. Bye.\n");
    
    return 0;
}