//************************************************************************
//This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
//version 3 as published by the Free Software Foundation.  This program is distributed in the hope that it will be useful,   *
//but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See   *
//the GNU General Public License for more details A copy of the GNU General Public License v3 is available here:             *
//<https://www.gnu.org/licenses/>.
//************************************************************************
//File: welcome.cpp

//************************************************************************
//Author information:
//   Author: Chi Lun Huang
//
//Program Information:
//   Program Name: The Hello World Program
//   Module: Module 1 Assignment
//************************************************************************
#include <iostream>

extern "C" char * hello();

int main()
{
    char* name;

    std::cout << "Welcome to this freindly 'Hello' program created by Chi Lun Huang" << std::endl;
    
    name = hello(); //Returned name from hello.asm

    std::cout << "Have a nice day " << name << std::endl;
    std::cout << "Bye. The integer zero will now be returned to the operating system." << std::endl;

    return 0;
}