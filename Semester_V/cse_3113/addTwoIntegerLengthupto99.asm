.model small
.stack 100h

.data
    msg1 db 'Enter first number: $'
    msg2 db 13,10, 'Enter second number: $'
    msg3 db 13,10, 'Sum is: $'
    num1 db 100 dup(0)  ; Array to store first number
    num2 db 100 dup(0)  ; Array to store second number
    result db 101 dup(0); Array to store result (one extra byte for carry)

.code
main proc
    ; Initialize Data Segment
    mov ax, @data
    mov ds, ax

    ; Display message 1
    lea dx, msg1
    mov ah, 09h
    int 21h

    ; Read first number
    xor si, si
read_num1:
    mov ah, 01h
    int 21h
    cmp al, 0Dh  ; Check for Enter key
    je input_num2
    sub al, 30h  ; Convert ASCII to integer
    mov num1[si], al
    inc si
    jmp read_num1

input_num2:
    ; Display message 2
    lea dx, msg2
    mov ah, 09h
    int 21h

    ; Read second number
    xor di, di
read_num2:
    mov ah, 01h
    int 21h
    cmp al, 0Dh  ; Check for Enter key
    je start_addition
    sub al, 30h  ; Convert ASCII to integer
    mov num2[di], al
    inc di
    jmp read_num2

start_addition:
    ; Compare lengths
    mov cx, si
    cmp si, di
    jge set_max_len
    mov cx, di

set_max_len:
    xor al, al  ; Clear AL (carry)
    mov bl, 10  ; Base 10 for division
    xor bp, bp  ; Result index

add_loop:
    xor dx, dx
    dec si
    cmp si, -1
    jl skip_x
    add dl, num1[si]

skip_x:
    dec di
    cmp di, -1
    jl skip_y
    add dl, num2[di]

skip_y:
    add dl, al  ; Add previous carry
    mov ax, dx
    div bl      ; Divide by 10, remainder in AH
    mov result[bp], ah
    mov al, al  ; Store carry in AL
    inc bp
    loop add_loop

    cmp al, 0
    je print_result
    mov result[bp], al
    inc bp

print_result:
    ; Display message 3
    lea dx, msg3
    mov ah, 09h
    int 21h

    ; Print the sum
    dec bp
print_loop:
    mov dl, result[bp]
    add dl, 30h  ; Convert to ASCII
    mov ah, 02h
    int 21h
    dec bp
    cmp bp, -1
    jg print_loop

    ; Exit program
    mov ah, 4Ch
    int 21h

main endp
end main
