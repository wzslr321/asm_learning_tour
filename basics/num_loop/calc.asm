; Sources and materials used are available here: https://github.com/wzslr321/asm_learning_tour/tree/main/materials
section .bss
    num resb 1
    sum resb 1 

section .data
    newline: db 0xA
    num1 db '12345'
    num2 db '12345'
    num_length equ $- num1

section .code
    global _start
_start:
    mov esi, 4
    ; SI = Source Index.
    ; esi register is often used as a pointer. It often stores data that is used throughout a function , because it doesn't change

    mov ecx, 5
    clc ; Clear Carry Flag - set CF flag to 0, other flags are unaffected.

    _addLoop:

        mov al, [num1 + esi]
        adc al, [num2 + esi]
        ; adc = Add With Carry behaves similarly to add, but it also adds the value of carry flag ( 0 or 1)

        aaa
        ; aaa = ASCII Adjust After Addition
        ; "Adjusts the sum of two unpacked BCD values to create an unpacked BCD result. The AL register is the implied source and destination operand for this instruction. "
        ; "The AAA instruction is only useful when it follows an ADD instruction that adds (binary addition) two unpacked BCD values and stores a byte result in the AL register."
        ; "The AAA instruction then adjusts the contents of the AL register to contain the correct 1-digit unpacked BCD result."
        ; "If the addition produces a decimal carry, the AH register increments by 1, and the CF and AF flags are set. If there was no decimal carry, the CF and AF flags are cleared"
        ; "and the AH register is unchanged. In either case, bits 4 through 7 of the AL register are set to 0."
        ; source : https://www.felixcloutier.com/x86/aaa

        pushf ; push flag register onto stack
        or al, 30h
        ; or performs bitwise inclusive OR operation between ( in this case ), al and 30h, than stores a value in al.
        ; Each bit of the result of the OR instruction is set to 0 if both corresponding bits of the first and seconds operands are 0, otherwise each bit is set to 0.
        ; Clears OF and CF flags SF,ZF AND PF flags are set according to the result. State of AF flag is undefined
        ; I recommend to read more about flags here: https://en.wikipedia.org/wiki/FLAGS_register

        popf
        ; Pop stack  into flag.
        ; pops the word or long from the top of the stack and stores the value in the flags register.
        ; Stores a word in flags, long in Eflags
        ; https://docs.oracle.com/cd/E19455-01/806-3773/instructionset-10/index.html

        mov[sum + esi], al; use esi register to add proper nums on the iterations
        dec esi; decrement
        loop _addLoop

        mov ax, [sum]

    _printSum:
        mov eax, 0x4
        mov ebx, 1
        mov ecx, sum
        mov edx, num_length
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
