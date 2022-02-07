//****************************************************************************************************************************
//Program name: "Circumference Calculator".  This program takes a float input and it computes the circumference of a        *
//circle, it then sends this value as output.  Copyright (C) 2020 Joshua Elmer                                               *
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
//  Program name: Circumference Calculator
//  Programming languages: One modules in C and one module in X86
//  Date program began:     2020-Nov-13
//  Date program completed: 2020-Nov-14
//  Files in this program: circumference.c, circle.asm, run.sh
//  Status: Complete.  Tested with a dozen different inputs.  No error uncovered during that testing session.
//
//
//Purpose
//  Compute the Circumference Calculator using a float value for input.
//
//This file
//   File name: circumference.c
//   Language: C
//   Max page width: 132 columns
//   Compile: gcc -c -Wall -m64 -fno-pie -no-pie -o circumference.o circumference.c
//   Link: gcc -m64 -fno-pie -no-pie -o math.out circumference.o circle.o
//
//
//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//
//
//
//===== Begin code area ===========================================================================================================



#include <stdio.h>
#include <stdlib.h>

double circle();

int main()
{
 printf("%s\n","WelcomCircumference Calculator circumference calculator.");
 printf("%s\n","The main program will now call the circle function");

 double circumference = circle();
 double *p = (double*)malloc(1*sizeof(double));
 *p = circumference;
 void *q = (void*)p;
 unsigned long *r = (unsigned long*)malloc(1*sizeof(unsigned long));
 r = (unsigned long*)q;

 printf("%s%3.15lf%s%lx\n","The main received this integer: ",circumference, " = 0x", *r);
 printf("%s\n","Have a nice day. Main will now return 0 to the operating system.");
 return 0;
}//End of main
