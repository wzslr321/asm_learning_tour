section .bss
    option resb 1
    num1 resb 4
    num2 resb 4 
    result resb 4

section .code
    _getOption:
        mov eax, 0x3
        mov ebx, 0
        mov ecx, option 
        mov edx, 2
        int 0x80
        ret

    _getStNum:
        mov eax, 0x3
        mov ebx, 0
        mov ecx, num1
        mov edx, 2
        int 0x80 
        ret

    _getNdNum:
        mov eax, 0x3
        mov ebx, 0
        mov ecx, num2
        mov edx, 2
        int 0x80
        ret
        
