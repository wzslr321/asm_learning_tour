section .code
    global _start
_start:

      call _optionMessage 
      call _getOption

      call _numMessage
      call _getStNum

      call _numMessage
      call _getNdNum

      _convertToInt:
        mov ah, [num1]
        sub ah, 30h 
        mov al, [num2]
        sub al, 30h 

      _calculateResult:
        add ah,al
        add ah, 30h
        mov [result],ah

     _compareOption:
        mov ax, [option]
        sub ax, 30h
        cmp ax, 0x4
        je _div
        cmp ah, 0x3
        je _mul
        cmp ah, 0x2
        je _sub

     _add:
        call _addMessage     
        call _resultMsg
        call _newLine

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

    _includeFiles:
      %include 'messages.asm'
      %include 'get_numbers.asm'

exit:
    mov eax, 0x1
    mov ebx, 0
    int 0x80
