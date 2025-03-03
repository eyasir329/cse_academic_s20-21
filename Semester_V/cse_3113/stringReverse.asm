; Read a string from the keyboard
; Print the original string and then print it in reverse order
; Uses DOS interrupts for input and output operations

.model small  ; Step2: Declare a small memory model (separate code & data segments)
.stack 100h   ; Step3: Define a 100h size stack for function calls

.data ; Data segment -> where variables and strings are stored
    inputMsg db 'Enter a String: $'        ; Step4: Input prompt message
    outputMsg db 13,10, 'Reversed string: $'  ; Step5: Message before reversed output
    outputMsg0 db 13,10, 'Original string: $' ; Message before original output
    extraLine db 13,10, '$'  ; Extra line for formatting (CRLF)
    buffer db 100h dup(0)     ; Step6: Declare a 100-byte buffer, initialized with 0

.code ; Code segment -> contains executable instructions
main proc  ; Step1: Begin program execution

    ; Step7: Initialize the data segment
    mov ax, @data  ; Load data segment address into AX
    mov ds, ax     ; Set DS register to access data variables

    ; Step8: Display input message
    lea dx, inputMsg  ; Load address of inputMsg into DX
    mov ah, 09h       ; DOS function 09h (display string)
    int 21h           ; Call DOS interrupt

    ; Step9: Initialize SI to 0 (to index the buffer)
    mov si, 0

ReadChar:
    ; Step10: Set AH to 01h to prepare for character input
    mov ah, 01h
    ; Step11: Call interrupt 21h to read a character (stored in AL)
    int 21h
    ; Step12: Compare AL with 0Dh (Enter key)
    cmp al, 0dh
    ; Step13: If AL = 0Dh (Enter key), jump to EndRead
    je EndRead

    ; Step14: Store AL in buffer[SI]
    mov buffer[si], al
    ; Step15: Increment SI to move to the next buffer position
    inc si
    ; Step16: Repeat input until Enter is pressed
    jmp ReadChar

EndRead:
    ; Step17: Decrement SI by 1 to point at the last character
    dec si

    ; Step18: Print a newline (extraLine)
    lea dx, extraLine
    mov ah, 09h
    int 21h    

    ; Step19: Display "Original string:" message
    lea dx, outputMsg0
    mov ah, 09h
    int 21h 

PrintString:
    mov cx, si  ; Step20: Store SI (last character index) in CX
    mov si, 0   ; Step21: Reset SI to start from the first character

PrintLoop:
    ; Step22: Load character from buffer[SI] into DL
    mov dl, buffer[si]
    ; Step23: Set AH to 02h (DOS function to print a character)
    mov ah, 02h
    int 21h  ; Step24: Print character
    ; Step25: Increment SI to process the next character
    inc si
    ; Step26: Compare SI with CX (last index)
    cmp si, cx
    jle PrintLoop  ; Step27: If SI <= CX, continue printing

    ; Step28: Print a newline (extraLine)
    lea dx, extraLine
    mov ah, 09h
    int 21h    

    ; Step29: Display "Reversed string:" message
    lea dx, outputMsg
    mov ah, 09h
    int 21h 

    ; Step30: Start printing in reverse
    mov si, cx  ; Start from the last character

ReversePrint:
    ; Step31: Load character from buffer[SI] into DL
    mov dl, buffer[si]
    ; Step32: Set AH to 02h (DOS function to print a character)
    mov ah, 02h
    int 21h  ; Step33: Print character
    ; Step34: Decrement SI to move to the previous character
    dec si
    ; Step35: Check if SI >= 0
    cmp si, 0
    jns ReversePrint  ; Step36: If SI >= 0, continue printing in reverse

    ; Step37: Terminate program
    mov ah, 4Ch  ; DOS function to terminate program
    int 21h

main endp
end main
