#!/bin/bash

#Program: Sort an Array
#Author: Joshua Elmer
#Delete some un-needed files
rm *.o
rm *.out

echo "Bash: The script file for Sum of an Array has begun"

echo "Bash: Compile the C++ function Display_Array.cpp"
g++ -c -m64 -Wall -fno-pie -no-pie -o display.o Display_Array.cpp -std=c++17

echo "Bash: Assemble Manager.asm"
nasm -f elf64 -o manager.o Manager.asm

echo "Bash: Compile the C++ function isinteger"
g++ -c -m64 -Wall -fno-pie -no-pie -o digits.o validate-decimal-digits.cpp -std=c++17

echo "Bash: Compile the C++ function Bubble_sort.cpp"
g++ -c -m64 -Wall -fno-pie -no-pie -o bubblesort.o Bubble_Sort.cpp -std=c++17

echo "Bash: Assemble Atol.asm"
nasm -f elf64 -o atolong.o Atol.asm

echo "Bash: Assemble Swap.asm"
nasm -f elf64 -o swap.o Swap.asm

echo "Bash: Assemble Read_Clock.asm"
nasm -f elf64 -o clock.o Read_Clock.asm

echo "Bash: Assemble Input_Array.asm"
nasm -f elf64 -o input.o Input_Array.asm

echo "Bash: Compile main.c"
gcc -c -Wall -m64 -no-pie -o main.o Main.c -std=c18

echo "Bash: Link the object files"
g++ -m64 -no-pie -o valid.out -std=c++17 main.o clock.o manager.o bubblesort.o swap.o input.o display.o atolong.o digits.o

echo "Bash: Run the program Sort an Array:"
./valid.out

echo "The script file will terminate"
