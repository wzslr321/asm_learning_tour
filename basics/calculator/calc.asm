section .bss
    option resb 1
    num1 resb 1
    num2 resb 1

section .data
    option_msg: db "Press: 1 - add | 2 - substract | 3 - multiply | 4 - divide", 0xA
    option_msg_length equ $- option_msg

    num_msg: db "Enter first number", 0xA
    num_msg_length equ $- num_msg

    newLine: db 0xA

section .code
    global _start
_start:

      call _optionMessage 

      _getOption:
        mov eax, 0x3
        mov ebx, 0
        mov ecx, option 
        mov edx, 2
        int 0x80

      call _numMessage
      _getStNum:
        mov eax, 0x3
        mov ebx, 0
        mov ecx, num1
        mov edx, 2
        int 0x80 
      
      call _numMessage
      _getNdNum:
        mov eax, 0x3
        mov ebx, 0
        mov ecx, num2
        mov edx, 2
        int 0x80

      _compareOption:
        mov ah, [option]
        sub ah, 30h
        cmp ah, 0x4
        je _div
        cmp ah, 0x3
        je _mul
        cmp ah, 0x2
        je _sub

    _add:

    _sub:

    _mul:
    
    _div:

    _printNum:

exit:
    mov eax, 0x1
    mov ebx, 0
    int 0x80

section .text
    _optionMessage:
      mov eax, 0x4
      mov ebx, 1
      mov ecx, option_msg 
      mov edx, option_msg_length
      int 0x80
      ret

    _numMessage:
      mov eax, 0x4
      mov ebx, 1
      mov ecx, num_msg
      mov edx, num_msg_length
      int 0x80
      ret

    _newLine:
      mov eax, 0x4
      mov ebx, 1
      mov ecx, newLine
      mov edx, 1
      int 0x80
      ret
