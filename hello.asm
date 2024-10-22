;************************************************************************
;;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
;version 3 as published by the Free Software Foundation.  This program is distributed in the hope that it will be useful,   *
;but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See   *
;the GNU General Public License for more details A copy of the GNU General Public License v3 is available here:             *
;<https://www.gnu.org/licenses/>.
;************************************************************************
;File: hello.asm

;************************************************************************
;Author information:
;   Author: Chi Lun Huang
;
;Program Information:
;   Program Name: The Hello World Program
;   Module: Module 1 Assignment
;************************************************************************

;********** Declare Functions **********
extern printf                                   
extern scanf                                    
extern fgets                                    
extern strlen                                   
extern stdin                                    
global hello                                    

max_name_size equ 32                            
max_title_size equ 15                           
max_response_size equ 15                        
;**************************************
segment .data                                   
;align 16                                                ;
;********** Initialize string messages **********
nameprompt db "Please enter your first and last name: ", 0
titleprompt db "Please enter your title (Ms, Mr, Engineer, Programmer, Mathematician, Genius, etc): ", 0
responseprompt1 db "Hello, ", 0
responseprompt2 db ". How has your day been so far?: ", 0
outputmessage db "is really nice.", 10, 0
goodbye db "This concludes the demonstration of the Hello program written in x86 assembly.", 10, 0
;**************************************
stringformat db "%s", 0            
;align 64                                       
segment .bss                                   
programmers_name resb max_name_size            
programmers_title resb max_title_size          
response resb max_response_size                

;************Begining of Program ***********
segment .text                                  
hello:
;************ GPRs ************                                        
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

;******** Ask for user's name ********
mov      rax, 0                               
mov      rdi, stringformat                    
mov      rsi, nameprompt                      
call     printf                               

;******** User's name input ********
mov      rax, 0                               
mov      rdi, programmers_name                
mov      rsi, max_name_size                   
mov      rdx, [stdin]                         
call     fgets                             
;********* Ask for title **********
mov       rax, 0                              
mov       rdi, stringformat                   
mov       rsi, titleprompt                   
call      printf     
;********** Title input **********
mov       rax, 0                              
mov       rdi, programmers_title              
mov       rsi, max_title_size                 
mov       rdx, [stdin]                        
call      fgets
;**************************************
mov       rax, 0                              
mov       rdi, stringformat                   
mov       rdi, responseprompt1                
call      printf                            
;**************************************
mov       rax, 0  
mov       rdi, programmers_title                      
call      strlen                              
mov       r13, rax                            
mov       rdi, stringformat                   
mov       rsi, programmers_title              
mov byte [rsi + r13 - 1], " "                 
call      printf                              
;**************************************
mov       rdi, programmers_name                
call      strlen                               
mov       r13, rax                             
mov       rdi, stringformat                    
mov       rsi, programmers_name                
mov byte [rsi + r13 -1], ""                   
call      printf                               

mov       rdi, stringformat                    
mov       rsi, responseprompt2                 
call      printf                               
;**************************************
mov       rdi, response                        
mov       rsi, max_response_size               
mov       rdx, [stdin]                         
call      fgets                                
;**************************************
mov       rdi, response                         
call      strlen                               
mov       r13, rax                             
mov       rdi, stringformat                    
mov       rsi, response                        
mov byte [rsi + r13 -1], " "                   
call      printf                               

mov       rdi, stringformat                    
mov       rsi, outputmessage                   
call      printf                               
;**************************************
mov       rax, 0                               
mov       rdi, stringformat                  
mov       rsi, goodbye                         
call      printf                               
;*********** Retrun name to welcome.cpp *********
mov       rax, programmers_name               
push      rax                                 
movsd     xmm0, [rsp]                         
pop       rax                                 
;**************************************
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