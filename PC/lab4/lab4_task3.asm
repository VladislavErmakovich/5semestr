ESC_ equ 1Bh    
CtrlP_ equ 0x1910
CtrlO_ equ 0x180F
CtrlN_ equ 0x310E
CtrlK_ equ 0x250B

.model tiny 
.code 
.org 100h 
start:
    mov ah, 0h 
    
    int 16h 
    
    xor bh, bh
    mov cx, [StrLen] 
    
    cmp ax, CtrlP_ 
    je PrintCtrlP 
    
    cmp ax, CtrlO_
    je PrintCtrlO
    
    cmp ax, CtrlN_
    je PrintCtrlN
    
    cmp ax, CtrlK_
    je PrintCtrlK
    
    cmp al, ESC_ 
    je EndProgram
    
    jmp start           

PrintButton proc
    mov ah, 09h  
    int 10h      
    int 21h
   
    ret     
PrintButton endp

EndProgram:
    mov ah, 9h 
    lea dx, Msg 
    
    int 21h 
    mov ah, 8h 
    int 21h
    ret 


PrintCtrlP:
    mov bl, 0x0B 
    lea dx, CtrlPMessage
    call PrintButton
    
    jmp start

PrintCtrlO:  
    mov bl, 0x10 
    lea dx, CtrlOMessage
    call PrintButton
    
    jmp start

PrintCtrlN: 
    mov bl, 0x16
    lea dx, CtrlNMessage
    call PrintButton
    
    jmp start

PrintCtrlK:   
    mov bl, 0x5F 
    lea dx, CtrlKMessage
    call PrintButton 
    
    jmp start


.data
    CtrlPMessage db "Ctrl+P", 0Dh, 0Ah, '$'
    CtrlOMessage db "Ctrl+O", 0Dh, 0Ah, '$'
    CtrlNMessage db "Ctrl+N", 0Dh, 0Ah, '$'
    CtrlKMessage db "Ctrl+K", 0Dh, 0Ah, '$'
    StrLen dw 6
    Msg db 0Dh, 0Ah, "Programm end. Enter any button", 0Dh, 0Ah, '$'
end start