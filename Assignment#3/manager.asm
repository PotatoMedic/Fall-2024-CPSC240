;************************************************************************
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
;version 3 as published by the Free Software Foundation.  This program is distributed in the hope that it will be useful,   *
;but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See   *
;the GNU General Public License for more details A copy of the GNU General Public License v3 is available here:             *
;<https://www.gnu.org/licenses/>.
;************************************************************************
;File: manager.asm
;************************************************************************
;Author information:
;   Author: Chi Lun Huang
;
;Program Information:
;   Program Name: Integer Array
;   Module: Assignment #3
;**********************************************************************
    extern printf
    extern scanf
    extern fgets
    extern strlen
    extern stdin
    extern input_array
    extern output_array
    extern sum_array
    extern sorting

    segment .data
    nameprompt db "Please enter your name: ", 0
    inputprompt db "This program will sum your array of integers",10,"Enter a sequence of ling integers separated by white space", 10, "Afer the last input press enter followed by Control+D:", 10, 0
    array_display db "These numbers were received and placed into the array:", 10, 0
    sum_count_display db "The sum of the %lu numbers in this array is %ld.", 10, 0
    sorted_array db "This is the sorted array:", 10, 0
    end_message db "This program will return execution to the main function.", 10, 0
    stringformat db "%s", 0
    intformat db "%ld", 10, 0
    int_format db "%ld ", 0
    output_count db "Array count is %lu", 10, 0
    newline db 0x0A, 0
    array_size equ 832

    segment .bss
    align 64
    user_name resb 50
    storedata resb 832
    intarray resb array_size

    segment .text
    global get_name
    global get_array
    
    get_name:
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

    ;======== Ask for user's name ========
    mov     rax, 0
    mov     rdi, stringformat
    mov     rsi, nameprompt
    call    printf  
    ;======== User's name input ==========
    mov     rax, 0
    mov     rdi, user_name
    mov     rsi, 50
    mov     rdx, [stdin]
    call    fgets
    ;======== New Line ===================
    mov     rax, 0
    mov     rdi, newline
    call    printf
    ;=====================================

    get_array:
    ;======== Prompt for inputs ==========
    mov     rdi, inputprompt
    call    printf
    ;=====================================
    mov     rax, 0
    mov     rdi, intarray
    mov     rsi, array_size
    call    input_array
    mov     r15, rax
    mov     r12, r15

    mov     rax, 0
    mov     rdi, newline
    call    printf

    mov     rax, 0
    mov     rdi, stringformat
    mov     rsi, array_display
    call    printf  

    mov     rdi, intarray
    mov     rsi, r15
    call    output_array

    mov     rax, 0
    mov     rdi, newline
    call    printf

    mov     rax, 0
    mov     rdi, newline
    call    printf

    ;Call sum_array to get sum of array
    mov     rdi, intarray
    mov     rsi, r15
    call    sum_array

    ; rax now contains the sum
    mov     rdx, rax             ; Store sum in rdx
    mov     rax, r12             ; Restore array count
    mov     rdi, sum_count_display
    mov     rsi, rax             ; Pass count
    call    printf

    mov     rax, 0
    mov     rdi, newline
    call    printf

    ; Call sort_array to sort the values
    mov     rdi, intarray
    mov     rsi, r15
    call    sorting

    ; Print sorted array message
    mov     rax, 0
    mov     rdi, stringformat
    mov     rsi, sorted_array
    call    printf


    ;===== Prin the sorted array ======
    xor     r14, r14    ;Initialize loop counter to 0
    print_sorted_loop:
    ; Check if r14 >= r15, exit loop if true
    cmp     r14, r15
    jge     end_print_sorted

    ; Print current integer
    mov     rax, 0
    mov     rdi, intformat
    mov     rsi, [intarray + r14 * 8]
    call    printf

    ; Increment loop counter
    inc     r14
    jmp     print_sorted_loop

    end_print_sorted:
    mov     rax, 0
    mov     rdi, newline
    call    printf

    mov     rax, 0
    mov     rdi, stringformat
    mov     rsi, end_message
    call    printf 

    ;======= Return user name ============
    mov     rax, 0
    mov     rax, user_name
    push    rax
    movsd   xmm0, [rsp]
    pop     rax
    ;=====================================
    
    exit:
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
                                                   