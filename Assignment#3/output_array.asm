;************************************************************************
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
;version 3 as published by the Free Software Foundation.  This program is distributed in the hope that it will be useful,   *
;but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See   *
;the GNU General Public License for more details A copy of the GNU General Public License v3 is available here:             *
;<https://www.gnu.org/licenses/>.
;************************************************************************
;File: output_array.asm
;************************************************************************
;Author information:
;   Author: Chi Lun Huang
;
;Program Information:
;   Program Name: Integer Array
;   Module: Assignment #3
;**********************************************************************
extern printf
extern intformat
extern newline

segment .data:
intformat db "%ld ", 0
newline db 0x0A, 0

segment .text
global output_array

output_array:
    push    rbp
    mov     rbp, rsp
    push    rbx
    push    rcx
    push    rdx
    push    rdi
    push    rsi
    push    r8
    push    r9
    push    r10
    push    r11
    push    r12
    push    r13
    push    r14
    push    r15
    pushf

    mov     r15, rdi        ; intarray
    mov     r14, rsi        ; r15 (array size)

    xor     rbx, rbx        ; Initialize loop counter to 0

print_loop:
    ; Check if rbx >= r14, exit loop if true
    cmp     rbx, r14
    jge     end_print

    ; Print current integer
    mov     rax, 0
    mov     rdi, intformat
    mov     rsi, [r15 + rbx * 8]
    call    printf

    ; Increment loop counter
    inc     rbx
    jmp     print_loop

end_print:
    popf
    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8
    pop rsi
    pop rdi
    pop rdx
    pop rcx
    pop rbx
    pop rbp              

    ret