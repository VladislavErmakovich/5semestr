    .model tiny
    .code
    .org 100h    
    include emu8086.inc 

strart:

    lea si, task_name_2       
    call print_string
    
    lea si, input_size 
    call print_string 
    call scan_num 
    
    mov [size], cx
    
    mov ah, 02h                 
    mov dl, 0Dh 
    int 21h                     
    mov dl, 0Ah                 
    int 21h  
    
    lea si, array  
    mov cx, [size]
    call init_array 
    
    lea si, out_put_array       
    call print_string
    lea si, array 
    mov cx, [size]
    call show   
    
    mov cx,[size]
    mov si, 0
    
inc_odd_element:
    mov ax,[array + si]
    test ax, 1
    jz not_odd 
    inc [array +si]
   
    
not_odd:
    add si, 2
    loop inc_odd_element 
    
    lea si, result
    call print_string
    lea si, array 
    mov cx, [size]
    call show 
    
    ret



;----------------
init_array:

    push cx
    
    call scan_num
    mov [si],cx             
    add si, 2
    
    mov ah, 02h                 
    mov dl, 0Dh 
    int 21h                     
    mov dl, 0Ah                 
    int 21h  
    
    pop cx
    loop init_array 
    
    ret  
    
show: 
    
    mov ax,[si] 
    call print_num

    add si, 2  
    
    mov ah, 02h
    mov dl, ' '
    int 21h 
    loop show 
    ret


    
task_name_2 db "Increment each odd element of the array. ",0             
input_size db 0Dh,0Ah,"Enter the length of the array:", 0 
out_put_array db 0Dh,0Ah,"Array: ", 0 
result db  0Dh,0Ah,"Result: ", 0

.data 

DEFINE_PRINT_STRING
DEFINE_SCAN_NUM 
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PTHIS  

 
size dw 0    
array dw size dup(?)
   
end start