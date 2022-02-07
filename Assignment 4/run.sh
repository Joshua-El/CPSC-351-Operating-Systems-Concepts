#!/bin/bash

#Program: Circumference Calculator
#Author: Joshua Elmer


echo "The script file for Program Circumference Calculator has begun"

echo "Assemble circle.asm"
nasm -f elf64 -l circle.lis -o circle.o circle.asm

echo "Compile circumference.c"
gcc -c -Wall -m64 -no-pie -o circumference.o circumference.c -std=c11

echo "Link the object files"
gcc -m64 -no-pie -o math.out -std=c11 circle.o circumference.o

echo "Run the program Circumference Calculator:"
./math.out

echo "The script file will terminate"
