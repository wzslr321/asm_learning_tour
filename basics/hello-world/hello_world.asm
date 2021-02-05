; all used materials can be found here: https://github.com/wzslr321/asm_learning_tour/tree/main/materials

; section is the smallest unit of an object file that can be relocated
; https://docs.oracle.com/cd/E19455-01/806-3773/elf-3/index.html

global _start ; global directive is a NASM specific, to show what needs to be execute
; More complex explanation can be found here : https://stackoverflow.com/questions/17898989/what-is-global-start-in-assembly-language

section .text:
_start:
    mov eax, 0x4 ; move ( copy ) the data item  referred to by its second oprand
    ; eax = extended - 32 bit version of AX register
    ; 0x4 is a write syscall
    ; All syscalls can be found in unistd_32.h file

    ; in man-pages it is showed what arguments does the 'write' needs
    ; 'man 2 write' command shows a description which contains :
    ; ssize_t write(int fd, const void *buf, size_t count);
    ; It is needed to specify file descriptor, buffer and size

    ; Explanation of what is file descriptor: 
    ; A file descriptor is a 16-bit integer assigned to a file as a file id.
    ; When a new file is created or an existing file is opened,
    ; the file descriptor is used for accessing the file.
    ; File descriptor of the standard file streams - stdin, stdout and stderr are 0, 1 and 2, respectively.

    mov ebx, 1 ; use stdout(1) as the file descriptor (fd showed above)
    mov ecx, message ; use the message as the buffer
    mov edx, message_length ; use message_length variable as size argument
    int 0x80 ; instruction that is used to invoke system calls 
    ; int in assembly doesn't mean integer but interrupt!

    ; gracefully exit the program
exit:
    mov eax, 0x1 ; exit syscall, found in unistd_32.h file as before.
    mov ebx, 0 ; return value similar to C - return 0, which means that program succeed
    int 0x80

section .data: 
    message: db "Hello world!", 0xA ; db - declare bytes - declare variable message, 0xA is a '\n' - new line
    message_length equ $-message ; message_length variable equals (equ) to length ($-) of message variable. 


