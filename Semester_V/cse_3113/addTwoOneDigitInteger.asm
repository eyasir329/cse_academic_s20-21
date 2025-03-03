.model small
.stack 100h

.data
    firstStr db "Enter number1: $"
    secondStr db 13,10, "Enter number2: $"
    sumStr db 13,10, "Sum is: $"

    a db 0
    b db 0

.code
main proc
    ; Initialize Data Segment
    mov ax, @data
    mov ds, ax

    ; Print "Enter number1: "
    lea dx, firstStr
    mov ah, 09h
    int 21h

    ; Read first number
    mov ah, 01h
    int 21h
    sub al, 30h
    mov a, al

    ; Print "Enter number2: "
    lea dx, secondStr
    mov ah, 09h
    int 21h

    ; Read second number
    mov ah, 01h
    int 21h
    sub al, 30h
    mov b, al

    ; Perform Addition
    mov al, a
    add al, b
    mov ah, 0
    aaa            ; Adjust for ASCII BCD result
    mov bx, ax     ; Store result

    ; Print result directly
    cmp bh, 0
    
    lea dx, sumStr
    mov ah, 09h
    int 21h
    
    je PrintOnes   ; If no tens digit, skip tens place

    add bh, 30h
    mov dl, bh
    mov ah, 2
    int 21h        ; Print tens place

PrintOnes:
    add bl, 30h
    mov dl, bl
    mov ah, 2
    int 21h        ; Print ones place

    ; Exit program
    mov ah, 4Ch
    int 21h

main endp
end main
