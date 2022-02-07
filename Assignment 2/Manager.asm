;****************************************************************************************************************************
;Program name: "Sum of an Array".  This program takes user integer inputs and makes an array out of them. It then           *
;calculates the some of these integers and sends this value as output.  Copyright (C) 2020 Joshua Elmer                     *
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
;  Program name: Sum of an Array
;  Programming languages: One modules in C, one in C++ and three modules in X86
;  Date program began:     2020-Sept-27
;  Date program completed: 2020-Oct-3
;  Files in this program: Main.c, Manager.asm, Display_Array.cpp, Sum.asm, Input_Array.asm r.sh
;  Status: Complete.  No errors found after extensive testing.
;
;
;Purpose
;  Takes in user input of integers and stores them into an array before returning the size of the array.
;
;This file
;  File name: Manager.asm
;  Language: X86-64 with Intel syntax
;  Max page width: 132 columns
;  Assemble: nasm -f elf64 -o Manager.o Manager.asm
;  Optimal print specification: 132 columns width, 7 points, monospace, 8½x11 paper


;Declare the names of programs called from this X86 source file, but whose own source code is not in this file.
extern printf
extern scanf
extern input_array
extern sum_array
extern Display_Array
max equ 200

;Declare constants if needed
null equ 0
newline equ 10
storage_size equ 32                               ;Number of byte available for incoming numeric char array

global Manager                                    ;Make this program callable by other programs.

segment .data                                     ;Initialized data are placed in this segment

welcome db "Welcome to the Sum of an Array Calculator", newline, "Brought to you by Joshua Elmer", newline, null
promptforarray db "Enter a sequence of long integers separated by white space.",10,"After the last input press enter followed by Control+D: ", 10, null
stringformat db "%s",0
confirmation db "These numbers were received and put into the array",newline,null
farewell db "The sum will now be returned to the main function.", 10, 0
sum_expression db "The sum of the %ld numbers is %ld",10,null

segment .bss                                      ;Uninitialized data are declared in this segment
array resq max                                    ;create the array

;Empty segment: there are no un-initialized arrays.

segment .text                                     ;Instructions are placed in this segment
Manager:                                       ;Entry point for execution of this program.

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

;Registers rax, rip, and rsp are usually not backed up.


;Output the welcome message                       ;This is a group of instructions jointly performing one task.
mov qword rdi, stringformat
mov qword rsi, welcome
mov qword rax, 0
call printf


;Prompt for the array
mov qword rdi, stringformat
mov qword rsi, promptforarray                 ;Place the address of the prompt into rdi
mov qword rax, 0
call printf


;Create space for the incoming numeric data
sub rsp, storage_size                             ;32 bytes of memory are available for the incoming data


;Call Input_Array
mov r15, 0
mov qword rax, 0
mov qword rdi, array
mov qword rsi, max                                ;Now rsi points to the size of the array on the stack
call input_array                                  ;Call the external function; the new value is placed into the location that rsi points to
mov r15, rax                                      ;r15 now holds the size of the array


;Output the confirmation message
mov qword rdi, stringformat
mov qword rsi, confirmation
mov qword rax, 0
call printf


;Call Display_Array
mov qword rax, 0
mov qword rdi, array
mov qword rsi, r15
call Display_Array


;Call Sum_Array
mov qword rax, 0
mov qword rdi, array
mov qword rsi, r15
call sum_array
mov r13, rax

;output the sum_expression
mov qword rdi, sum_expression
mov qword rsi, r15
mov qword rdx, r13
mov qword rax, 0
call printf
mov r14, rax

;output the farewellmessage
mov qword rdi, stringformat
mov qword rsi, farewell                           ;The starting address of the string is placed into the second parameter.
mov qword rax, 0
call printf

restore:
mov rax, r14
add rsp,storage_size                    ;Reverse the earlier sub
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

ret                                     ;Pop the integer stack and jump to the address represented by the popped value.
