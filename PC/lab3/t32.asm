.model tiny 
.code 
.org 100h

include 'emu8086.inc'
start: 
    mov ah, 9h 
    lea dx, msg1 
    int 21h
     
    mov ah, 0Ah 
    lea dx, string 
    int 21h  
    
    mov ah, 9h 
    lea dx, msg2 
    int 21h 
     
    mov ah, 0Ah 
    lea dx, threshold 
    int 21h   
        
    lea si, string + 2    
    mov al, [threshold + 2] 
    mov cx, 0    
next_char:   
    lodsb            
    cmp al, 0x0D       
    je done        
   
    cmp al, [threshold + 2]
    jl increment_count  

    jmp next_char

increment_count:
    
    inc cx
    jmp next_char      

done:
    mov ah, 09h
    lea dx, msg3
    int 21h
    
    mov ax, cx
    call PRINT_NUM 
    
    
    mov ah, 08h
    int 21h                  
    
    
.data
    DEFINE_PRINT_NUM
    DEFINE_PRINT_NUM_UNS 
    msg1 db "Input string(max 10 characters):", "$"
    msg2 db 0Dh, 0Ah, "Input element: ", "$"   
    msg3 db 0Dh, 0Ah,"Count of elements that has higher ASCII code value: ", "$"
    string        db   11,0,12 dup('$')
    threshold     db   2,0,3 dup('$')  
END