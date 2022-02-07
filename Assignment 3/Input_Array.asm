;*****************************************************************************************************************************
;Program name: "Sort an Array". This program takes user integer inputs and makes an array out of them. It then            *
;sorts the array from least to greatest and returns the greatest integer.  Copyright (C) 2020 Joshua Elmer                  *
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
;  Program name: Sort an Array
;  Programming languages: One modules in C, one in C++ and three modules in X86
;  Date program began:     2020-Oct-26
;  Date program completed: 2020-Oct-27
;  Files in this program:  Main.c, Read_Clock.asm, Manager.asm, Display_Array.cpp, Bubble_sort.cpp, Swap.asm, Input_Array.asm r.sh
;  Status: Complete.  No errors found after extensive testing.
;
;
;Purpose
;  Organize an array of integers given as input and return the largest one.
;
;This file
;  File name: Input_Array.asm
;  Language: X86-64 with Intel syntax
;  Max page width: 132 columns
;  Assemble: nasm -f elf64 -o input.o Input_Array.asm
;  Optimal print specification: 132 columns width, 7 points, monospace, 8½x11 paper

;Declare the names of programs called from this X86 source file, but whose own source code is not in this file.
extern printf
extern scanf
extern atolong
extern isinteger

;Declare constants if needed
null equ 0
newline equ 10
storage_size equ 32                               ;Number of byte available for incoming numeric char array

global Input_Array                                 ;Make this program callable by other programs.

segment .data                                     ;Initialized data are placed in this segment
userinput db "%s", null
invalid_message db "The number is invalid and was not accepted.",10,0

segment .bss                                      ;Uninitialized data are declared in this segment


segment .text                                     ;Instructions are placed in this segment
Input_Array:                                       ;Entry point for execution of this program.

;Back up the general purpose registers for the sole purpose of protecting the data of the caller.
push rbp                                          ;Backup rbp
mov  rbp,rsp                                      ;The base pointer now points to top of stack
push rdi                                          ;Backup rdi
push rsi                                          ;Backup rsi
push rdx                                          ;Backup rdx
push rcx                                          ;Backup rcx
push r8                                           ;Backup r8
push r9                                           ;Backup r9
push r10                                          ;Backup r10
push r11                                          ;Backup r11
push r12                                          ;Backup r12
push r13                                          ;Backup r13
push r14                                          ;Backup r14
push r15                                          ;Backup r15
push rbx                                          ;Backup rbx
pushf                                             ;Backup rflags

mov r13, 0                                        ;stores element from the user
mov r14, 0                                        ;counts the iterations of the loop thereby storing the size of the array
mov r15, rdi

mov rbp, rsp
sub rsp, storage_size
push qword 0


input_num:
mov rax,0
push qword 0
mov rdi, userinput
mov rsi, rsp
call scanf


cdqe
cmp rax, -1
je Complete                                    ;checks if control + d was inputted


mov rax, 0
mov rdi, rsp
call isinteger
mov r13, rax                                   ;store whether the value is an integer in r13, 1 is an integer and 0 is not


cmp r13, 1                                     ;check if the entered value is an integer
jne errormessage                               ;if the input is invalid it skips to the error message


mov rax, 0
mov rdi, rsp
call atolong
mov r12, rax
pop rax
mov [r15 + (8*r14)], r12                       ;store the user input into the array
inc r14
jmp input_num


errormessage:
mov qword rdi, invalid_message
mov qword rax, 0
call printf
pop rax
jmp input_num


Complete:
pop rax
pop rax

Finish:
mov rax, r14                            ;store the size of the array in rax
add rsp, storage_size                             ;Reverse the earlier sub
popf                                    ;Restore rflags
pop rbx                                 ;Restore rbx
pop r15                                 ;Restore r15
pop r14                                 ;Restore r14
pop r13                                 ;Restore r13
pop r12                                 ;Restore r12
pop r11                                 ;Restore r11
pop r10                                 ;Restore r10
pop r9                                  ;Restore r9
pop r8                                  ;Restore r8
pop rcx                                 ;Restore rcx
pop rdx                                 ;Restore rdx
pop rsi                                 ;Restore rsi
pop rdi                                 ;Restore rdi
pop rbp                                 ;Restore rbp

ret                                  ;Pop the integer stack and jump to the address represented by the popped value.
