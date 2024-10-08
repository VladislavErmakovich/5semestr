.model tiny
.code
.org 100h  

start:   

    mov ah,9h
    lea dx, task_name
    int 21h
    
    mov ah, 9h
    lea dx, input_x1  
    int 21h 
    call input_value
    mov [x1], ax 
      
    mov ah, 9h
    lea dx, input_x2  
    int 21h
    call input_value
    mov [x2], ax 
       
    mov ah, 9h
    lea dx, input_x3  
    int 21h
    call input_value
    mov [x3], ax  
    
    mov ah, 9h
    lea dx, input_x4  
    int 21h
    call input_value
    mov [x4], ax 
    
    mov ah, 9h 
    lea dx, result_is
    int 21h
    
;-----------------------------------           
           
    mov ax, [x3] 
    mov cx,9 
    mul cx
    
    mov bx, ax
    
    mov ax, 7
    sub ax, [x2]
    
    sub bx,ax 
    
    mov ax, [x4]
    add ax, 1
    mov cx, [x1]
    mul cx
    mov cx, 16
    mul cx
    
    mov cx,ax
    mov ax,bx
    div cx
    
    mov [res], ax
    mov ax, [res] 
    call print_res 
    mov ah, 0x4C
    int 21h
      
;-------------------------------    
    
input_value:    

    mov ah, 01h
    int 21h  
    sub al, '0'
    xor ah, ah
    ret

print_res:  

    add ax, '0'    
    mov dl, al    
    mov ah, 02h   
    int 21h        
    ret
                                                              
    
.data 
x1 dw 0
x2 dw 0
x3 dw 0
x4 dw 0
res dw 0
task_name db "This program calculates ((9*x3-(7-x2))/((x4+1)*x1*16))",0Dh,0Ah, "$"
input_x1 db "Enter the value x1: $"   
input_x2 db 0Dh,0Ah,"Enter the value x2: $"  
input_x3 db 0Dh,0Ah,"Enter the value x3: $"  
input_x4 db 0Dh,0Ah,"Enter the value x4: $"
result_is db 0Dh,0Ah,"result is equal to $" 
end start
      
