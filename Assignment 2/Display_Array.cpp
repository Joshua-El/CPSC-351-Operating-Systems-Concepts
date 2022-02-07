//Author information
//Author name: Joshua Elmer
//"CPSC 240-03 Midterm Program"
//CWID 888080975



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
