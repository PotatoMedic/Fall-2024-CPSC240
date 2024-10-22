;************************************************************************
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
;version 3 as published by the Free Software Foundation.  This program is distributed in the hope that it will be useful,   *
;but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See   *
;the GNU General Public License for more details A copy of the GNU General Public License v3 is available here:             *
;<https://www.gnu.org/licenses/>.
;************************************************************************
;File: sum.asm
;************************************************************************
;Author information:
;   Author: Chi Lun Huang
;
;Program Information:
;   Program Name: Integer Array
;   Module: Assignment #3
;**********************************************************************
extern printf

section .text
global sum_array

sum_array:
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
    xor     rax, rax        ; Initialize sum to 0
    xor     rbx, rbx        ; Initialize loop counter to 0

sum_loop:
    ; Check if rbx >= r14, exit loop if true
    cmp     rbx, r14
    jge     end_sum

    ; Add current integer to sum
    add     rax, [r15 + rbx * 8]

    ; Increment loop counter
    inc     rbx
    jmp     sum_loop

end_sum:
    ; The result (sum) is now in rax, leave it there for caller
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