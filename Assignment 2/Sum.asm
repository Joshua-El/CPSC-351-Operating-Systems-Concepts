;****************************************************************************************************************************
;Program name: "Sum of an Array".  This program takes user integer inputs and makes an array out of them. It then           *
;calculates the some of these integers and sends this value as output.  Copyright (C) 2020 Joshua Elmer                     *
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
;version 3 as published by the Free Software Foundation.                                                                    *
;This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
;Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
;A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
;*****************************************************************************************************************************


;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**

;Author information
;  Author name: Joshua Elmer
;  Author email: joshuaelmer@csu.fullerton.edu
;
;Program information
;  Program name: Sum of an Array
;  Programming languages: One modules in C, one in C++ and three modules in X86
;  Date program began:     2020-Sept-27
;  Date program completed: 2020-Oct-3


;Purpose
;  The purpose of this program is to calculate the sum of integers in an array


;This file
;  File name: Sum_Array.asm
;  Language: X86-64 with Intel syntax
;  Max page width: 132 columns
;  Assemble: nasm -f elf64 -o sum.o Sum.asm
;  Optimal print specification: 132 columns width, 7 points, monospace, 8½x11 paper


;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**

global sum_array                                 ;Make this program callable by other programs.

segment .data                                     ;Initialized data are placed in this segment

segment .text                           ;Place executable instructions in this segment.

sum_array:                                    ;Entry point.  Execution begins here.


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


mov r15, 0                                      ;r15 will store the current index of the array
mov r14, 0                                      ;r14 will store the sum


sumloop:
cmp r15, rsi                                    ;check if the size of the array has been reached
je endloop


add r14, [rdi + (8*r15)]                        ;add to the sum
inc r15
jmp sumloop


endloop:
mov rax, r14                            ;store the sum on the register that will be returned
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
ret
