; all materials used can be found here: https://github.com/wzslr321/asm_learning_tour/tree/main/materials
section .bss
    number resb 100

 section .data
    message: db "How many fibonacci numbers do you want to print? (17 max)", 0xA
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
