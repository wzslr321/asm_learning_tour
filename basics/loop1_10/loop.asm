; all materials used can be found here: https://github.com/wzslr321/asm_learning_tour/tree/main/materials
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
        mov ecx, 9 ; repeat 9 time
        mov eax, '1' ; set initial value to 1

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
        inc eax ; increment eax initialized with 1 in _setCounter
        pop ecx ; copy ecx from the stack 
        ; quick information about inc and pop can be found here: https://stackoverflow.com/questions/4584089/what-is-the-function-of-the-push-pop-instructions-used-on-registers-in-x86-ass
        loop _repeat ; short explanation of loop can be found here: https://forum.nasm.us/index.php?topic=2177.0

    _newLine:
        mov eax, 4
        mov ebx, 1
        mov ecx, newline ; using 0xA instead of declaerd newLine wouldn't work properly
        mov edx, 1
        int 0x80

exit:
    mov eax, 0x1
    mov ebx, 0
    int 0x80
