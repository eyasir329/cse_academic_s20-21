.model small
.stack 100h

.data
    msg1 db "Enter first number: $"
    msg2 db "Enter second number: $"
    msg3 db "The smallest number is: $"
    newline db 0Ah, 0Dh, "$"

.code
main:
    ; Initialize the data segment
    mov ax, @data
    mov ds, ax

    ; Prompt for the first number
    lea dx, msg1
    mov ah, 09h
    int 21h
    
    ; Read the first number
    mov ah, 01h
    int 21h
    sub al, '0'      ; Convert ASCII to integer
    mov bl, al       ; Store the first number in BL

    ; Prompt for the second number
    lea dx, msg2
    mov ah, 09h
    int 21h
    
    ; Read the second number
    mov ah, 01h
    int 21h
    sub al, '0'      ; Convert ASCII to integer

    ; Compare numbers to find the smallest
    mov dl, al       ; Copy second number to DL
    cmp bl, dl       ; Compare first number (BL) with second number (DL)
    jg  print_second ; If BL > DL, jump to print second number

    ; Print the first number if it is smaller or equal
    lea dx, msg3
    mov ah, 09h
    int 21h
    add bl, '0'      ; Convert integer to ASCII
    mov dl, bl
    mov ah, 02h
    int 21h
    jmp end_program

print_second:
    ; Print the second number if it is smaller
    lea dx, msg3
    mov ah, 09h
    int 21h
    add dl, '0'      ; Convert integer to ASCII
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
