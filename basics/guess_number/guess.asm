section .bss
    password resb 8

section .data 
    message: db "Enter a password of 8 characters !", 0xA
    message_length equ $-message

    correct_password: db "torvalds"
    correct_password_length equ $-correct_password

    success_message: db "Congratulations, welcome!", 0xA
    success_message_length equ $-success_message

    fail_message: db "Unfortunetely, you aren't welcome here!", 0xA
    fail_message_length equ $-fail_message


section .text:
    global _start
_start:

    _showInformation:
        mov eax, 0x4
        mov ebx, 1
        mov ecx, message
        mov edx, message_length
        int 0x80

    _getPassword:
        mov eax, 0x3
        mov ebx, 0
        mov ecx, password
        mov edx, 8
        int 0x80

    _checkPassword:
        mov eax, [password]
        cmp eax, [correct_password]
        jne else
        jmp _successMsg
        else:
            call _failMsg

    _failMsg:
        mov eax, 0x4
        mov ebx, 1
        mov ecx, fail_message
        mov edx, fail_message_length            
        int 0x80
        jmp exit

    _successMsg:
        mov eax, 0x4
        mov ebx, 1
        mov ecx, success_message
        mov edx, success_message_length
        int 0x80

exit:
    mov eax, 0x1
    mov ebx, 0
    int 0x80


