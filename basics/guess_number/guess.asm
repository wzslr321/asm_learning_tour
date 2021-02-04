section .bss
    number resb 16

section .data 
    message: db "Guess a number from 1-9!", 0xA
    message_length equ $-message

    cb_message: db "Your guess is: "
    cb_message_length equ $- cb_message

    win_result_message: db "Congratulations, you guessed the number !", 0xA
    win_result_message_length equ $- win_result_message

global _start

section .text:
_start:
    call _showInformation
    call _showCbMsg
    call _showNumber
    call _winMsg

_showInformation:
    mov eax, 0x4
    mov ebx, 1
    mov ecx, message
    mov edx, message_length
    int 0x80

_getNumber:
    mov eax, 0x3
    mov ebx, 0
    mov ecx, number
    mov edx, 1
    int 0x80

_showCbMsg:
    mov eax, 0x4
    mov ebx, 1
    mov ecx, cb_message 
    mov edx, cb_message_length 
    int 0x80

_showNumber:
    mov eax, 0x4
    mov ebx, 1
    mov ecx, number
    mov edx, 1
    int 0x80

_winMsg: 
    mov eax, 0x4
    mov ebx, 1
    mov ecx, win_result_message
    mov edx, win_result_message_length
    int 0x80

exit:
    mov eax, 0x1
    mov ebx, 0
    int 0x80
