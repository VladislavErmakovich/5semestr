    .model tiny
    .code
    .org 100h    
    include emu8086.inc  
    
strart:
    
    lea si, task_name_1       
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
     
    mov cx, [size] 
    lea bx, array
    mov ax,[bx]
    mov [min], ax
    add bx, 2
     
    dec cx   
    
find_min:
    mov dx, [bx]
    cmp dx, ax
    jge greater
    mov [min], dx
    mov ax, dx 

greater:
    add bx, 2
    loop find_min 
      
    lea si, text_min       
    call print_string
    mov ax, [min]
    call print_num  
       
    ret   
;----------------------------

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
    
task_name_1 db "Find the minimum element of the array ",0 
input_size db 0Dh,0Ah,"Enter the length of the array:", 0 
out_put_array db 0Dh,0Ah,"Array: ", 0  
text_min db 0Dh,0Ah,"Min element: ", 0   
 
.data 

DEFINE_PRINT_STRING
DEFINE_SCAN_NUM 
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PTHIS  
  
size dw 0  
min dw 0   
array db size dup(?)
   
end start


