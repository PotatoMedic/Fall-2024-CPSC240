//************************************************************************
//This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
//version 3 as published by the Free Software Foundation.  This program is distributed in the hope that it will be useful,   *
//but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See   *
//the GNU General Public License for more details A copy of the GNU General Public License v3 is available here:             *
//<https://www.gnu.org/licenses/>.
//************************************************************************
//File: driver.c
//************************************************************************
//Author information:
//   Author: Chi Lun Huang
//
//Program Information:
//   Program Name: Average Drving Time
//   Module: Assignment #2
//************************************************************************
#include <stdio.h>

extern double average();

int main(void)
{
    printf("Welcome to Average Driving Time maintained by Chi Lun Huang\n");
    
    double count = 0;
    
    count = average();
    
    printf("\nThe driver has received this number %.8lf and will keep it for future use.\nHave a great day.\n\n",count);
    
    printf("A zero will be sent to the operating system as a sign of a successful execution.\n");

    return 0;
}