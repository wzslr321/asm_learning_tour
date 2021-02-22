section .data
    msg: db "Hello from first file", 0xA
    msg_length equ $- msg

section .code
    print_msg:
        mov eax, 0x4
        mov ebx, 1
        mov ecx, msg
        mov edx, msg_length
        int 0x80

  
