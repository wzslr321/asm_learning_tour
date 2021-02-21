section .bss
    option resb 1
    num1 resb 1
    num2 resb 1

section .data
    option_msg: db "Press: 1 - add | 2 - substract | 3 - multiply | 4 - divide", 0xA
    option_msg_length equ $- option_msg

    num_msg: db "Enter first number", 0xA
    num_msg_length equ $- num_msg
    
    add_msg: db "Add", 0xA
    add_msg_length equ $- add_msg 
    
    sub_msg: db "Substract", 0xA
    sub_msg_length equ $- sub_msg

    mul_msg: db "Multiply", 0xA
    mul_msg_length equ $- mul_msg
    
    div_msg: db "Divide", 0xA
    div_msg_length equ $- div_msg

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
      call _addMessage
      jmp exit

    _sub:
      call _subMessage
      jmp exit

    _mul:
      call _mulMessage
      jmp exit
    
    _div:
      call _divMessage
      jmp exit

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

    _addMessage:
      mov eax, 0x4
      mov ebx, 1
      mov ecx, add_msg
      mov edx, add_msg_length
      int 0x80
      ret

    _subMessage:
      mov eax, 0x4
      mov ebx, 1
      mov ecx, sub_msg
      mov edx, sub_msg_length
      int 0x80
      ret

    _mulMessage:
      mov eax, 0x4
      mov ebx, 1
      mov ecx, mul_msg
      mov edx, mul_msg_length
      int 0x80
      ret

    _divMessage:
      mov eax, 0x4
      mov ebx, 1
      mov ecx, div_msg
      mov edx, div_msg_length
      int 0x80
      ret

    _newLine:
      mov eax, 0x4
      mov ebx, 1
      mov ecx, newLine
      mov edx, 1
      int 0x80
      ret
