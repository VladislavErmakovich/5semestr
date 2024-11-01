.model tiny
.code
org 100h

start:
    mov ah, 09h
    lea dx, prompt
    int 21h
    
    mov ah, 0Ah
    lea dx, input_buffer
    int 21h
    
    mov si, offset input_buffer + 2  
    mov di, offset output_buffer   
    mov cl, [input_buffer + 1]      
    xor ch, ch                       
    
    
    process_string:
        mov al, [si]
        mov [di], al
        inc si
        inc di
        loop process_string
    
    
    mov al, [output_buffer + 5]
    xchg al, [output_buffer + 2]
    mov [output_buffer + 5], al
    
    
    mov al, [output_buffer + 7]
    sub al, [output_buffer + 6]
    add al, [output_buffer + 1]
    mov [output_buffer + 4], al
    
    mov ah, 09h
    lea dx, result_msg
    int 21h
    
    mov ah, 09h
    lea dx, output_buffer
    int 21h
    
    mov ax, 4C00h
    int 21h

.data
    prompt db 'Enter a string (max 10 characters): $'
    result_msg db 0Dh, 0Ah, 'Modified string: $'
    input_buffer db 11, ?, 11 dup(?)
    output_buffer db 11 dup(?), '$'

end start