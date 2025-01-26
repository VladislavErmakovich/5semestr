ESC_ equ 1Bh    
PgDn_ equ 0x5100
PgUp_ equ 0x4900
End_ equ 0x4F00
Home_ equ 0x4700

.model tiny 
.code 
.org 100h 
start:
    mov ah, 0h 
    
    int 16h 
    
    cmp ax, PgDn_ 
    je PrintPgDn 
    
    cmp ax, PgUp_
    je PrintPgUp
    
    cmp ax, Home_
    je PrintHome
    
    cmp ax, End_
    je PrintEnd
    
    cmp al, ESC_ 
    je EndProgram
    
    jmp start           

PrintButton proc      
    mov ah, 09h
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


PrintPgDn:
    lea dx, PgDnMessage
    call PrintButton
    
    jmp start

PrintPgUp:
    lea dx, PgUpMessage
    call PrintButton
    
    jmp start

PrintHome:
    lea dx, HomeMessage
    call PrintButton
    
    jmp start

PrintEnd:
    lea dx, EndMessage
    call PrintButton 
    
    jmp start


.data
    PgDnMessage db "Page Down", 0Dh, 0Ah, '$'
    PgUpMessage db "Page Up", 0Dh, 0Ah, '$'
    HomeMessage db "Home", 0Dh, 0Ah, '$'
    EndMessage db "End", 0Dh, 0Ah, '$'
    Msg db 0Dh, 0Ah, "Programm end. Enter any button", 0Dh, 0Ah, '$'
end start