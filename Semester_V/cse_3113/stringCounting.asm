; A Program for Counting Vowels, Consonants, Digits, and Spaces in a   String where each count<10 
;Vowels:5 Consonants:9 Digits:3 Spaces:5  

.model small
.stack 100h

.data
    inputStr db 'Enter a String: $' 
    vowelStr db 13,10, 'Vowels: $' 
    consonantStr db 13,10, 'Consonants: $'
    digitStr db 13,10, 'Digits: $'
    spaceStr db 13,10, 'Spaces: $'
    buffer db 100h dup(0)        
    vowels db 0
    consonants db 0
    digits db 0
    spaces db 0
    
.code
main proc     
    mov ax,@data
    mov ds,ax
    
    lea dx,inputStr
    mov ah,09h
    int 21h
    
    mov si,0
    
InputString:
    mov ah,01h
    int 21h
    mov buffer[si],al
    inc si
    
    cmp al,0Dh
    je PrintNumber
    
    cmp al,'0'-1
    jg DigitCount 
     
    inc spaces
    jmp InputString

DigitCount:
    cmp al,'9'
    jg AlphabetCount
    inc digits
    jmp InputString
    
AlphabetCount:
    cmp al, 'A'-1
    jg BigAlpha
    jmp InputString
    
BigAlpha:
    cmp al, 'Z'
    jg SmallAlpha 
    
    cmp al,'A'
    je VowelCount
    cmp al,'E'
    je VowelCount
    cmp al,'I'
    je VowelCount
    cmp al,'O'
    je VowelCount
    cmp al,'U'
    je VowelCount 
    
    inc consonants
    jmp InputString 
     
    
SmallAlpha:
    cmp al, 'a'-1
    jg SmallAlpha2
    jmp InputString

SmallAlpha2:
    cmp al, 'z'
    jg InputString
    cmp al,'a'
    je VowelCount
    cmp al,'e'
    je VowelCount
    cmp al,'i'
    je VowelCount
    cmp al,'o'
    je VowelCount
    cmp al,'u'
    je VowelCount 
    
    inc consonants
    jmp InputString      

VowelCount:
    inc vowels
    jmp InputString
    
PrintNumber:
    add vowels,30h
    add consonants,30h
    add spaces,30h 
    add digits,30h
    
    lea dx,vowelStr
    mov ah, 09h
    int 21h
    
    mov al,vowels
    call PrintDigit
    
    lea dx,consonantStr
    mov ah, 09h
    int 21h
    
    mov al,consonants
    call PrintDigit
    
    lea dx,digitStr
    mov ah, 09h
    int 21h
    
    mov al,digits
    call PrintDigit
    
    lea dx,spaceStr
    mov ah, 09h
    int 21h
    
    mov al,spaces
    call PrintDigit
    

EndProgram:
    mov ah, 4Ch
    int 21h
    
main endp
PrintDigit proc
   mov dl,al
   mov ah, 02h
   int 21h
   ret 
PrintDigit endp
end main
