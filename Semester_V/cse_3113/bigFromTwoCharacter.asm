.model small
.stack 100h

.data
    first_char db "Enter first character: $"
    second_char db 13,10,"Enter second character: $"
    largest_char db 13,10,"The largest character is: $"

.code
main:
    mov ax, @data
    mov ds, ax

    ; Prompt and read first character
    lea dx, first_char
    mov ah, 09h
    int 21h
   
    mov ah, 01h
    int 21h
    mov bl, al          ; Save first char in BL 
    
    ; Prompt and read second character
    lea dx, second_char
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    mov bh, al          ; Save second char in BH for later use

    cmp bl, bh    
    jl  print_second    ; Jump if first char < second char

    ; If first char >= second char
    lea dx, largest_char
    mov ah, 09h
    int 21h
    mov dl, bl          ; Output first char
    mov ah, 02h
    int 21h
    jmp end_program

print_second:
    lea dx, largest_char
    mov ah, 09h
    int 21h
    mov dl, bh          ; Output second char (BH now holds second char)
    mov ah, 02h
    int 21h

end_program:
    mov ah, 4Ch
    int 21h
end main
