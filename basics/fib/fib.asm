; all materials used can be found here: https://github.com/wzslr321/asm_learning_tour/tree/main/materials section .bss
section .bss
    
    decimal_number resb 1
    hundredth_number resb 2
    thousandth_number resb 2

section .data
    num1: db '12345'
    num2: db '23456'
    sum: db '     ' 

    message: db "First 17 fibonacci numbers are:", 0xA
    message_length equ $- message

    decimal_message: db "Numbers less than 10:", 0xA
    decimal_message_length equ $- decimal_message

    hundredth_message: db "Numbers less than 100:", 0xA
    hundredth_message_length equ $- hundredth_message

    thousandth_message: db "Numbers less than 1000:", 0xA
    thousandth_message_length equ $- thousandth_message

    number_decimal: db 0x9
    number_hundredth: dw 0x99
    number_thousandth: dw 0x999

    newline: db 0xA 

section .code

    global _start
_start:

    call _displayMessage

    mov esi, 4
    mov ecx, 5
    clc

    _addLoop:
        mov al, [num1 + esi]
        adc al, [num2 + esi]
        aaa
        pushf
        or al, 30h
        popf

    mov[sum+esi], al
    dec esi
    loop _addLoop

    mov eax, 0x4
    mov ebx, 1
    mov ecx, sum
    mov edx, 5
    int 0x80
    
    mov eax, 0x4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    _compareToDecimal:
        mov ah, [number_decimal]
        cmp ah, 9
        call _printDecimalMessage

    _compareToHundredth:
        mov ax, [number_hundredth]
        cmp ax, 99
        call _printHundredthMessage

    _compareToThousandth:
        mov ax, [number_thousandth]
        cmp ax, 999
        call _printThousandthMessage

section .text

    _displayMessage:
        mov eax, 0x4
        mov ebx, 1 
        mov ecx, message
        mov edx, message_length
        int 0x80
        ret

    _printThousandthMessage:
        mov eax, 0x4
        mov ebx, 1
        mov ecx, thousandth_message
        mov edx, thousandth_message_length
        int 0x80
        jmp _newLine
        ret

    _printHundredthMessage:
        mov eax, 0x4
        mov ebx, 1
        mov ecx, hundredth_message
        mov edx, hundredth_message_length
        int 0x80
        ret

    _printDecimalMessage:
        mov eax, 0x4
        mov ebx, 1
        mov ecx, decimal_message
        mov edx, decimal_message_length
        int 0x80
        ret

    _newLine:
        mov eax, 0x4
        mov ebx, 1
        mov ecx, newline ; using 0xA instead of declaerd newLine wouldn't work properly
        mov edx, 1
    
exit:
    mov eax, 0x1
    mov ebx, 0
    int 0x8
