;************************************************************************
;;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
;version 3 as published by the Free Software Foundation.  This program is distributed in the hope that it will be useful,   *
;but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See   *
;the GNU General Public License for more details A copy of the GNU General Public License v3 is available here:             *
;<https://www.gnu.org/licenses/>.
;************************************************************************
;File: average.asm
;************************************************************************
;Author information:
;   Author: Chi Lun Huang
;
;Program Information:
;   Program Name: Average Driving Time
;   Module: Assignment #2
;************************************************************************

extern printf
extern scanf
extern fgets
extern atof
extern stdin
extern strlen
extern isfloat
global average

segment .data
    nameprompt db "Please enter your first and last name: ", 0
    titleprompt db "Please enter your title such as Lieutenant, Chief, Mr, Ms, Influencer, Chairman, Freshman, Foreman, Project Leader, etc: ", 0
    thankmessage db "Thank you ", 0
    mileprompt1 db "Enter the number of miles traveled from Fullerton to Santa Ana: ", 0
    mileprompt2 db "Enter the number of miles traveled from Santa Ana to Long Beach: ", 0
    mileprompt3 db "Enter the number of miles traveled from Long Beach to Fullerton: ", 0
    speedprompt db "Enter your average speed during that leg of the trip: ", 0
    stringformat db "%s", 0
    response db "The inputted data are being processed.", 0
    total_distance db "The total distance traveled is %.1lf miles.", 10, 0
    total_time db "The time of the trip is %.8lf hours.", 10, 0
    average_speed db "The average speed during this trip is %.8lf mph.", 10, 0
    newline db 0x0A, 0

segment .bss
    user_name resb 50
    user_title resb 50
    prof_number resb 1024

segment .text
average:

push rbp
mov rbp, rsp
push rbx
push rcx
push rdx
push rdi
push rsi
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
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
;======= Remove newline of name =======
mov rax, 0
mov rdi, user_name
call strlen
mov [user_name+rax-1], byte 0
;======== Ask for user's title =======
mov     rax, 0
mov     rdi, stringformat
mov     rsi, titleprompt
call    printf
;======== User's title input =========
mov     rax, 0
mov     rdi, user_title
mov     rsi, 50
mov     rdx, [stdin]
call    fgets
;======= Remove newline of title =======
mov rax, 0
mov rdi, user_title
call strlen
mov [user_title+rax-1], byte 0
;======== Thanks user message ========
mov     rax, 0
mov     rdi, stringformat
mov     rsi, thankmessage
call    printf

mov      rax, 0  
mov      rdi, user_title                      
call     strlen                              
mov      r13, rax                            
mov      rdi, stringformat                   
mov      rsi, user_title              
mov byte[rsi + r13], " "                
call     printf

mov      rax, 0  
mov      rdi, user_name                      
call     strlen                              
mov      r13, rax                            
mov      rdi, stringformat                   
mov      rsi, user_name              
mov byte[rsi + r13], " "               
call     printf

get_input:
;========= Ask distance from Fullerton to Santa Ana =========
mov     rax, 0
mov     rdi, newline
call    printf

mov     rax, 0
mov     rdi, stringformat
mov     rsi, mileprompt1
call    printf
;========== Input of distance from Fullerton to Santa Ana ==========
mov     rax, 0
mov     rdi, prof_number
mov     rsi, 1024
mov     rdx, [stdin]
call    fgets

mov     rax, 0
mov     rdi, prof_number
call    strlen
mov     [prof_number+rax-1], byte 0

mov     rax, 0
mov     rdi, prof_number
call    atof
movsd   xmm10, xmm0

mov     rax, 0
mov     rdi, prof_number
call    isfloat
cmp     rax, 0
je      invalid_float
;========= Ask for speed from Fullerton to Santa Ana ========
mov     rax, 0
mov     rdi, stringformat
mov     rsi, speedprompt
call    printf
;========= Speed input =========
mov     rax, 0
mov     rdi, prof_number
mov     rsi, 1024
mov     rdx, [stdin]
call    fgets

mov     rax, 0
mov     rdi, prof_number
call    strlen
mov     [prof_number+rax-1], byte 0

mov     rax, 0
mov     rdi, prof_number
call    atof
movsd   xmm11, xmm0

mov     rax, 0
mov     rdi, prof_number
call    isfloat
cmp     rax, 0
je      invalid_float

addsd   xmm13, xmm10
divsd   xmm10, xmm11  ;Calculate the time
addsd   xmm14, xmm10  ;add time to xmm14
;========= Ask distance from Santa Ana to Long Beach ========
mov     rax, 0
mov     rdi, stringformat
mov     rsi, mileprompt2
call    printf
;========= Input of distance from Santa Ana to Long Beach =========
mov     rax, 0
mov     rdi, prof_number
mov     rsi, 1024
mov     rdx, [stdin]
call    fgets

mov     rax, 0
mov     rdi, prof_number
call    strlen
mov     [prof_number+rax-1], byte 0

mov     rax, 0
mov     rdi, prof_number
call    atof
movsd   xmm10, xmm0

mov     rax, 0
mov     rdi, prof_number
call    isfloat
cmp     rax, 0
je      invalid_float
;========= Ask for speed from Santa Ana to Long Beach ========
mov     rax, 0
mov     rdi, stringformat
mov     rsi, speedprompt
call    printf
;========= Speed input =========
mov     rax, 0
mov     rdi, prof_number
mov     rsi, 1024
mov     rdx, [stdin]
call    fgets

mov     rax, 0
mov     rdi, prof_number
call    strlen
mov     [prof_number+rax-1], byte 0

mov     rax, 0
mov     rdi, prof_number
call    atof
movsd   xmm11, xmm0

mov     rax, 0
mov     rdi, prof_number
call    isfloat
cmp     rax, 0
je      invalid_float

addsd   xmm13, xmm10
divsd   xmm10, xmm11  ;Calculate the time
addsd   xmm14, xmm10  ;add time to xmm14
;========= Ask distance from Long Beach to Fullerton ========
mov     rax, 0
mov     rdi, stringformat
mov     rsi, mileprompt3
call    printf
;========= Input of distance from Long Beach to Fullerton =========
mov     rax, 0
mov     rdi, prof_number
mov     rsi, 1024
mov     rdx, [stdin]
call    fgets

mov     rax, 0
mov     rdi, prof_number
call    strlen
mov     [prof_number+rax-1], byte 0

mov     rax, 0
mov     rdi, prof_number
call    atof
movsd   xmm10, xmm0

mov     rax, 0
mov     rdi, prof_number
call    isfloat
cmp     rax, 0
je      invalid_float
;========= Ask for speed from Long Beach to Fullerton ========
mov     rax, 0
mov     rdi, stringformat
mov     rsi, speedprompt
call    printf
;========= Speed input =========
mov     rax, 0
mov     rdi, prof_number
mov     rsi, 1024
mov     rdx, [stdin]
call    fgets

mov     rax, 0
mov     rdi, prof_number
call    strlen
mov     [prof_number+rax-1], byte 0

mov     rax, 0
mov     rdi, prof_number
call    atof
movsd   xmm11, xmm0

mov     rax, 0
mov     rdi, prof_number
call    isfloat
cmp     rax, 0
je      invalid_float

addsd   xmm13, xmm10
divsd   xmm10, xmm11  ;Calculate the time
addsd   xmm14, xmm10  ;add time to xmm14
;========= Response Message=========
mov     rax, 0
mov     rdi, newline
call    printf

mov     rax, 0
mov     rdi, stringformat
mov     rsi, response
call    printf

mov     rax, 0
mov     rdi, newline
call    printf
;========= Caculate the average speed of the trip =========
movsd   xmm15, xmm13    ;moved the total distance from xmm13 to xmm15
divsd   xmm15, xmm14    ;calculate the average speed of the trip (distance / time)
;========= Display total distance =========
mov     rax, 0
mov     rdi, newline
call    printf

mov     rax, 1
movsd   xmm0, xmm13
mov     rdi, total_distance
call    printf
;========= Display total time =========
mov     rax, 1
movsd   xmm0, xmm14
mov     rdi, total_time
call    printf
;========= Display average speed of trip =========
mov     rax, 1
movsd   xmm0, xmm15
mov     rdi, average_speed
call    printf
;==========================
mov     rax, 0
push    qword 0
movsd   [rsp], xmm15
movsd   xmm0, [rsp]
pop     rax
jmp    exit
;==========================
invalid_float:
mov     rax, 0
jmp     get_input
;==========================
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

;======== End of Program ========