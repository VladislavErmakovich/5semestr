.model small
.stack 100h
.data
    input_prompt db 'Enter a string (max 20 chars): $'
    output_prompt db 0Dh, 0Ah, 'Sorted string: $'
    max_length db 21  ; 20 chars + terminating zero
    actual_length db ?
    input_string db 21 dup('$')
    word_ptrs dw 10 dup(?)  ; array of pointers to words
    word_lengths db 10 dup(?)  ; array of word lengths
    word_count db 0
    temp_string db 21 dup('$')
    lengthIdx dw 0
    ptrsIdx dw 0
.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax  ; set ES to data segment for string operations
    ; Get input string
    lea dx, input_prompt
    mov ah, 9
    int 21h
    
    lea dx, max_length
    mov ah, 0Ah
    int 21h
    
    ; Parse words
    call parse_words
    
    ; Sort words
    call sort_words
    
    ; Reconstruct sorted string
    call reconstruct_string
    
    ; Print result
    lea dx, output_prompt
    mov ah, 9
    int 21h
    
    lea dx, temp_string
    mov ah, 9
    int 21h
    
    ; Exit program
    mov ax, 4C00h
    int 21h
main endp

parse_words proc
    lea si, input_string
    lea di, word_ptrs
    lea bx, word_lengths
    xor cx, cx  ; CX will store word count
    mov dl, 0   ; DL will store current word length
    
parse_loop:
    lodsb
    cmp al, ' '
    je word_end
    cmp al, 0Dh  ; Check for carriage return
    je string_end
    inc dl
    jmp parse_loop
    
word_end:
    cmp dl, 0
    je parse_loop  ; Skip multiple spaces
    mov ax, si
    sub ax, dx  ; Calculate pointer to word start
    dec ax      ; Adjust to point to the first character
    mov [di], ax  ; Store pointer to word start
    mov [bx], dl  ; Store the word length
    add di, 2
    inc bx
    inc cx
    xor dl, dl
    jmp parse_loop
    
string_end:
    cmp dl, 0
    je parsing_done
    mov ax, si
    sub ax, dx  ; Calculate pointer to last word
    dec ax      ; Adjust to point to the first character
    mov [di], ax  ; Store pointer to last word
    mov [bx], dl  ; Store the last word length
    inc cx
    
parsing_done:
    mov word_count, cl
    ret
parse_words endp

sort_words proc
    xor cx, cx
    mov cl, word_count
    dec cl  ; Outer loop counter
    
outer_loop:
    push cx
    lea si, word_lengths
    lea di, word_ptrs
    
inner_loop:
    mov al, [si]
    cmp al, [si+1]
    jle next_iter
    
    ; Swap lengths
    mov ah, [si+1]
    mov [si], ah
    mov [si+1], al
    
    ; Swap pointers
    mov ax, [di]
    xchg ax, [di+2]
    mov [di], ax
    
next_iter:
    inc si
    add di, 2
    loop inner_loop
    
    pop cx
    loop outer_loop
    
    ret
sort_words endp

reconstruct_string proc
    lea di, temp_string
    xor cx, cx
    mov cl, word_count
    xor bx, bx  ; Use BX as index for word_ptrs and word_lengths
    
reconstruct_loop:
    mov bx, ptrsIdx
    mov si, word_ptrs[bx]
    mov bx, lengthIdx
    mov dl, word_lengths[bx]
    xor dh, dh
    
copy_word:
    lodsb
    stosb
    dec dl
    jnz copy_word
    
    mov al, ' '
    stosb
    
    add lengthIdx, 1
    add ptrsIdx, 2  ; Add 2 more to BX for word_ptrs (total 3)
    loop reconstruct_loop
    
    dec di  ; Remove last space
    mov byte ptr [di], '$'  ; Terminate string
    
    ret
reconstruct_string endp

end main