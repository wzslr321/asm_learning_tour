section .bss
    number resb 1 

 section .data
    message: db "Print 1-9", 0xA
    message_length equ $-message
    newline: db 0xA
    
 section .text
    global _start
 _start:

    _displayMessage:
        mov eax, 0x4
        mov ebx, 1 
        mov ecx, message
        mov edx, message_length
        int 0x80

    _setCounter:
        mov ecx, 9
        mov eax, '1'

    _repeat:
        push ecx
        mov [number], eax

    _printNumber:
        mov eax, 4
        mov ebx, 1
        mov ecx, number
        mov edx, 1
        int 0x80
    _increase:
        mov eax, [number]
        inc eax
        pop ecx
        loop _repeat

    _newLine:
        mov eax, 4
        mov ebx, 1
        mov ecx, newline

exit:
    mov eax, 0x1
    mov ebx, 0
    int 0x80


