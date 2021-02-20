section .bss
    option resb 1

section .data
    msg: db "Press: 1 - add | 2 - substract | 3 - multiply | 4 - divide", 0xA
    msg_length equ $- msg

    newLine: db 0xA

section .code
    global _start
_start:
    call info_message

    _getOptionNum:
      mov eax, 0x3
      mov ebx, 0
      mov ecx, option
      mov edx, 1
      int 0x80

    _printOptionNum:
      mov eax, 0x4
      mov ebx, 1
      mov ecx, option
      mov edx, 1
      int 0x80
  
    call _newLine
    
exit:
    mov eax, 0x1
    mov ebx, 0
    int 0x80

section .text
    info_message:
      mov eax, 0x4
      mov ebx, 1
      mov ecx, msg
      mov edx, msg_length
      int 0x80
      ret
      
    _newLine:
      mov eax, 0x4
      mov ebx, 1
      mov ecx, newLine
      mov edx, 1
      int 0x80
      ret

