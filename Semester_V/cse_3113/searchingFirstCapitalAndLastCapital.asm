.model small
.stack 100h

.data
    inputStr db 'Enter a String: $'
    firstLetter db 13,10, 'The First Capital Letter is: $'
    lastLetter db 13,10, 'The Last Capital Letter is: $'
    notLetter db 13,10, 'Not Found Any Character$'
    first db '['
    last db '@'

.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea dx, inputStr
    mov ah, 09h
    int 21h
    
InputString:
    mov ah, 01h
    int 21h
    
    cmp al,0Dh
    je PrintResult
    
    cmp al, 'A'
    jl InputString
    
    cmp al, 'Z'
    jg InputString
    
    cmp al,first
    jge LastChar 
    
    mov first,al
    
    ;jmp InputString ... not this line
    
LastChar:
    cmp al, last
    jle InputString
    
    mov last, al
    jmp InputString
    
PrintResult:
    cmp first,'['
    jne PrintFirstLast
    
    lea dx,notLetter
    mov ah,09h
    int 21h   
    
    jmp EndProgram
     
    
PrintFirstLast:
    lea dx,firstLetter
    mov ah,09h
    int 21h
    mov dl,first
    mov ah, 02h
    int 21h 
           
    lea dx,lastLetter
    mov ah,09h
    int 21h
    mov dl,last
    mov ah, 02h
    int 21h
    
EndProgram:
    mov ah, 4Ch
    int 21h
    
main endp
end main
