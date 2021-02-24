section .code

    _addValues:
        add eax, edx
        add eax, 30h
        mov [result], eax
        ret
    
    _subValues:
        sub eax, edx
        add eax,30h
        mov [result], eax
        ret

    ; Multiply and Divide doesn't work the same way as add and substract
    ; I recommend to read about it here: https://docs.oracle.com/cd/E19455-01/806-3773/6jct9o0am/index.html
    _mulValues:
        mul edx 
        add eax, 30h
        mov [result], eax
        ret

    _divValues:
        xor edx, edx
        div ebx
        add eax,30h
        mov [result], eax
        ret
        
