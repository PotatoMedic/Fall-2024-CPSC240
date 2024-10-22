;************************************************************************
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
;version 3 as published by the Free Software Foundation.  This program is distributed in the hope that it will be useful,   *
;but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See   *
;the GNU General Public License for more details A copy of the GNU General Public License v3 is available here:             *
;<https://www.gnu.org/licenses/>.
;************************************************************************
;File: input_array.asm
;************************************************************************
;Author information:
;   Author: Chi Lun Huang
;
;Program Information:
;   Program Name: Integer Array
;   Module: Assignment #3
;**********************************************************************
global input_array
extern scanf
extern printf
extern strlen
extern isinteger
extern getchar
extern atol

segment .data
    format_string db "%s", 0
    prompt_tryagain db "That is not an integer, try again", 10, 0

segment .bss
    align 64
    storedata resb 832

segment .text
input_array:
    push    rbp
    mov     rbp, rsp
    push    rbx
    push    rcx
    push    rdx
    push    rsi
    push    rdi
    push    r8 
    push    r9 
    push    r10
    push    r11
    push    r12
    push    r13
    push    r14
    push    r15
    pushf

    mov     r13, rdi    ; r13 is the array
    mov     r14, rsi    ; r14 is the array size
    mov     r15, 0      ; r15 is the index of the loop
    sub     rsp, 1024   ; Create a 1024 bits temporary space on the stack

begin:
    mov     rax, 0
    mov     rdi, format_string
    mov     rsi, rsp
    call    scanf

    mov     rdi, rsp
    call    getchar

    ; Check if the user's input is a Ctrl-D
    cdqe
    cmp     rax, -1
    je      exit

    ; Check if input is a integer or not
    mov     rax, 0
    mov     rdi, rsp
    call    isinteger
    cmp     rax, -1
    je      tryagain    ;prompt user to enter again

    ; Convert the input into a float
    mov     rax, 0
    mov     rdi, rsp
    call    atol

    ; Copy the integer into the array
    mov     [r13 + 8 * r15], rax

    ; Increase r15, repeat the loop if r15 is less than the max size
    inc     r15
    cmp     r15, r14
    jl      begin

    jmp     exit      

tryagain:
    ; Prompt the user to try again and repeat the loop
    mov     rax, 0
    mov     rdi, prompt_tryagain
    call    printf
    jmp     begin

exit:
    ;Get rid of the 1024 bits temporary space on the stack
    add     rsp, 1024

    mov     rax, r15
    
    popf          
    pop     r15
    pop     r14
    pop     r13
    pop     r12
    pop     r11
    pop     r10
    pop     r9 
    pop     r8 
    pop     rdi
    pop     rsi
    pop     rdx
    pop     rcx
    pop     rbx
    pop     rbp

    ret