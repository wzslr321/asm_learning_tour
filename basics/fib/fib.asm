; all materials used can be found here: https://github.com/wzslr321/asm_learning_tour/tree/main/materials section .bss

 section .data

    message: db "First 17 fibonacci numbers are:", 0xA
    message_length equ $-message

    decimal_message: db "Numbers less than 10:", 0xA
    decimal_message_length equ $-decimal_message

    number_decimal: db 0x10
    number_hundredth: dw 0x100

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

    _compareToDecimal:
        mov ah, [number_decimal]
        cmp ah, 0x9
        jle _printNumber
        jmp exit
        int 0x80

    _printNumber:
        mov eax, 0x4
        mov ebx, 1
        mov ecx, decimal_message
        mov edx, decimal_message_length
        int 0x80
        
    _newLine:
        mov eax, 0x4
        mov ebx, 1
        mov ecx, newline ; using 0xA instead of declaerd newLine wouldn't work properly
        mov edx, 1

exit:
    mov eax, 0x1
    mov ebx, 0
    int 0x80
