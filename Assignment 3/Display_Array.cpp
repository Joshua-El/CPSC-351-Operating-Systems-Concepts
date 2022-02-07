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
//Author information
//  Author name: Joshua Elmer
//  Author email: joshuaelmer@csu.fullerton.edu
//
//Program information
//  Program name: Sort an Array
//  Programming languages: C++
//  Date program began: 2020-Oct-28
//  Date of last update: 2020-Oct-27


//This file
//  File name: Display_Array.cpp
//  Purpose: display an array in order
//  Language: C++
//  Max page width: 136 columns
//  Optimal print specification: 7 point font, monospace, 136 columns, 8½x11 paper
//  Compile: g++ -c -m64 -Wall -fno-pie -no-pie -o display.o Display_Array.cpp -std=c++17

#include <iostream>

using namespace std;
extern "C" void Display_Array(long int array[], int size);
void Display_Array(long int array[], int size)
{
  for(int i = 0; i < size; i++)
  {
    std::cout << array[i] << " ";
  }
  std::cout << "\n";
}
