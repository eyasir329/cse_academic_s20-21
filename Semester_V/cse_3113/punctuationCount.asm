.model small
.stack 100h

.data
    msg1 db "Enter a string: $"
    msg2 db 13,10,"Number of punctuation symbols: $"
    newline db 0Ah, 0Dh, "$"
    punctuation db ".,;:'""?!-()[]{}<>@$%^&*_+=/~`|", 0  ; List of punctuation symbols
    input_string db 100, 0  ; Buffer for input string (max 100 characters)

.code
main:
    ; Initialize the data segment
    mov ax, @data
    mov ds, ax

    ; Prompt for the string input
    lea dx, msg1
    mov ah, 09h
    int 21h

    ; Read the string
    lea dx, input_string
    mov ah, 0Ah      ; DOS function to read buffered input
    int 21h

    ; Initialize the punctuation counter to 0
    xor cx, cx        ; CX will store the count of punctuation symbols

    ; Point SI to the start of the input string (skip first 2 bytes)
    lea si, input_string + 2

check_char:
    mov al, [si]     ; Load the current character
    cmp al, 0Dh      ; Check if it's the end of string (Enter key)
    je done_checking ; If end of string, jump to done checking

    ; Check if the character is a punctuation symbol
    lea di, punctuation  ; Point DI to the punctuation list
check_punctuation:
    mov bl, [di]     ; Load a punctuation symbol
    cmp bl, 0        ; If we reach the end of the punctuation list, no match
    je not_punctuation
    cmp al, bl       ; Compare the current character with the punctuation symbol
    je is_punctuation
    inc di           ; Move to the next punctuation symbol
    jmp check_punctuation

not_punctuation:
    inc si           ; Move to the next character in the input string
    jmp check_char   ; Continue checking

is_punctuation:
    inc cx           ; Increment the punctuation counter
    inc si           ; Move to the next character in the input string
    jmp check_char   ; Continue checking

done_checking:
    ; Print the result message
    lea dx, msg2
    mov ah, 09h
    int 21h

    ; Print the count of punctuation symbols
    mov ax, cx       ; Move the count to AX
    call print_number ; Call the procedure to print the number

    ; Print a newline
    lea dx, newline
    mov ah, 09h
    int 21h

    ; Exit the program
    mov ah, 4Ch
    int 21h

; Procedure to print a number (in AX)
print_number proc
    push ax          ; Save AX
    push bx          ; Save BX
    push cx          ; Save CX
    push dx          ; Save DX

    mov bx, 10       ; Divisor for converting to decimal
    xor cx, cx       ; Counter for digits

convert_loop:
    xor dx, dx       ; Clear DX for division
    div bx           ; AX / 10, result in AX, remainder in DX
    add dl, '0'      ; Convert remainder to ASCII
    push dx          ; Push the digit onto the stack
    inc cx           ; Increment digit counter
    test ax, ax      ; Check if quotient is zero
    jnz convert_loop ; If not zero, continue

print_digits:
    pop dx           ; Pop the digit from the stack
    mov ah, 02h      ; DOS function to print a character
    int 21h
    loop print_digits ; Repeat for all digits

    pop dx           ; Restore DX
    pop cx           ; Restore CX
    pop bx           ; Restore BX
    pop ax           ; Restore AX
    ret              ; Return from procedure
print_number endp

end main