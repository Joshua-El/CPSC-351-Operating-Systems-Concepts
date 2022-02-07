;*****************************************************************************************************************************
;Program name: "Circumference of a Circle".  This program takes an integer input and it computes the circumference of a     *
;circle using the Egyptian value for pi, 22/7, and sends this value as output.  Copyright (C) 2020 Joshua Elmer             *
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
;version 3 as published by the Free Software Foundation.                                                                    *
;This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
;Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
;A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
;*****************************************************************************************************************************

;=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;
;Author information
;  Author name: Joshua Elmer
;  Author email: joshuaelmer@csu.fullerton.edu
;
;Program information
;  Program name: Integer Arithmetic
;  Programming languages: One modules in C and one module in X86
;  Date program began:     2020-Sept-18
;  Date program completed: 2020-Sept-19
;  Files in this program: egyptian.c, circle.asm, run.sh
;  Status: Complete.  No errors found after extensive testing.
;
;References for this program
;  Jorgensen, X86-64 Assembly Language Programming with Ubuntu, Version 1.1.40.
;
;Purpose
;  Compute the circumference of a circle using an integer value for input.
;
;This file
;   File name: circle.asm
;   Language: X86-64 with Intel syntax
;   Assemble: nasm -f elf64 -l circle.lis -o circle.o circle.asm
;   Link: gcc -m64 -no-pie -o current.out driver.o circle.o







;Declare the names of programs called from this X86 source file, but whose own source code is not in this file.
extern printf
extern scanf

;Declare constants if needed
null equ 0
newline equ 10

global circle                                 ;Make this program callable by other programs.

segment .data                                     ;Initialized data are placed in this segment

welcome db "Welcome to your friendly circle circumference calculator.", newline, null
promptforinteger1 db "Please enter the radius of a circle in whole number of meters: ", null
outputformat1 db "The number %ld was received", 10, 0
stringoutputformat db "%s", 0
signedintegerinputformat db "%ld", null
outputformat2 db "The circumference of a circle with this radius is %d ", 0
remainderformat db "with a remainder of %ld.", 10, 0
farewell db "The integer part of the circumference will be returned to the main program. Please enjoy your circles.", 10, 0

segment .bss                                      ;Uninitialized data are declared in this segment

;Empty segment: there are no un-initialized arrays.

segment .text                                     ;Instructions are placed in this segment
circle:                                       ;Entry point for execution of this program.

;Back up the general purpose registers for the sole purpose of protecting the data of the caller.
push rbp                                                    ;Backup rbp
mov  rbp,rsp                                                ;The base pointer now points to top of stack
push rdi                                                    ;Backup rdi
push rsi                                                    ;Backup rsi
push rdx                                                    ;Backup rdx
push rcx                                                    ;Backup rcx
push r8                                                     ;Backup r8
push r9                                                     ;Backup r9
push r10                                                    ;Backup r10
push r11                                                    ;Backup r11
push r12                                                    ;Backup r12
push r13                                                    ;Backup r13
push r14                                                    ;Backup r14
push r15                                                    ;Backup r15
push rbx                                                    ;Backup rbx
pushf                                                       ;Backup rflags

;There are 15 pushes above.  Make one more push of any value so that the number of pushes is an even number
push qword -1                                               ;Now the number of pushes is even
;Registers rax, rip, and rsp are usually not backed up.

;Output the welcome message                       ;This is a group of instructions jointly performing one task.
mov qword rdi, stringoutputformat
mov qword rsi, welcome
mov qword rax, 0
call printf

;Prompt for the first integer
mov qword rdi, stringoutputformat
mov qword rsi, promptforinteger1                  ;Place the address of the prompt into rdi
mov qword rax, 0
call printf

;Input the first integer
mov qword rdi, signedintegerinputformat
push qword -1                                     ;Place an arbitrary value on the stack; -1 is ok, any quad value will work
mov qword rsi, rsp                                ;Now rsi points to that dummy value on the stack
mov qword rax, 0                                  ;No vector registers
call scanf                                        ;Call the external function; the new value is placed into the location that rsi points to
pop qword r14                                     ;First inputted integer is saved in r14

;Output the value previously entered
mov qword rdi, outputformat1
mov qword rax, 0
call printf

;calculating the value of pi
mov qword r8, 22
mov qword r9, 7
mov qword rax, r8
cqo
div r9                            ;this will divide 22 by 7 and store the value in rax

;store the constant values needed for the circumference equation 2*pi*r
mov qword r10, 2
mov qword r11, rax               ;storing the previously calculated Egyptian value of pi into 10
mov qword rax, 0


;Circumference:

mov qword rax, r14                                ;Copy the radius (operand) to rax
mov qword rdx, 0                                  ;rdx contains no data we wish to save.
imul r10                                           ;Use the signed multiplication instruction 'imul' followed by the the constant value
imul r11                                           ;Once again us 'imul' this time followed by the pi value

;Now the circumference is in the pair rdx:rax. If the product will fit entirely in 64 bits then it will be store completely
;in rax and rdx is not needed. Nevertheless, we save both registers in the following 2 instructions.
mov qword r12, rax                                ;High order bits are saved in r12
mov qword r13, rdx                                ;Low order bits are saved in r13

;Output the Circumference of the circle
mov qword rdi, outputformat2
mov qword rsi, r12                                ;The high order bits are placed in the second parameter
mov qword rdx, r13                                ;The low order bits are placed in the third parameter
mov qword rax, 0                                  ;Zero in rax indicates no vector parameters
call printf


;Show the remainder
mov qword rdi, remainderformat
mov qword rsi, r13                                ;Copy the remainder to rsi
mov qword rdx, r13                                ;Copy the remainder to rdx
mov qword rax, 0
call printf

;Output the farewell message
mov qword rdi, stringoutputformat
mov qword rsi, farewell                           ;The starting address of the string is placed into the second parameter.
mov qword rax, 0
call printf

;Restore the original values to the general registers before returning to the caller.
pop rax                                                     ;Remove the extra -1 from the stack
popf                                                        ;Restore rflags
pop rbx                                                     ;Restore rbx
pop r15                                                     ;Restore r15
pop r14                                                     ;Restore r14
pop r13                                                     ;Restore r13
pop r12                                                     ;Restore r12
pop r11                                                     ;Restore r11
pop r10                                                     ;Restore r10
pop r9                                                      ;Restore r9
pop r8                                                      ;Restore r8
pop rcx                                                     ;Restore rcx
pop rdx                                                     ;Restore rdx
pop rsi                                                     ;Restore rsi
pop rdi                                                     ;Restore rdi
pop rbp                                                     ;Restore rbp

mov qword rax, 0                                  ;Return value 0 indicates successful conclusion.
ret                                               ;Pop the integer stack and jump to the address represented by the popped value.
