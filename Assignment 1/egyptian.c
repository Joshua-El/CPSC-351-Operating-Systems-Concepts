//****************************************************************************************************************************
//Program name: "Circumference of a Circle".  This program takes an integer input and it computes the circumference of a     *
//circle using the Egyptian value for pi, 22/7, and sends this value as output.  Copyright (C) 2020 Joshua Elmer             *                                   *
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
//  Program name: Circumference of a Circle
//  Programming languages: One modules in C and one module in X86
//  Date program began:     2020-Sept-18
//  Date program completed: 2020-Sept-19
//  Files in this program: egyptian.c, circle.asm, run.sh
//  Status: Complete.  Tested with a dozen different inputs.  No error uncovered during that testing session.
//
//References for this program
//  Jorgensen, X86-64 Assembly Language Programming with Ubuntu
//
//Purpose
//  Compute the circumference of a circle using an integer value for input.
//
//This file
//   File name: egyptian.c
//   Language: C
//   Max page width: 132 columns
//   Compile: gcc -c -Wall -m64 -fno-pie -no-pie -o driver.o egyptian.c
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

int circle();

int main()
{long int result_code = -999;
 result_code = circle();
 printf("%s%ld\n","The main received this integer: ",result_code);
 printf("Have a nice day. Main will now return 0 to the operating system.");
 return 0;
}//End of main
