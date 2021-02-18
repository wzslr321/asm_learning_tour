section .bss
    num resb 1;  allocate 1 byte for a num variable

section .data
    newline: db 0xA

section .code
    global _start ; nasm specific
_start:

    _setValues:
        mov ecx, 7; set 7 as counter for the loop
        mov ax, '0'; init 1st num with '0'
        mov dx, '1'; init 2nd num with '1'

        ; int 3 ; debug breakpoint
        ; registers ax and dx as characters, so it debug here are 0x30 and 0x31

    _repeat:
        push ecx ; push ecx on stack to have loop info
        mov [num], ax

        ; push ax on the stack;  it secures from being overwritten by int0x80
        push ax
        push dx

        ; Currently '1' is on the top of a stack, '0' is between and 7 from ecx is last.

    ; first loop doesn't require any arithmetic and pop from the stack, so num is printed before.
    _printNum:
        mov eax, 0x4
        mov ebx, 1
        mov ecx, num
        mov edx, 1
        int 0x80

    _popValues:
        pop dx
        pop ax

    ; int 3 ; debugger shows the same values as before, 0x30 and 0x31.

    sub dx, 30h
    sub ax, 30h

    ; int 3
    ; after substraction, debugger shows properly its values as integers - 0x0 and 0x1

    _alghoritm:
        add ax, dx
        mov [num], ax
        mov ax, dx
        mov dx, [num]

    add ax, 30h
    add dx, 30h

    pop ecx
    loop _repeat

    _newLine:
      mov eax, 0x4
      mov ebx, 1
      mov ecx, newline
      mov edx, 1
      int 0x80

exit:
    mov eax, 0x1
    mov ebx, 0
    int 0x80
