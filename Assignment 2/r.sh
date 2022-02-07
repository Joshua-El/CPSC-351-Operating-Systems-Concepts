#!/bin/bash

#Program: Sum of an Array
#Author: Joshua Elmer


echo "Bash: The script file for Sum of an Array has begun"

echo "Bash: Compile the C++ function Display_Array"
g++ -c -m64 -Wall -fno-pie -no-pie -o display.o Display_Array.cpp -std=c++17

echo "Bash: Assemble Manager.asm"
nasm -f elf64 -o manager.o Manager.asm

echo "Bash: Compile the C++ function isinteger"
g++ -c -m64 -Wall -fno-pie -no-pie -o digits.o validate-decimal-digits.cpp -std=c++17

echo "Bash: Assemble Atol.asm"
nasm -f elf64 -o atolong.o Atol.asm

echo "Bash: Assemble Sum.asm"
nasm -f elf64 -o sum.o Sum.asm

echo "Bash: Assemble Input_Array.asm"
nasm -f elf64 -o input.o Input_Array.asm

echo "Bash: Compile main.c"
gcc -c -Wall -m64 -no-pie -o main.o Main.c -std=c18

echo "Bash: Link the object files"
g++ -m64 -no-pie -o valid.out -std=c++17 main.o manager.o atolong.o digits.o input.o display.o sum.o

echo "Bash: Run the program Sum of an Array:"
./valid.out

echo "The script file will terminate"
