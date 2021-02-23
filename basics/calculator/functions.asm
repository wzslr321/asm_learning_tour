section .bss
    val1 resb 1
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
        
