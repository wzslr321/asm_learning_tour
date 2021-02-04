; .bss section contains statically-allocated variables that are declared
; but have not been assigned a value yet. In this case, 
; variable declared inside this section will contain user's input
section .bss
    password resb 8 ; reserve 8 bytes for a password variable, which value is going to be assigned

; .data section contains initialized static variables with value assigned
section .data 
    ; declarations below have already been described in hello-world example in this repository
    message: db "Enter a password! (torvalds) ", 0xA
    message_length equ $-message

    correct_password: db "torvalds"
    correct_password_length equ $-correct_password

    success_message: db "Congratulations, welcome!", 0xA
    success_message_length equ $-success_message

    fail_message: db "Unfortunetely, you aren't welcome here!", 0xA
    fail_message_length equ $-fail_message

; .text section contains ececutable instructions 
; To learn more about sections check out this site: https://docs.oracle.com/cd/E19455-01/806-3773/elf-3/index.html
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
        mov eax, 0x3 ; 0x3 is a read syscall
        mov ebx, 0 ; 0 is a stdin file descriptor
        mov ecx, password 
        mov edx, 8 ; use 8 as size argument, because 8 bytes was reserved for password variable
        int 0x80

    _checkPassword:
        mov eax, [password] ; use '[]'  to get value of variable
        cmp eax, [correct_password] ; compare values of password variable (eax) and hard_coded correct_password
        jne else ; jump to else if comparison returned false (jump if not equal)
        jmp _successMsg 
        ; if comparison returned true, it omitted line number 45
        ; entered password is correct, so jump to _succesMsg (line 62)
        ; instead of jump it may be possible to use 'call'.
        ; read about the difference between 'jmp' and 'call' here: https://stackoverflow.com/questions/32793117/assembly-call-vs-jmp
        else: ; it executes only if line 45 was executed
            jmp _failMsg ; jump to _failMsg (line 54), 

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
    
