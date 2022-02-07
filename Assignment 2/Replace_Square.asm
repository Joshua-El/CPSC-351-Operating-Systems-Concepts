
;Author information
;Author name: Joshua Elmer
;"CPSC 240-03 Midterm Program"
;CWID 888080975

global Replace_Square                                 ;Make this program callable by other programs.

segment .data                                     ;Initialized data are placed in this segment

segment .text                           ;Place executable instructions in this segment.

Replace_Square:                                    ;Entry point.  Execution begins here.


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
mov r14, 0                                      ;r14 will store the number of replacements


sumloop:
cmp r15, rsi                                    ;check if the size of the array has been reached
je endloop

mov r12, [rdi + (8*r15)]
cmp r12, 0
jle incrementloop

mov qword rax, r12
mov qword rdx, 0
imul r12
mov qword r13, rax
mov [rdi + (8*r15)],r13
inc r14


incrementloop:
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
