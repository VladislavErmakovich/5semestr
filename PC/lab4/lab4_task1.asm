ESC_ equ 1Bh                  
                              
.model tiny                   
.code                         
.org 100h                     
start:                        
    mov ah, 08h               
    int 21h                   
                              
    cmp al, ESC_              
    je exit                   
                              
    cmp al, firstSymbol       
    jb start                  
    cmp al, lastSymbol        
    ja start                  
                              
    mov ah, 02h               
    mov dl, al                
    int 21h                   
                              
    jmp start                 
                              
    exit:                     
    mov ah, 8h                
    int 21h                   
    ret                       
.data                         
    firstSymbol db 05Bh       
    lastSymbol db 060h        
    end start

