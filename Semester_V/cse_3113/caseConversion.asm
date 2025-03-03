.model small
.stack 100h

.data
    inputStr db 'Enter a String: $'   ; Prompt message for input
    originalStr db 13,10, 'Original String is: $'   ; Newline before original string
    convertedStr db 13,10, 'Converted String is: $' ; Newline before converted string
    buffer db 100h dup(0)   ; Buffer to store input characters

.code
main proc
    
    mov ax,@data   ; Initialize data segment
    mov ds,ax

    ; Display input prompt
    lea dx, inputStr
    mov ah, 09h
    int 21h

    mov si, 0  ; Initialize index

InputString:
    mov ah, 01h  ; Read character from keyboard
    int 21h
    cmp al, 0Dh  ; Check for Enter key (carriage return)
    je PrintString
    mov buffer[si], al  ; Store character in buffer
    inc si
    jmp InputString

PrintString:
    lea dx, originalStr  ; Display "Original String is:"
    mov ah, 09h
    int 21h

    mov cx, si  ; Store character count
    mov si, 0   ; Reset index for printing

LoopString:
    mov dl, buffer[si]  ; Load character
    mov ah, 02h
    int 21h   ; Print character
    inc si
    cmp si, cx
    jl LoopString  ; Continue printing until all characters are printed

    ; Print newline and "Converted String is:"
    lea dx, convertedStr
    mov ah, 09h
    int 21h

    mov si, 0  ; Reset index for conversion

CheckEach:
    mov dl, buffer[si]  ; Load character
    inc si

    cmp dl, 'A'
    jl PrintChar  ; If less than 'A', print as-is
    cmp dl, 'Z' + 1
    jl PrintSmall ; If within 'A' to 'Z', convert to lowercase
    cmp dl, 'a'
    jl PrintChar  ; If less than 'a', print as-is
    cmp dl, 'z' + 1
    jl PrintBig   ; If within 'a' to 'z', convert to uppercase

PrintChar:
    mov ah, 02h  ; Print character
    int 21h
    cmp si, cx
    jl CheckEach  ; Continue processing
    jmp EndProgram

PrintSmall:
    add dl, 20h  ; Convert uppercase to lowercase
    jmp PrintChar

PrintBig:
    sub dl, 20h  ; Convert lowercase to uppercase
    jmp PrintChar

EndProgram:
    mov ah, 4Ch  ; Exit program
    int 21h
    
main endp
end main
