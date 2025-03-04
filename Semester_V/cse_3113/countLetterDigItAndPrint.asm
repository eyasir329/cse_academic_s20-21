.MODEL SMALL
.STACK 100H
.DATA
    msg1  DB  'Enter a string: $'
    msg2  DB  0DH,0AH, 'Letters Count: $'
    msg3  DB  0DH,0AH, 'Digits Count: $'
    msg4  DB  0DH,0AH, 'Letters: $'
    msg5  DB  0DH,0AH, 'Digits: $'
    
    letters DB 100 DUP('$')  ; Array to store letters
    digits  DB 100 DUP('$')  ; Array to store digits
    
    Letter_Count DB 0
    Digit_Count  DB 0

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display "Enter a string:"
    MOV DX, OFFSET msg1
    MOV AH, 09H
    INT 21H

    ; Read characters
    MOV SI, 0  ; Index for letters array
    MOV DI, 0  ; Index for digits array
    
INPUT_LOOP:
    MOV AH, 01H  ; Read character
    INT 21H
    
    CMP AL, 0DH  ; Check for Enter key
    JE END_INPUT

    CMP AL, 'A'  ; Check if AL >= 'A'
    JB CHECK_DIGIT  ; If not, check if it's a digit
    
    CMP AL, 'Z'  ; Check if AL <= 'Z'
    JBE STORE_LETTER  ; If yes, it's a letter

    CMP AL, 'a'  ; Check if AL >= 'a'
    JB CHECK_DIGIT
    
    CMP AL, 'z'  ; Check if AL <= 'z'
    JBE STORE_LETTER

CHECK_DIGIT:
    CMP AL, '0'  ; Check if AL >= '0'
    JB INPUT_LOOP  ; If not, ignore and continue
    
    CMP AL, '9'  ; Check if AL <= '9'
    JBE STORE_DIGIT

    JMP INPUT_LOOP  ; Ignore non-letter & non-digit characters

STORE_LETTER:
    MOV letters[SI], AL  ; Store letter
    INC SI  ; Increment index for letters
    INC Letter_Count  ; Increment letter count
    JMP INPUT_LOOP

STORE_DIGIT:
    MOV digits[DI], AL  ; Store digit
    INC DI  ; Increment index for digits
    INC Digit_Count  ; Increment digit count
    JMP INPUT_LOOP

END_INPUT:
    ; Display "Letters Count:"
    MOV DX, OFFSET msg2
    MOV AH, 09H
    INT 21H

    ; Display letter count
    MOV AL, Letter_Count
    AAM
    ADD AX, 3030H
    MOV DL, AH
    MOV AH, 02H
    INT 21H
    MOV DL, AL
    INT 21H

    ; Display "Digits Count:"
    MOV DX, OFFSET msg3
    MOV AH, 09H
    INT 21H

    ; Display digit count
    MOV AL, Digit_Count
    AAM
    ADD AX, 3030H
    MOV DL, AH
    MOV AH, 02H
    INT 21H
    MOV DL, AL
    INT 21H

    ; Display "Letters:"
    MOV DX, OFFSET msg4
    MOV AH, 09H
    INT 21H

    ; Print letters
    MOV CX, SI
    MOV BX, 0
PRINT_LETTERS:
    CMP BX, SI
    JGE PRINT_DIGITS
    MOV DL, letters[BX]
    MOV AH, 02H
    INT 21H
    INC BX
    JMP PRINT_LETTERS

PRINT_DIGITS:
    ; Display "Digits:"
    MOV DX, OFFSET msg5
    MOV AH, 09H
    INT 21H

    ; Print digits
    MOV CX, DI
    MOV BX, 0
PRINT_DIGIT_LOOP:
    CMP BX, DI
    JGE END_PROGRAM
    MOV DL, digits[BX]
    MOV AH, 02H
    INT 21H
    INC BX
    JMP PRINT_DIGIT_LOOP

END_PROGRAM:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN