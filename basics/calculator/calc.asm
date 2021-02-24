section .code
    global _start
_start:
      call _optionMessage ; messages.asm file
      call _getOption ; get_numbers.asm file

      call _numMessage; messages.asm file
      call _getStNum; get_numbers.asm file

      call _numMessage; messages.asm file
      call _getNdNum; get_numbers.asm file

     ; Check what calculation user wants to do and jump
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
        mov eax, [num1] 
        sub eax, 30h
        mov edx, [num2]
        sub edx, 30h

        ; every calculation function is in functions.asm file
        call _addValues
        call _addMessage     
        call _resultMsg
        jmp _newLine

    _sub:
        mov eax, [num1] 
        sub eax, 30h
        mov edx, [num2]
        sub edx, 30h

        call _subValues
        call _subMessage
        call _resultMsg
        jmp _newLine

    _mul:
       mov eax, [num1]
       mov edx, [num2]
       sub eax, 30h
       sub edx, 30h

       call _mulValues
       call _mulMessage
       call _resultMsg
       jmp _newLine
    
    _div:
       mov eax, [num1]
       mov ebx, [num2] 
       sub eax, 0xA30
       sub ebx, 0xA30 
       call _divValues
       call _divMessage
       call _resultMsg
       jmp _newLine

   _includeFiles:
      %include 'messages.asm'
      %include 'get_numbers.asm'
      %include 'functions.asm'
    
    _newLine:
      mov eax, 0x4
      mov ebx, 1
      mov ecx, newLine
      mov edx, 1
      int 0x80

exit:
    mov eax, 0x1
    mov ebx, 0
    int 0x80
