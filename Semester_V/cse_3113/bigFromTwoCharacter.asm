.model small
.stack 100h

.data
    msg1 db "Enter first character: $"
    msg2 db "Enter second character: $"
    msg3 db "The largest character is: $"
    newline db 0Ah, 0Dh, "$"

.code
main:
    ; Initialize the data segment
    mov ax, @data
    mov ds, ax

    ; Prompt for the first character
    lea dx, msg1
    mov ah, 09h
    int 21h
    
    ; Read the first character
    mov ah, 01h
    int 21h
    mov bl, al       ; Store the first character in BL

    ; Prompt for the second character
    lea dx, msg2
    mov ah, 09h
    int 21h
    
    ; Read the second character
    mov ah, 01h
    int 21h
    mov dl, al       ; Store the second character in DL

    ; Compare characters to find the largest
    cmp bl, dl       ; Compare first character (BL) with second character (DL)
    jl  print_second ; If BL < DL, jump to print second character

    ; Print the first character if it is larger or equal
    lea dx, msg3
    mov ah, 09h
    int 21h
    mov dl, bl
    mov ah, 02h
    int 21h
    jmp end_program

print_second:
    ; Print the second character if it is larger
    lea dx, msg3
    mov ah, 09h
    int 21h
    mov dl, dl
    mov ah, 02h
    int 21h

end_program:
    ; Print newline
    lea dx, newline
    mov ah, 09h
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h
end main
