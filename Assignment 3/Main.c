//****************************************************************************************************************************
//Program name: "Sort an Array".  This program takes user integer inputs and makes an array out of them. It then           *
//sorts the array from least to greatest and returns the greatest integer.  Copyright (C) 2020 Joshua Elmer                  *                                   *
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
//  Program name: Sort an Array
//  Programming languages: One modules in C, one in C++ and three modules in X86
//  Date program began:     2020-Oct-26
//  Date program completed: 2020-Oct-27
//  Files in this program: Main.c, Read_Clock.asm, Manager.asm, Display_Array.cpp, Bubble_sort.cpp, Swap.asm, Input_Array.asm r.sh
//  Status: Complete.  Tested with a dozen different inputs.  No error uncovered during that testing session.
//
//
//Purpose
//  Organize an array of integers given as input and return the largest one.
//
//This file
//   File name: Main.c
//   Language: C
//   Compile: gcc -c -Wall -m64 -fno-pie -no-pie -o main.o Main.c
//   Link: g++ -m64 -no-pie -o valid.out -std=c++17 main.o clock.o manager.o bubblesort.o swap.o input.o display.o atolong.o digits.o
//
//
//
//
//
//
//===== Begin code area ===========================================================================================================



#include <stdio.h>
#include <stdint.h>
long int Manager();
long int Read_Clock();

int main()
{long int result_code = -999;
 long int time = -999;
 time = Read_Clock();
 printf("%s%ld%s\n","The time on the CPU clock is now ", time ," tics." );
 result_code = Manager();
 printf("%s%ld%s\n","Main received ",result_code,", and is not sure what to do with it.");
 printf("Main will now return 0 to the operating system.   Bye.\n");
 time = Read_Clock();
 printf("%s%ld%s","The time on the CPU clock is now ", time ," tics.\n");
 return 0;
}//End of main
