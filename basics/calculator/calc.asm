section .code
    global _start
_start:

      call _optionMessage 
      call _getOption

      call _numMessage
      call _getStNum

      call _numMessage
      call _getNdNum

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
        call _convertValues
        call _addValues
        call _addMessage     
        call _resultMsg
        jmp _newLine

    _sub:
        call _convertValues
        call _subValues
        call _subMessage
        call _resultMsg
        jmp _newLine

    _mul:
       call _convertValues
       call _mulValues
       call _mulMessage
       call _resultMsg
       jmp _newLine
    
    _div:
       call _convertValues
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
