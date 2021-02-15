section .bss
    num resb 1
    sum resb 1 

section .data
    newline: db 0xA
    num1 db '12345'
    num2 db '12345'

section .code
    global _start
_start:
    mov esi, 4
    mov ecx, 5
    clc

  _add_loop:

    mov al, [num1 + esi]
    adc al, [num2 + esi]
    aaa
    pushf
    or al, 30h
    popf

    mov[sum + esi], al
    dec esi
    loop _add_loop
    
    mov eax, 0x4
    mov ebx, 1
    mov ecx, sum
    mov edx, 5
    int 0x80

    _newLine:
      mov eax, 0x4
      mov ebx, 1
      mov ecx, newline
      mov edx, 1
      int 0x80


_exit:
  mov eax, 0x1
  mov ebx, 0
  int 0x80
