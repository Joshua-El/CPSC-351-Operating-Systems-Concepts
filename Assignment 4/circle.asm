;*****************************************************************************************************************************
;Program name: "Circumference Calculator".  This program takes a float input and it computes the circumference of a        *
;circle, it then sends this value as output.  Copyright (C) 2020 Joshua Elmer                                               *
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
;  Program name: Circumference Calculator
;  Programming languages: One modules in C and one module in X86
;  Date program began:     2020-Nov-13
;  Date program completed: 2020-Nov-14
;  Files in this program: circumference.c, circle.asm, run.sh
;  Status: Complete.  No errors found after extensive testing.
;
;
;Purpose
;  Compute the Circumference Calculator using a float value for input.
;
;This file
;   File name: circle.asm
;   Language: X86-64 with Intel syntax
;   Assemble: nasm -f elf64 -l circle.lis -o circle.o circle.asm
;   Link: gcc -m64 -no-pie -o math.out circumference.o circle.o





;Declare the names of programs called from this X86 source file, but whose own source code is not in this file.
extern printf
extern scanf

;Declare constants if needed
null equ 0
newline equ 10

global circle                                 ;Make this program callable by other programs.

segment .data                                     ;Initialized data are placed in this segment

welcome db "This Circumference calculator is brought to you by Joshua Elmer.", newline, null
promptforinteger1 db "Please enter the radius of a circle as a floating point number: ", null
outputformat1 db "The number %3.15lf was received", 10, 0
stringoutputformat db "%s", 0
floatformat db "%lf", null
outputformat2 db "The circumference of a circle with this radius is %3.15lf meters", 10, 0
farewell db "The circumference will now be returned to the main program. Please enjoy your circles.", 10, 0

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

;Output the welcome message
mov qword rdi, stringoutputformat
mov qword rsi, welcome
mov qword rax, 0
call printf

;Prompt for the floating
mov qword rdi, stringoutputformat
mov qword rsi, promptforinteger1
mov qword rax, 0
call printf

;Input the float
push qword 0
mov rdi, floatformat
mov rsi, rsp                                ;Now rsi points to that dummy value on the stack
mov rax, 1                                  ;pass 1 into rax so that it knows to accept 1 input
call scanf                                  ;Call the external function
movsd xmm15, [rsp]                          ;store the value into the xmm15 register


;Output the value previously entered
mov rax, 1
mov rdi, outputformat1
movsd xmm0, xmm15
call printf


;store the constant values needed for the circumference equation 2*pi*r
mov r13, 0x4000000000000000               ;storing the hex representation for 2 into r13
mov r14, 0x400921FB54442D18               ;storing the hex representation for pi into r14


;mov the stored constants into the xmm Registers
movq xmm13, r13                           ;moving the hex representation for 2 into xmm13
movq xmm14, r14                           ;moving the hex representation for pi into xmm14


;Circumference:
mulsd xmm15, xmm13                        ;Use the double multiplication instruction 'mulsd' to multiply by 2
mulsd xmm15, xmm14                        ;Once again us 'mulsd' to multiply by the pi value


;Output the Circumference of the circle
mov rax, 1
mov rdi, outputformat2
movsd xmm0, xmm15
call printf


;Output the farewell message
mov qword rdi, stringoutputformat
mov qword rsi, farewell
mov qword rax, 0
call printf

;Restore the original values to the general registers before returning to the caller.
movsd xmm0, xmm15                           ;mov the circumference into xmm0 to be returned to main
pop rax
pop rax
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

ret                                               ;Pop the integer stack and jump to the address represented by the popped value.
