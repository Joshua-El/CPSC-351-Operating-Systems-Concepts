//****************************************************************************************************************************
//Program name: "Sum of an Array".  This program takes user integer inputs and makes an array out of them. It then           *
//calculates the some of these integers and sends this value as output.  Copyright (C) 2020 Joshua Elmer                     *                                   *
//This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
//version 3 as published by the Free Software Foundation.                                                                    *
//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
//A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
//****************************************************************************************************************************


//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//Author information
//  Author name: Joshua Elmer
//  Author email: joshuaelmer@csu.fullerton.edu
//
//Program information
//  Program name: Sum of an Array
//  Programming languages: One modules in C, one in C++ and three modules in X86
//  Date program began:     2020-Sept-27
//  Date program completed: 2020-Oct-3
//  Files in this program: Main.c, Manager.asm, Display_Array.cpp, Sum.asm, Input_Array.asm r.sh
//  Status: Complete.  Tested with a dozen different inputs.  No error uncovered during that testing session.
//
//
//Purpose
//  Compute the sum of a circle using integer values for input.
//
//This file
//   File name: Main.c
//   Language: C
//   Compile: gcc -c -Wall -m64 -fno-pie -no-pie -o driver.o Main.c
//   Link: gcc -m64 -fno-pie -no-pie -o current.out driver.o circle.o
//
//
//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//
//
//
//===== Begin code area ===========================================================================================================



#include <stdio.h>
#include <stdint.h>

long int Manager();

int main()
{long int result_code = -999;
 result_code = Manager();
 printf("%s%ld%s\n","Main received ",result_code,", and is not sure what to do with it.");
 printf("Main will now return 0 to the operating system.   Bye.\n");
 return 0;
}//End of main
