section .code
    _convertValues:
        mov ah, [num1] 
        sub ah, 30h
        mov al, [num2]
        sub al, 30h
        ret 

    _addValues:
        add ah,al
        add ah, 30h
        mov [result], ah
        ret
    
    _subValues:
        sub ah,al
        add ah,30h
        mov [result],ah 
        ret

    _mulValues:
        mul ah
        add al, 30h
        mov [result], al
        ret

    _divValues:
       ; div ah
       ; int 3
       ; add al,30h
       ; mov [result],al
       ; ret
       ; not working :()
        
