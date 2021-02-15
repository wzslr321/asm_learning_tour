section .bss
    num resb 1

section .data
    newline: db 0xA 

section .code
    global _start
_start:

    _setValues:
        mov ecx, 7; loop 7 times
        mov ax, '0'; init 1st num with 0
        mov dx, '1'; init 2nd num with 1

        ; int 3 ; debug breakpoint 
        ; registers ax and dx as characters, so it debug here are 0x30 and 0x31

    _repeat:
        push ecx ; push ecx on stack to have loop info
        mov [num], ax; [num] = '0' ; num = '1'

        push ax; push ax on the stack; ax = '0' ; it secures from being overwritten by int0x80
        push dx; push dx on the stack; ax = '1'

    _printNum:
        mov eax, 0x4
        mov ebx, 1
        mov ecx, num ; print num
        mov edx, 1
        int 0x80

    _popValues:
        pop dx ; copy top of the stack (dx); dx = '1'
        pop ax ; copy top of the stack (ax); ax = '0'

    ; int 3 ; debugger shows the same values as before, 0x30 and 0x31.
        
    sub dx, 30h; ebx = 1; 
    sub ax, 30h; eax = 0; 
    ; sub 0x30 from dx, and ax to make it possible to add them
    
    ; int 3
    ; after substraction, debugger shows properly its values as integers - 0x0 and 0x1

    _alghoritm:
        add ax, dx; eax = 1; 
        mov [num], ax; [num] = 1; 

        mov ax, dx;  eax = 1; 
        add ax, 30h ; eax = '1';
        mov dx, [num] ; ebx = 1; 
        add dx, 30h; ebx = '1'; 

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
